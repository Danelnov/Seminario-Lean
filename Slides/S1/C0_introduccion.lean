import VersoSlides

open VersoSlides

#doc (VersoSlides.Slides) "¿Qué ha pasado?" =>

%%%
vertical := some true
%%%

::::attr (style := "text-align: left; font-size: 24px;")
:::fragment fadeUp
(Enero-Mayo) Se registran soluciones a problemas de Erdős asistidas por inteligencia artificial.

(23 de febrero y marzo) La IA Gauss (Math, Inc.) formaliza de forma semiautónoma la demostración
del empaquetamiento de esferas en 8 y 24 dimensiones. El caso de dimensión 24 le tomó dos semanas
y el proyecto completo suma unas 200.000 líneas de código.

(4 de septiembre) Anthropic publica la formalización en Lean del último teorema de Fermat,
producida por agentes de Claude en 11 días: 13 millones de líneas de código y unos 29.500 teoremas
intermedios.

(8 de septiembre) OpenAI afirma haber resuelto el problema de Navier-Stokes (una explosión en tiempo finito,
con una fuerza externa suave). Adjuntó su artículo y una formalización en Lean, y el resultado sigue
pendiente de validación por la comunidad.

(6 de octubre) OpenAI publica 722 manuscritos con resultados en matemáticas y al día siguiente retira 3
(quedan 719). Alrededor del 42 % de los resultados principales cuentan con formalización en Lean.
:::
::::

# ¿Qué es Lean?

::::::hstack
:::attr (style := "width: 35%; text-align: center;")
{image "../assets/leanlogo.png" (width := "350px")}[Logo de Lean]
:::

:::::vstack
::::attr (style := "text-align: left; font-size: 24px;")
Lean es un lenguaje de programación funcional, creado por Leonardo de Moura en 2013
como proyecto de investigación en Microsoft.

Lean se caracteriza por ser un lenguaje de propósito general, con una gran interfaz para la
metaprogramación, además de ser un asistente de demostraciones. Esto permite escribir
proposiciones y demostrarlas utilizando el lenguaje y su sistema de tácticas.
::::
:::::
::::::

# ¿Qué es formalizar?

:::hstack
```html
<div style="width: 58%; text-align: left; font-size: 26px; line-height: 1.4; padding-right: 1em;">
<p>Formalizar es traducir conceptos, proposiciones y demostraciones del lenguaje natural
a un lenguaje simbólico, regido por reglas lógicas precisas.</p>

<p>Es posible en principio, pero es un trabajo muy laborioso.</p>

<p>Por eso es ideal para las computadoras, y ahí entran Lean, Rocq, Agda e Isabelle.</p>
</div>
```
```lean -panel -stretch
-- Sumar cero a la izquierda
theorem cero_mas (n : Nat) : 0 + n = n := by
  induction n with
  | zero => rfl
  | succ k ih => rw [Nat.add_succ, ih]
```
:::

# ¿Por qué Lean?

::::attr (style := "text-align: left; font-size: 30px;")
:::fragment fadeUp
Es de propósito general, lo que permite crear tácticas dentro del propio lenguaje.

Cuenta con una comunidad muy activa.

Su sistema de tipos es muy poderoso.

Está enfocado en el quehacer matemático.

Tiene Mathlib, una gran biblioteca de matemáticas formalizadas.
:::
::::

# ¿Por qué aprender Lean a pesar de la IA?

::::attr (style := "text-align: left; font-size: 26px;")
:::fragment fadeUp
En Lean, la IA puede comprobar cada paso de una demostración y saber si va bien o mal. En lenguaje natural no hay una verificación automática. Por eso conviene demostrar primero en Lean y escribir después la versión informal.

¿Pero cómo sabemos que la IA formalizó fielmente lo que queríamos? Confiar a ciegas no es una opción para un matemático. Hay que leer la formalización, y eso exige saber leer Lean.

Un jefe solo habla chino y sus empleados, español. Contrata a un traductor, y todo lo que dice pasa por las palabras de ese traductor. ¿Y si es malicioso? ¿Y si es incompetente?

*Para no depender del traductor, hay que aprender chino.*
:::
::::

:::notes
Lean verifica la demostración. Lo que debemos revisar nosotros son las definiciones y el enunciado,
que normalmente es mucho menos texto que la demostración completa.
:::
