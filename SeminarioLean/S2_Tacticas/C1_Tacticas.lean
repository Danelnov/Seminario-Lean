/-
* EJERCICIO 1:

Completar el siguiente código con una demostración de `p → q → p`.
-/

example (p q : Prop) : p → q → p := by
  sorry

/-
* EJERCICIO 2:

Demostrar la siguiente proposición: `(p → q) → p → q`.

_Nota:_ Si tenemos `f : α → β` y `a : α`, entonces `f a : β`.
-/


/-
* EJERCICIO 3:

Demostrar la siguiente proposición: `(p → q) → (q → r) → (p → r)`.
-/


/-
* EJERCICIO 4:

Sean `p q r : Prop`, `hp : p` y `hq : q`. Demostrar `(p → q → r) → r`.
-/

example (p q r : Prop) (hp : p) (hq : q) :
    (p → q → r) → r := by
  sorry

/-
* EJERCICIO 5:

Demostrar `(p → q) → (p → r) → p → q ∧ r`.
-/


/-
* EJERCICIO 6:

Demostrar la siguiente proposición: `(p → q → r) ↔ (p ∧ q → r)`.

_Nota:_ `constructor` divide una equivalencia en sus dos implicaciones, y
`h.left`, `h.right` extraen las partes de una hipótesis `h : p ∧ q`.
-/


/-
* EJERCICIO 7:

Demostrar `(p ∧ q → r) → (p → q) → p → r`.
-/


/-
* EJERCICIO 8:

Demostrar la asociatividad de la conjunción:
`(p ∧ q) ∧ r ↔ p ∧ (q ∧ r)`.

_Nota:_ Los patrones se pueden anidar, por ejemplo `⟨⟨hp, hq⟩, hr⟩`.
-/


/-
* EJERCICIO 9:

Demostrar `(p → q ∧ r) ↔ (p → q) ∧ (p → r)`.

_Pista:_ Si `h : p → q ∧ r` y `hp : p`, entonces `h hp` demuestra `q ∧ r`.
-/
