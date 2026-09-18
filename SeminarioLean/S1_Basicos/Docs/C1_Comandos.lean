/-
El comando `#eval` en Lean

El comando `#eval` permite **evaluar expresiones y funciones**
para ver su resultado de forma inmediata.

¿Dónde se ve el resultado?

El resultado de la evaluación aparece en la ventana **Lean InfoView**:
- Esta panel se abre **automáticamente** a la derecha del editor al abrir
  cualquier archivo `.lean`.
- Si el InfoView no aparece, puedes abrirlo manualmente haciendo clic
  en el ícono **∀** (ubicado en la esquina superior derecha del editor)
  y seleccionando **"Toggle InfoView"**.
-/

#eval "Hola Mundo"

#eval 1 + 2 * 5

#eval 5 - 3

/-
El comando `#check`

Permite **determinar el tipo de una expresión, valor o función**
sin necesidad de evaluarla. En Lean, absolutamente toda expresión
válida tiene un tipo asociado.
-/

#check 3
#check -2
#check true
#check "Lean4"
#check 3.1415
#check [1, 2, 3, 4]

-- Incluso los tipos poseen tipos
#check Nat
#check Type
#check Type 1

/-
El tipo `Prop` (Proposiciones)

Un tipo fundamental en Lean para la formalización matemática es `Prop`,
el tipo de todas las **proposiciones lógicas**.

**Nota sobre símbolos:** Puedes escribir símbolos matemáticos en el editor
usando la barra invertida `\` seguida de la secuencia en LaTeX.
- `\forall` produce `∀`
- `\exists` produce `∃`
- `\and` produce `∧`
- `\or` produce `∨`
- `\to` o `\imp` produce `→`
-/

#check ∀ x : Nat, x + 1 > x

#check ∀ (x y : Nat), x > y → ∃ k, x = y + k
