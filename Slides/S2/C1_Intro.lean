import VersoSlides

open VersoSlides

#doc (VersoSlides.Slides) "Tácticas" =>

%%%
vertical := some true
%%%

::::attr (style := "text-align: left; font-size: 24px;")
Por la correspondencia de Curry–Howard, demostrar una proposición en Lean
equivale a escribir un término cuyo tipo es esa proposición.

```lean -show
section
variable {α : Type} (p q : α → Prop)
```

:::hstack
```lean -panel -stretch
example : (∀ x, p x ∧ q x) ↔ (∀ x, p x) ∧ (∀ x, q x) :=
  ⟨
    fun h =>
      And.intro
        (fun x => (h x).left)
        (fun x => (h x).right),
    fun h =>
      fun x => ⟨h.left x, h.right x⟩
  ⟩
```
```lean -panel -stretch
example : (∀ x, p x ∧ q x) ↔ (∀ x, p x) ∧ (∀ x, q x) := by
  constructor
  · intro h
    constructor
    · intro x
      exact (h x).left
    · intro x
      exact (h x).right
  · intro h x
    constructor
    · exact h.left x
    · exact h.right x
```

```lean -show
end
```
:::

Escribir pruebas mediante términos requiere conocer a fondo el lenguaje y resulta difícil de leer. En cambio, construir demostraciones con tácticas es más sencillo, intuitivo y legible.
::::

# `intro` y `sorry`
:::attr (style := "text-align: left; font-size: 24px;")
Para demostrar una implicación $`\alpha \to \beta`, primero se supone $`\alpha` como hipótesis para luego probar $`\beta` (introducir hipótesis). En Lean, la táctica `intro` realiza esta acción.
:::

```lean
example (p : Prop) : p → p := by
-- !fragment
-- ^ !click
  intro hp
-- ^ !click
  sorry
```
:::attr (style := "text-align: left; font-size: 24px;")
La táctica `sorry` se utiliza para indicar que una demostración está incompleta.
:::

# `exact`

:::attr (style := "text-align: left; font-size: 24px;")
Si el objetivo es demostrar $`\alpha` y contamos con una hipótesis o teorema que prueba exactamente esa proposición, utilizamos la táctica `exact`.
:::

```lean
example (p : Prop) : p → p := by
-- !fragment
  intro hp
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
Completar el siguiente código con una demostración de $`P \to (Q \to P)`.
:::

```lean
example (p q : Prop) : p → q → p := by
-- !fragment
  intro hp
-- ^ !click
-- !fragment
  intro hq
-- ^ !click
-- !fragment
  exact hp
-- ^ !click

-- !fragment
example (p q : Prop) : p → q → p := by
  intro hp hq
  exact hp
```

# EJERCICIO

%%%
backgroundColor := "#4d7e65"
%%%

:::attr (style := "text-align: left; font-size: 24px;")
Demostrar la siguiente proposición: $`(P \to Q) \to P \to Q`.

_Nota:_ Recordemos que si tenemos `f : α → β` y `a : α`, entonces `f a : β`.
:::

```lean
-- !fragment
example (p q : Prop) : (p → q) → p → q := by
-- !fragment
  intro h hp
-- ^ !click
-- !fragment
  exact h hp
-- ^ !click
```

# EJERCICIO

%%%
backgroundColor := "#4d7e65"
%%%

:::attr (style := "text-align: left; font-size: 24px;")
Demostrar la siguiente proposición: $`(P \to Q) \to (Q \to R) \to (P \to R)`.
:::

```lean
-- !fragment
example (p q r : Prop)
    : (p → q) → (q → r) → p → r := by
-- !fragment
  intro hpq hqr hp
-- ^ !click
-- !fragment
  exact hqr (hpq hp)
-- ^ !click
```

# `apply`


:::attr (style := "text-align: left; font-size: 24px;")
Si queremos demostrar $`Q` pero contamos con una hipótesis o teorema que afirma $`P \to Q`,
basta con demostrar $`P` para concluir $`Q`. La táctica que nos ayuda con esto
es `apply`.
:::

```lean
example (p q r : Prop)
    : (p → q) → (q → r) → p → r := by
