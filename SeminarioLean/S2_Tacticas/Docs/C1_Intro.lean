/-
  `intro` Y `sorry`

  Para demostrar una implicación `α → β`, se supone primero `α` y luego se
  demuestra `β`. La táctica `intro` introduce esa hipótesis en el contexto de
  la prueba. En el ejemplo, `hp` representa la hipótesis `p`.

  La táctica `sorry` marca una demostración incompleta. Sirve como marcador
  temporal mientras se escribe una prueba, pero no la completa ni demuestra el
  resultado. Por eso aparece en este ejemplo introductorio tal como aparece en
  las diapositivas.
-/

example (p : Prop) : p → p := by
  intro hp
  sorry


/-
  `exact`

  `exact` termina el objetivo cuando se le proporciona un término que demuestra
  exactamente la proposición buscada. Aquí, después de introducir `hp : p`, el
  objetivo es `p`; la hipótesis `hp` lo demuestra directamente.
-/

example (p : Prop) : p → p := by
  intro hp
  exact hp


/-
  `apply`

  Si el objetivo es `Q` y se tiene una hipótesis `h : P → Q`, se puede aplicar
  `h`: Lean cambia el objetivo de `Q` a `P`, que es la condición necesaria para
  obtener `Q`. En el ejemplo se encadenan dos aplicaciones. Primero se aplica
  `hqr : q → r`, luego `hpq : p → q`; queda demostrar `p`, que se resuelve con
  `hp`.
-/

example (p q r : Prop)
    : (p → q) → (q → r) → p → r := by
  intro hpq hqr hp
  -- Puesto que se tiene `hqr : q → r`
  -- Basta con demostrar `q`
  apply hqr
  -- Puesto que se tiene `hpq : p → q`
  -- Basta con mostrar `p`
  apply hpq
  exact hp


/-
  `constructor`

  Para demostrar una conjunción `P ∧ Q`, hay que demostrar sus dos componentes.
  La táctica `constructor` separa el objetivo en esos subobjetivos. Los puntos
  `·` permiten indicar de forma explícita la prueba correspondiente a cada
  subobjetivo.

  La misma táctica también puede separar una equivalencia en sus dos
  implicaciones, ya que `P ↔ Q` requiere demostrar `P → Q` y `Q → P`.
  El ejemplo muestra `constructor` aplicado a una conjunción que se necesita
  para usar la hipótesis `h`.
-/

example (p q r : Prop)
    : (p ∧ q → r) → p → q → r := by
  intro h hp hq
  apply h
  constructor
  . exact hp
  . exact hq


/-
  PROYECCIONES `h.left` Y `h.right`

  Una hipótesis `h : P ∧ Q` contiene una prueba de cada componente. Las
  proyecciones `h.left` y `h.right` extraen, respectivamente, las pruebas de
  `P` y de `Q`. En este ejemplo se invierte el orden de la conjunción: se usa la
  segunda componente para demostrar `q` y la primera para demostrar `p`.
-/

example (p q : Prop) : p ∧ q → q ∧ p := by
  intro h
  constructor
  · exact h.right
  · exact h.left


/-
  CONSTRUCTOR ANÓNIMO `⟨..., ...⟩`

  El constructor anónimo permite empaquetar pruebas de las partes de una
  conjunción. En el patrón `intro ⟨hp, hq⟩`, Lean recibe una hipótesis de tipo
  `p ∧ q` y la descompone directamente en `hp : p` y `hq : q`. Luego
  `exact ⟨hq, hp⟩` construye la conjunción con las componentes en orden
  invertido.

  En el editor, `\<` produce `⟨` y `\>` produce `⟩`.
-/

example (p q : Prop) : p ∧ q → q ∧ p := by
  intro ⟨hp, hq⟩
  exact ⟨hq, hp⟩
