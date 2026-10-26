import VersoSlides

open VersoSlides

#doc (VersoSlides.Slides) "Cuantificador ∀" =>

%%%
vertical := some true
%%%

::::attr (style := "text-align: left; font-size: 24px;")
Hasta ahora hablamos de proposiciones fijas. Con $`\forall` hablamos de *todos* los elementos de un tipo. La expresión $`\forall x : \alpha,\; p\,x` se lee «para todo `x` de tipo `α`, se cumple `p x`», donde `p : α → Prop` es un predicado.

:::fragment fadeUp
Según BHK, una demostración de $`\forall x : \alpha,\; p\,x` es una *función*: dado cualquier `x : α`, devuelve una demostración de `p x`.
:::
::::

# Demostrar un ∀: `intro`

::::attr (style := "text-align: left; font-size: 24px;")
Una demostración de $`\forall x,\; p\, x` es una función, igual que una de $`\to`. Por eso se usa la misma táctica: `intro x` introduce un elemento arbitrario `x : α`, y la meta pasa a ser `p x`.
::::

```lean
example {α : Type} (p : α → Prop) :
    ∀ x, p x → p x := by
-- !fragment
  intro x
-- ^ !click
-- !fragment
  intro hx
-- ^ !click
-- !fragment
  exact hx
-- ^ !click
```

# Usar una hipótesis ∀

::::attr (style := "text-align: left; font-size: 24px;")
Una hipótesis $`h : \forall x, p\,x` también es una función: aplicada a un elemento `a : α`, `h a` demuestra `p a`.
::::

```lean
example {α : Type} (p q : α → Prop) (a : α) :
    (∀ x, p x → q x) → p a → q a := by
-- !fragment
  intro h hp
-- ^ !click
-- !fragment
  apply h
-- ^ !click
-- !fragment
  exact hp
-- ^ !click
```

# EJERCICIO

%%%
backgroundColor := "#4d7e65"
%%%

:::attr (style := "text-align: left; font-size: 24px;")
Demostrar $`(\forall x, p\,x \to q\,x) \to (\forall x, p\,x) \to \forall x, q\,x`.
:::

```lean
-- !fragment
example {α : Type} (p q : α → Prop) :
    (∀ x, p x → q x) → (∀ x, p x) → ∀ x, q x := by
-- !fragment
  intro h1 h2 x
-- ^ !click
-- !fragment
  apply h1
-- ^ !click
-- !fragment
  exact h2 x
-- ^ !click
```
# EJERCICIO

%%%
backgroundColor := "#4d7e65"
%%%

:::attr (style := "text-align: left; font-size: 24px;")
Demostrar $`(\forall x, p\,x \wedge q\,x) \leftrightarrow (\forall x, p\,x) \wedge (\forall x, q\,x)`.

_Pista:_ si `h : ∀ x, p x ∧ q x`, entonces `h x : p x ∧ q x`.
:::

```lean
-- !fragment
example {α : Type} (p q : α → Prop) :
    (∀ x, p x ∧ q x) ↔ (∀ x, p x) ∧ (∀ x, q x) := by
-- !fragment
  constructor
-- ^ !click
-- !fragment
  · intro h
  -- ^ !click
-- !fragment
    constructor
    -- ^ !click
-- !fragment
    · intro x
      -- ^ !click
-- !fragment
      exact (h x).left
      -- ^ !click
-- !fragment
    · intro x
      -- ^ !click
-- !fragment
      exact (h x).right
      -- ^ !click
-- !fragment
  · intro ⟨h1, h2⟩ x
  -- ^ !click
-- !fragment
    exact ⟨h1 x, h2 x⟩
    -- ^ !click
```
