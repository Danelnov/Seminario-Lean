/-
* EJERCICIO 1:

Demostrar `(∀ x, p x → q x) → (∀ x, p x) → ∀ x, q x`.
-/

example {α : Type} (p q : α → Prop) :
    (∀ x, p x → q x) → (∀ x, p x) → ∀ x, q x := by
  sorry


/-
* EJERCICIO 2:

Demostrar `(∀ x, p x ∧ q x) ↔ (∀ x, p x) ∧ (∀ x, q x)`.

_Pista:_ Si `h : ∀ x, p x ∧ q x`, entonces `h x : p x ∧ q x`.
-/

example {α : Type} (p q : α → Prop) :
    (∀ x, p x ∧ q x) ↔ (∀ x, p x) ∧ (∀ x, q x) := by
  sorry
