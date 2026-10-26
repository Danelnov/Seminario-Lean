/-
  CUANTIFICADOR UNIVERSAL: `∀`

  Hasta ahora hemos considerado proposiciones que se refieren a elementos
  concretos. El cuantificador universal permite afirmar que una propiedad se
  cumple para todos los elementos de un tipo. La expresión `∀ x : α, p x` se
  lee «para todo `x` de tipo `α`, se cumple `p x`», donde `p : α → Prop` es un
  predicado: a cada elemento `x` le asigna una proposición `p x`.

  De acuerdo con la correspondencia de Curry–Howard, demostrar `∀ x, p x`
  equivale a construir una función que, para cada `x : α`, devuelve una prueba
  de `p x`. Esto explica por qué las demostraciones de cuantificadores
  universales se parecen a las de implicaciones: ambas se construyen
  introduciendo un elemento o una hipótesis y luego demostrando la meta
  resultante.
-/


/-
  DEMOSTRAR UN `∀` CON `intro`

  Al usar `intro x` frente a una meta `∀ x, p x`, Lean introduce un elemento
  arbitrario `x` del tipo correspondiente. La meta pasa a ser `p x`. Como el
  elemento es arbitrario, demostrar esa meta establece que la propiedad se
  cumple para todos los elementos.

  En el ejemplo, primero se introduce `x`. La meta restante es la implicación
  `p x → p x`, así que se introduce su hipótesis `hx`. Finalmente, `exact hx`
  usa esa misma prueba para cerrar el objetivo.
-/

example {α : Type} (p : α → Prop) :
    ∀ x, p x → p x := by
  intro x
  intro hx
  exact hx


/-
  USAR UNA HIPÓTESIS UNIVERSAL

  Una hipótesis `h : ∀ x, p x` puede verse como una función que recibe un
  elemento `a` y devuelve una prueba de `p a`. Por eso, para obtener un caso
  particular se aplica la hipótesis a ese elemento: `h a`.

  En el ejemplo, al introducir `h` y `hp`, el objetivo es `q a`. La aplicación
  `apply h` usa la hipótesis universal `h : ∀ x, p x → q x` y deja como meta
  demostrar `p a`. Esa meta se resuelve con `hp`.
-/

example {α : Type} (p q : α → Prop) (a : α) :
    (∀ x, p x → q x) → p a → q a := by
  intro h hp
  apply h
  exact hp
