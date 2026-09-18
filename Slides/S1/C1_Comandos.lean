import VersoSlides

open VersoSlides

#doc (VersoSlides.Slides) "Comandos de Lean" =>

%%%
vertical := some true
%%%

:::attr (style := "text-align: left")
Los comandos de Lean sirven para obtener información del codigo
ya sea para evaluar una expresión, conocer su tipo, o en casos más
avanzados concoer el codigo de una demostración, determinar los axiomas
de los que depende una demostración, etc.
:::

# Comando `#eval`

El comando `#eval` permite *evaluar expresiones y funciones*
para ver su resultado de forma inmediata.


```lean -panel
#eval "Hola Mundo"
#eval 1 + 2 * 5
#eval 5 - 3
#eval if true then "verdadero" else "falso"
```

# EJERCICIO

%%%
backgroundColor := "#4d7e65"
%%%

::::attr (style := "text-align: left")
  :::fitText
  Intenta escribir tu nombre dentro de las comillas vacías para
  completar el saludo.
  :::
::::

```lean -panel -stretch
#eval "Hola, yo soy" ++ " "
-- !fragment
#eval "Hola, yo soy" ++ " Daniel"
-- !fragment
#eval "Hola, yo soy" ++ " Juan"
```

# EJERCICIO

%%%
backgroundColor := "#4d7e65"
%%%

::::attr (style := "text-align: left")
  :::fitText
  Modifica la condición (3 == 4) para que el resultado devuelva "Son iguales".
  :::
::::

```lean -panel -stretch
#eval if 3 == 4 then "Son iguales" else "No son iguales"
-- !fragment
#eval if 3 == 3 then "Son iguales" else "No son iguales"
```


# Comando `#check`


Permite *determinar el tipo de una expresión, valor o función*
sin necesidad de evaluarla.

```lean -panel
#check 3
#check -2
#check true
#check "Lean4"
#check 3.1415
#check [1, 2, 3, 4]
```

# Jerarquía de tipos

En Lean, absolutamente toda expresión válida tiene un tipo asociado.

```lean -panel
#check Nat
#check Type
#check Type 1
```

# El tipo de proposiciones

El tipo {lean}`Prop` es fundamental para la formalización de matemáticas,
este se trata del tipo de todas las *proposiciones logicas*

```lean -panel
#check ∀ x : Nat, x + 1 > x
#check ∀ (x y : Nat), x > y → ∃ k, x = y + k
```

# ¿Como escribir los simbolos?

Puedes escribir símbolos matemáticos en el editor usando la barra invertida `\`
seguida de la secuencia en LaTeX.

- `\forall` produce `∀`
- `\exists` produce `∃`
- `\and` produce `∧`
- `\or` produce `∨`
- `\to`, `\imp` y `\->` producen `→`

# EJERCICIO

%%%
backgroundColor := "#4d7e65"
%%%

::::attr (style := "text-align: left")
  :::fitText
  Completa el siguiente bloque escribiendo la siguiente proposición:
  Para todo número entero $`n`, el entero $`n (n + 1)` es par
  (es decir, existe un entero $`k` tal que $`n  (n + 1) = 2 k`).
  :::
::::

```lean -panel -stretch
-- !fragment
#check ∀ n : Int, ∃ k : Int, n * (n + 1) = 2 * k
```
