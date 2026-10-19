import VersoSlides

open VersoSlides

#doc (VersoSlides.Slides) "Definiciones" =>

%%%
vertical := some true
%%%

:::attr (style := "text-align: left")
Para declarar una constante en Lean 4, utilizamos la siguiente notación:
:::

```lean -panel -stretch
def mi_nombre := "Esteban"
def mi_edad := 33
def casado := false
```

:::attr (style := "text-align: left")
También podemos declarar la constante junto con su tipo:
:::

```lean -panel -stretch
def mi_nombre' : String := "Esteban"
def mi_edad' : Nat := 33
def casado' : Bool := false
```

# EJERCICIO

%%%
backgroundColor := "#4d7e65"
%%%

::::attr (style := "text-align: left")
  :::fitText
  Define una constante que contenga el valor de $`\pi`.
  Luego, define otras variables que contengan los valores de $`\pi / 2` y $`\pi / 3`.
  :::

  ```lean -panel -stretch
  -- !fragment
  def pi : Float := 3.1415
  def pi2 : Float := pi / 2
  def pi3 : Float := pi / 3
  ```
::::

# Definir funciones

:::attr (style := "text-align: left")
Para declarar una función, se utiliza la misma sintaxis que para las constantes.
:::

```
def nombre (arg1 : Tipo) (arg2 : Tipo) ... : TipoRetorno := ...
```

:::attr (style := "text-align: left")
Por ejemplo:
:::

```lean -panel -stretch
def promedio (x y : Float) : Float := (x + y) / 2

def mayor_edad (edad : Nat) : Bool :=
  if edad >= 18 then true
  else false
```

# Aplicación de funciones

:::attr (style := "text-align: left; font-size: 24px;")
La aplicación de funciones difiere de la de los lenguajes tradicionales. En lugar de escribir `funcion(arg1, arg2)`,
en Lean escribimos `funcion arg1 arg2`.
:::

```lean -panel -stretch
#eval mayor_edad 15
#eval mayor_edad 21
#eval promedio 2 5
```

# EJERCICIO

%%%
backgroundColor := "#4d7e65"
%%%

::::attr (style := "text-align: left; font-size: 24px;")
  Define una función llamada `area` que calcule el área de un rectángulo.
  A partir de esta función, define otra que calcule el área de un cuadrado.

  ```lean -panel -stretch
  -- !fragment
  def area (a b : Nat) : Nat := a * b
  -- !fragment
  def area' (x y : Float) : Float :=
    if x < 0 || y < 0 then 0
    else x * y
  -- !fragment
  #eval area' (-2) 4.7
  #eval area' 4.7 3.1
  -- !fragment
  def area_cuadrado (lado : Float) := area' lado lado
  ```
::::

# Tipos flecha

::::attr (style := "text-align: left")
  :::fitText
  En Lean, el tipo $`A \to B` representa el tipo de todas las funciones que toman
  un término de tipo $`A` y devuelven términos de tipo $`B`. Por ejemplo, la función
  {lean}`mayor_edad` tiene tipo `Nat → Bool`.
  :::
::::

```lean -panel -stretch
#check mayor_edad
#check @mayor_edad
```

:::attr (style := "text-align: left; font-size: 24px;")
  Ahora consideremos la siguiente función, que recibe dos argumentos.
  ¿Puedes adivinar cuál es el tipo de esta función?
:::

```lean -panel -stretch
def descuento (porcentaje precio : Nat) : Nat :=
  precio - precio * porcentaje / 100
```

# Currificación

:::attr (style := "text-align: left; font-size: 24px;")
El tipo de {lean}`descuento` no es `Nat × Nat → Nat`, como puede intuir un matemático.
:::

```lean -panel -stretch
#check @descuento
```

:::attr (style := "text-align: left; font-size: 24px;")
En Lean, las flechas se asocian hacia la derecha.
Es decir, el compilador interpreta ese tipo matemáticamente así:
`descuento : Nat → (Nat → Nat)`.

Esto significa que `descuento` es, en esencia, una función que recibe un
primer número y devuelve *una nueva función* de tipo `Nat → Nat`.

A esta técnica se le llama currificación.
:::

# Una función, muchas funciones

:::attr (style := "text-align: left; font-size: 24px;")
Gracias a la currificación, a partir de una sola función podemos crear muchas otras
sin necesidad de escribir mucho código.
:::

```lean -panel -stretch
def descuento_del_10 := descuento 10

#check @descuento_del_10
#eval descuento_del_10 256
def mitad_de_precio := descuento 50

#eval mitad_de_precio 100
#eval mitad_de_precio 870
```

# Una comparación

```code python
def descuento(porcentaje):
  def descuento2(precio):
    return precio - precio * porcentaje / 100

  return descuento2

mitad_de_precio = descuento(50)
print(mitad_de_precio(100))
```

# EJERCICIO

%%%
backgroundColor := "#4d7e65"
%%%