-- !fragment
  intro hpq hqr hp
-- ^ !click
-- !fragment
  -- Puesto que se tiene `hqr : q → r`
  -- Basta con demostrar `q`
  apply hqr
-- ^ !click
-- !fragment
  -- Puesto que se tiene `hpq : p → q`
  -- Basta con mostrar `p`
  apply hpq
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
La táctica `apply` se puede usar con proposiciones de la forma $`P_1 \to \dots \to P_n \to Q`
siempre que el objetivo sea demostrar $`Q`. En este caso, Lean divide la demostración en partes:
es decir, si usamos `apply` con la proposición anterior, Lean nos pedirá demostrar de forma independiente
cada $`P_i`.
:::

```lean
example (p q r : Prop) (hp : p) (hq : q) :
    (p → q → r) → r := by
-- !fragment
  intro h
-- ^ !click
-- !fragment
  apply h
-- ^ !click
-- !fragment
  . exact hp
-- ^ !click
-- !fragment
  . exact hq
-- ^ !click
-- !fragment

-- !fragment
example (p q r : Prop) (hp : p) (hq : q) :
    (p → q → r) → r := by
  intro h
  exact h hp hq
```

# `constructor`

:::attr (style := "text-align: left; font-size: 24px;")
Si queremos probar $`P \wedge Q`, solo hace falta demostrar $`P` y $`Q`. La táctica encargada de hacer esto en Lean
es `constructor`, y la podemos aplicar sobre conjunciones o sobre equivalencias ($`P \leftrightarrow Q \equiv (P \to Q) \wedge (Q \to P)`).

Al aplicar `constructor`, Lean dividirá la demostración en dos partes: una para demostrar $`P` y la otra para demostrar $`Q`. En estos casos donde Lean divide la demostración, para mantener un orden visual, es útil utilizar puntos (`·`) en cada submeta.
:::

```lean
example (p q r : Prop) :
    (p ∧ q → r) → p → q → r := by
-- !fragment
  intro h hp hq
-- ^ !click
-- !fragment
  apply h
-- ^ !click
-- !fragment
  constructor
-- ^ !click
-- !fragment
  . exact hp
-- ^ !click
-- !fragment
  . exact hq
-- ^ !click
```

# EJERCICIO

%%%
backgroundColor := "#4d7e65"
%%%

:::attr (style := "text-align: left; font-size: 24px;")
Demostrar $`(P \to Q) \to (P \to R) \to P \to Q \wedge R`.
:::

```lean
-- !fragment
example (p q r : Prop) :
    (p → q) → (p → r) → p → q ∧ r := by
-- !fragment
  intro hpq hpr hp
  -- ^ !click
-- !fragment
  constructor
  -- ^ !click
-- !fragment
  . apply hpq
    -- ^ !click
-- !fragment
    exact hp
  -- ^ !click
-- !fragment
  . apply hpr
  -- ^ !click
-- !fragment
    exact hp
    -- ^ !click
```

# Uso de `h.left` y `h.right`

:::attr (style := "text-align: left; font-size: 24px;")
Una hipótesis $`h : P \wedge Q` contiene dos demostraciones a la vez. Para usarlas por separado, Lean ofrece las *proyecciones*:

- `h.left`  es una demostración de $`P`.
- `h.right` es una demostración de $`Q`.
:::

```lean
example (p q : Prop) : p ∧ q → q ∧ p := by
-- !fragment
  intro h
-- ^ !click
-- !fragment
  constructor
-- ^ !click
-- !fragment
  · exact h.right
  -- ^ !click
-- !fragment
  · exact h.left
  -- ^ !click
```

# EJERCICIO

%%%
backgroundColor := "#4d7e65"
%%%

:::attr (style := "text-align: left; font-size: 24px;")
Demostrar la siguiente proposición: $`(P \to Q \to R) \leftrightarrow (P \wedge Q \to R)`.

_Nota:_ `constructor` también divide una equivalencia en sus dos implicaciones, y `h.left`, `h.right` extraen las partes de una hipótesis $`h : P \wedge Q`.
:::

