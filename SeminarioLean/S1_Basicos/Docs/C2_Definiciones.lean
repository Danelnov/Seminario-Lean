-- Definir constantes
def mi_nombre := "Esteban"
def mi_edad := 33
def casado := false

-- Lean infiere automáticamente el tipo de las variables
#check mi_nombre
#check mi_edad

-- El comando #eval evalúa y muestra el valor
#eval mi_edad
#eval casado

-- También es posible, y a menudo recomendado, indicar el tipo explícitamente
def mi_nombre' : String := "Esteban"
def mi_edad' : Nat := 33
def casado' : Bool := false

-- Las definiciones también se usan para declarar funciones
-- Sintaxis: def nombre (arg1 : Tipo) (arg2 : Tipo) ... : TipoRetorno := ...
def mayor_edad (edad : Nat) : Bool :=
  if edad >= 18 then true
  else false

-- La aplicación de funciones difiere de los lenguajes tradicionales.
-- En lugar de escribir: funcion(arg1, arg2)
-- En Lean escribimos:   funcion arg1 arg2
-- Es decir, sin paréntesis para agrupar los argumentos y separados por espacios.
#eval mayor_edad 12
#eval mayor_edad 32

-- Las funciones también tienen un tipo asociado
#check mayor_edad
#check @mayor_edad

def descuento (porcentaje : Nat) (precio : Nat) : Nat :=
  precio - precio * porcentaje / 100

#eval descuento 10 10000
#check @descuento

/-
  CURRIFICACIÓN (Currying):
  En Lean, una función que conceptualmente toma múltiples argumentos,
  en realidad se construye para recibir un argumento a la vez.

  Si usamos el comando #check con la función anterior, veremos su tipo:
  `descuento : Nat → Nat → Nat`

  En Lean, las flechas se asocian hacia la derecha de forma predeterminada.
  Es decir, el compilador interpreta ese tipo matemáticamente así:
  `descuento : Nat → (Nat → Nat)`

  Esto significa que `descuento` es, en esencia, una función que recibe un
  primer número y retorna UNA NUEVA FUNCIÓN de tipo `Nat → Nat`
  (la cual se encargará de recibir el segundo número).

  Por lo tanto, si a una función le pasamos menos argumentos de los que
  "aparentemente" necesita, el sistema no genera un error. Simplemente
  devuelve la función restante. A este proceso de aplicación parcial
  se le llama **currificación**.
-/

-- Aquí aplicamos la función parcialmente proporcionando solo el primer argumento (descuento = 10)
def descuento_del_10 := descuento 10

-- Observa como el tipo resultante es una función que recibe un solo entero (Nat → Nat)
#check @descuento_del_10

-- Ahora podemos usar esta nueva función pasando el argumento restante
#eval descuento_del_10 500
#eval descuento_del_10 256

-- De una sola función podemos obtener muchas funciones
def mitad_de_precio := descuento 50

#eval mitad_de_precio 100
#eval mitad_de_precio 870


/-
  FUNCIONES ANÓNIMAS (Expresiones Lambda):
  En Lean es posible definir funciones sin asignarles explícitamente un nombre.
  Estas se conocen como funciones anónimas o expresiones lambda.

  La sintaxis general para crear una función anónima es:
    fun arg1 arg2 ... => expresión

  O equivalentemente usando la notación lambda `λ`:
    λ arg1 arg2 ... => expresión

  Son especialmente útiles cuando queremos pasar una función corta como parámetro
  a otra función (funciones de orden superior) sin necesidad de declararla
  previamente con `def`.
-/

-- Comprobamos el tipo de una función anónima directamente
#check (fun x y => 2 * x + y)

-- Ejemplo de función de orden superior: recibe una función `f` y un valor `x`,
-- y aplica `f` dos veces sobre `x`.
def aplicar_dos (f : Nat → Nat) (x : Nat) : Nat := f (f x)

-- Pasamos una función anónima (fun x => x * x) como argumento a `aplicar_dos`:
#eval aplicar_dos (fun x => x * x) 2


/-
  TODA FUNCIÓN ES UNA FUNCIÓN ANÓNIMA:
  En la teoría fundamental de Lean (Cálculo de Construcciones / Lambda Cálculo),
  la declaración de funciones con `def nombre (arg : Tipo) := ...` es simplemente
  azúcar sintáctico (syntactic sugar) sobre las funciones anónimas (`fun`).

  De hecho, definir una función con múltiples argumentos utilizando la sintaxis convencional
  es exactamente equivalente a asignar una función anónima anidada a un nombre.
-/

-- Definición equivalente usando una función anónima que toma ambos argumentos:
def descuento' : Nat → Nat → Nat :=
  fun porcentaje precio =>
    precio - precio * porcentaje / 100

-- Definición equivalente explicitando la currificación mediante funciones anónimas anidadas:
def descuento'' : Nat → Nat → Nat :=
  fun porcentaje => fun precio =>
    precio - precio * porcentaje / 100


/-
  PARES ORDENADOS (Producto Cartesiano):
  En Lean, el tipo `A × B` (que se escribe usando `\times` o `\x`) representa
  el tipo de los pares ordenados, equivalente al producto cartesiano A × B.

  - La primera componente debe ser de tipo `A`.
  - La segunda componente debe ser de tipo `B`.

  Un término de tipo `A × B` se escribe mediante paréntesis `(a, b)`.

  Acceso a las componentes (proyecciones):
  Dado un par `p : A × B`:
  - `p.1` obtiene el primer elemento de tipo `A`.
  - `p.2` obtiene el segundo elemento de tipo `B`.
-/

-- Verificamos el tipo de algunos pares ordenados
#check (1, 2)
#check (3.1415, true)

-- Definimos un par constante
def mi_par : Nat × Nat := (1, 3)

-- Accedemos a sus componentes con las proyecciones .1 y .2
#eval mi_par.1
#eval mi_par.2


/-
  FUNCIONES SOBRE PARES ORDENADOS:
  Las funciones que toman como argumento un par ordenado `p : A × B` se asemejan
  más a la notación tradicional de las funciones matemáticas f(x, y).

  A diferencia de las funciones currificadas (que reciben argumentos uno a uno),
  una función sobre un par recibe ambos componentes empaquetados en una sola estructura.
-/

-- Función que intercambia los elementos de un par ordenado
def intercambiar (p : Nat × Nat) : Nat × Nat := (p.2, p.1)

#eval intercambiar (1, 2)

-- Función que suma las componentes de un par ordenado
def sumar (p : Nat × Nat) : Nat := p.1 + p.2

#eval sumar (5, 7)
#eval sumar (intercambiar (5, 7))

