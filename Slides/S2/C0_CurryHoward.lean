import VersoSlides

open VersoSlides

#doc (VersoSlides.Slides) "Antes de empezar" =>

%%%
vertical := some true
%%%

::::attr (style := "text-align: left; font-size: 32px;")
:::fragment fadeUp
¿Por qué Lean funciona?

¿Por qué podemos hacer demostraciones en Lean?

¿Por qué podemos confiar en la verificación de Lean?
:::
::::

# Por la correspondencia de Curry–Howard

%%%
transition := "zoom"
%%%

# Tipos y proposiciones

::::::hstack
:::::vstack
::::attr (style := "text-align: left; font-size: 24px;")
En Lean se usa constantemente la notación $`a : A`, que se lee «$`a` es de tipo $`A`».
Los tipos son un concepto central en los lenguajes de programación, y existe toda una teoría que
los estudia. Pero Curry y Howard observaron que $`a : A` admite otra lectura:

El tipo $`A` es una *proposición*.
El término $`a : A` es una *demostración* de $`A`.
::::
:::::

:::attr (style := "width: 45%; text-align: center; margin-left: .5em;")
{image "../assets/curry-howard.png" (width := "440px")}[Logo de Lean]
:::
::::::

# Interpretación BHK

::::attr (style := "text-align: left; font-size: 24px;")
La *interpretación BHK* (Brouwer–Heyting–Kolmogorov) explica como se construye una demostración.
Lean usa esta interpretación para construir demostraciones:

- Una demostración de $`P \wedge Q` es un par $`(a, b)` donde $`a` es una demostración de $`P` y $`b` de $`Q`.
- Una demostración de $`P \vee Q` puede ser $`(0, a)`, donde $`a` es demostración de $`P` o es $`(1, b)`, donde $`b` es una demostración de $`Q`.
- Una demostración de $`P \to Q` es una función que transforma demostraciones de $`P` en demostraciones de $`Q`.
- $`\bot` no tiene demostración.

En Lean, estas descripciones son términos:
::::

```lean -panel
-- !fragment
example (p q : Prop) (hp : p) (hq : q) : p ∧ q := ⟨hp, hq⟩
-- !fragment
example (p q : Prop) (hp : p) : p ∨ q := Or.inl hp
-- !fragment
example (p : Prop) : p → p := fun hp => hp
```