```lean
-- !fragment
example (p q r : Prop) :
    (p → q → r) ↔ (p ∧ q → r) := by
-- !fragment
  constructor
-- ^ !click
-- !fragment
  · intro h hpq
  -- ^ !click
-- !fragment
    exact h hpq.left hpq.right
    -- ^ !click
-- !fragment
  · intro h hp hq
  -- ^ !click
-- !fragment
    apply h
    -- ^ !click
-- !fragment
    constructor
    -- ^ !click
-- !fragment
    · exact hp
      -- ^ !click
-- !fragment
    · exact hq
      -- ^ !click
```

# Constructor anónimo: `⟨hp, hq⟩`

:::attr (style := "text-align: left; font-size: 24px;")
El *constructor anónimo* `⟨hp, hq⟩` empaqueta dos demostraciones en una de $`P \wedge Q`, y también sirve para separarlas:

- *Construir:* `exact ⟨hp, hq⟩` demuestra $`P \wedge Q`.
- *Separar:* `intro ⟨hp, hq⟩` convierte $`h : P \wedge Q` en $`hp : P` y $`hq : Q`.

En el editor: `\<` produce `⟨` y `\>` produce `⟩`.
:::

```lean
example (p q : Prop) : p ∧ q → q ∧ p := by
-- !fragment
  intro ⟨hp, hq⟩
-- ^ !click
-- !fragment
  exact ⟨hq, hp⟩
-- ^ !click
```
# EJERCICIO

%%%
backgroundColor := "#4d7e65"
%%%

:::attr (style := "text-align: left; font-size: 24px;")
Demostrar $`(P \wedge Q \to R) \to (P \to Q) \to P \to R`.
:::

```lean
-- !fragment
example (p q r : Prop) :
    (p ∧ q → r) → (p → q) → p → r := by
-- !fragment
  intro h hpq hp
-- ^ !click
-- !fragment
  apply h
-- ^ !click
-- !fragment
  constructor
-- ^ !click
-- !fragment
  · exact hp
  -- ^ !click
-- !fragment
  · exact hpq hp
  -- ^ !click
```

# EJERCICIO

%%%
backgroundColor := "#4d7e65"
%%%

:::attr (style := "text-align: left; font-size: 24px;")
Demostrar la asociatividad de la conjunción: $`(P \wedge Q) \wedge R \leftrightarrow P \wedge (Q \wedge R)`.

_Nota:_ Los patrones se pueden anidar, por ejemplo `⟨⟨hp, hq⟩, hr⟩`.
:::

```lean
-- !fragment
example (p q r : Prop) :
    (p ∧ q) ∧ r ↔ p ∧ (q ∧ r) := by
-- !fragment
  constructor
-- ^ !click
-- !fragment
  · intro ⟨⟨hp, hq⟩, hr⟩
  -- ^ !click
-- !fragment
    exact ⟨hp, ⟨hq, hr⟩⟩
    -- ^ !click
-- !fragment
  · intro ⟨hp, ⟨hq, hr⟩⟩
  -- ^ !click
-- !fragment
    exact ⟨⟨hp, hq⟩, hr⟩
    -- ^ !click
```

# EJERCICIO

%%%
backgroundColor := "#4d7e65"
%%%

:::attr (style := "text-align: left; font-size: 24px;")
Demostrar $`(P \to Q \wedge R) \leftrightarrow (P \to Q) \wedge (P \to R)`.

_Pista:_ si $`h : P \to Q \wedge R` y $`hp : P`, entonces `h hp` demuestra $`Q \wedge R`.
:::

```lean
-- !fragment
example (p q r : Prop) :
    (p → q ∧ r) ↔ (p → q) ∧ (p → r) := by
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
    · intro hp
      -- ^ !click
-- !fragment
      exact (h hp).left
      -- ^ !click
-- !fragment
    · intro hp
      -- ^ !click
-- !fragment
      exact (h hp).right
      -- ^ !click
-- !fragment
  · intro ⟨hpq, hpr⟩ hp
  -- ^ !click
-- !fragment
    exact ⟨hpq hp, hpr hp⟩
    -- ^ !click
```
