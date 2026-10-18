/-
* EJERCICIO 1:

Define la constante π y luego chequea su tipo.
Luego define en otra variable π / 2 y π / 3.
-/


/-
* EJERCICIO 2:

Define una función llamada `area` que calcule el área de un rectangulo.
-/


/-
* EJERCICIO 3:

A partir de la función `area` define una funcion que calcule el área de un cuadrado
-/



/-
* EJERCICIO 4:

Define una función que calcule el área de un triángulo de lados a, b
y un ángulo θ.

_Pista_ La formula general del área de un triángulo es
  (a × b × sin θ) / 2

Para la función seno, utiliza `Float.sin` la cual se evalua en radianes
-/

def area_triangulo := 0


/-
* EJERCICIO 5:

Define una función que cálcule el área de los siguientes tipos de triángulos
  - Recto      (90° grado)
  - Equilátero (60° grados)
-/



/-
* EJERCICIO 6:

A partir de la función `aplicar_dos`, define una función que aplique cuatro veces
una función `f : Nat → Nat`.
-/

def aplicar_dos (f : Nat → Nat) (x : Nat) : Nat := f (f x)



/-
* EJERCICIO 7:

Sea `(a, b) : Nat × Nat` y sean `f : Nat → Nat` y `g : Nat → Nat`, definir una función
que devuelva `(f a, g b)`.
-/



/-
* EJERCICIO 8:

Definir una función que tome una función `f : Nat → Nat → Nat` y la convierta a una
función `g : Nat × Nat → Nat`.
-/



/-
* EJERCICIO 9:

Definir una función que tome una función `f : Nat × Nat → Nat` y la convierta
a una función `g : Nat → Nat → Nat`.
-/
