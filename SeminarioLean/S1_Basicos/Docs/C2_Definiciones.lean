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