:::attr (style := "text-align: left; font-size: 24px;")
  Definir una función que calcule el área de un triángulo de lados $`a, b` y con un ángulo $`\theta`.

  La fórmula para calcular el área de un triángulo es $`\frac{1}{2} (a \times b \times \sin \theta)`.

  Para usar la función seno en Lean, utilizamos {lean}`Float.sin`.
:::

```lean -panel -stretch
-- !fragment
def area_triangulo (θ a b : Float) : Float :=
  (a * b * Float.sin θ) / 2
```

# EJERCICIO

%%%
backgroundColor := "#4d7e65"
%%%

:::attr (style := "text-align: left; font-size: 24px;")
  Definir una función que calcule el área de un triángulo rectángulo (90°) y equilátero (60°).
:::

```lean -panel -stretch
-- !fragment
def area_recto := area_triangulo pi2
-- !fragment
def area_equilatero := area_triangulo pi3
```

# Funciones anónimas

Las funciones anónimas permiten crear funciones que no tienen asociado un nombre.

```lean -panel -stretch
#check (fun x y => 2 * x + y)

def aplicar_dos (f : Nat → Nat) (x : Nat) : Nat := f (f x)

#eval aplicar_dos (fun x => x*x) 2
```

# Toda función es una anónima

En las bases fundamentales de lean toda función es en realidad una función anonima.

```lean -panel -stretch
def descuento' : Nat → Nat → Nat :=
  fun porcentaje precio =>
    precio - precio * porcentaje / 100

-- !fragment
def desceunto'' : Nat → Nat → Nat :=
  fun porcentaje => fun precio =>
    precio - precio * porcentaje / 100
```

# EJERCICIO

%%%
backgroundColor := "#4d7e65"
%%%

:::attr (style := "text-align: left; font-size: 24px;")
  A partir de la función {lean}`aplicar_dos`, define una función que aplique cuatro veces una función `f : Nat → Nat`.
:::

```lean -panel -stretch
-- !fragment
def aplicar_cuatro (f : Nat → Nat) (x : Nat) : Nat :=
-- !fragment
  aplicar_dos (fun y => f (f y)) x

-- !fragment
def aplicar_cuatro' (f : Nat → Nat) (x : Nat) : Nat :=
  aplicar_dos (aplicar_dos f) x

--!fragment
#eval aplicar_cuatro (fun x => x + 1) 3
#eval aplicar_cuatro' (fun x => x + 1) 3
```

# Pares ordenados

:::attr (style := "text-align: left; font-size: 24px;")
  En Lean, el tipo $`A \times B` representa el tipo de pares ordenados, donde su primera
  componente es de tipo $`A` y su segunda componente es de tipo $`B`.

  Un término de $`A \times B` tiene la forma $`(a, b)`, donde $`a : A` y $`b : B`. Si `p : A × B`,
  entonces `p.1 : A` es la primera componente de `p` y `p.2` es su segunda componente.
:::

```lean -panel -stretch
#check (1, 2)
#check (3.1415, true)
--!fragment
def mi_par := (1, 3)
#eval mi_par.1
#eval mi_par.2
```

# Ejemplos de funciones con pares

Las funciones que tienen como argumento un par ordenado se ven más
como las funciones convencionales.

```lean -panel -stretch
def intercambiar (p : Nat × Nat) : Nat × Nat := (p.2, p.1)
#eval intercambiar (1, 2)

--!fragment
def sumar (p : Nat × Nat) : Nat := p.1 + p.2
#eval sumar (5, 7)
#eval sumar (intercambiar (5, 7))
```

# EJERCICIO

%%%
backgroundColor := "#4d7e65"
%%%

:::attr (style := "text-align: left; font-size: 24px;")
  Sea `(a, b) : Nat × Nat` y sean `f : Nat → Nat` y `g : Nat → Nat`, definir una función
  que devuelva `(f a, g b)`.
:::

```lean -panel -stretch
--!fragment
def mapeo (p : Nat × Nat) (f g : Nat → Nat) : Nat × Nat :=
  (f p.1, g p.2)
--!fragment

#eval mapeo (100, 221)
  mitad_de_precio
  (fun x => x % 2)
```

# EJERCICIO

%%%
backgroundColor := "#4d7e65"
%%%

:::attr (style := "text-align: left; font-size: 24px;")
  Definir una función que tome una función `f : Nat → Nat → Nat`
  y la convierta a una función `g : Nat × Nat → Nat`.
:::

```lean -panel -stretch
--!fragment
def descurrificar (f : Nat → Nat → Nat) : Nat × Nat → Nat :=
  fun p : Nat × Nat => f p.1 p.2
```

# EJERCICIO

%%%
backgroundColor := "#4d7e65"
%%%

:::attr (style := "text-align: left; font-size: 24px;")
  Definir una función que tome una función `f : Nat × Nat → Nat` y la convierta
  a una función `g : Nat → Nat → Nat`.
:::

```lean -panel -stretch
--!fragment
def currificar (f : Nat × Nat → Nat) : Nat → Nat → Nat :=
  fun a b => f (a, b)

--!fragment
def currificar' (f : Nat × Nat → Nat) : Nat → Nat → Nat :=
  fun a => fun b => f (a, b)
```
