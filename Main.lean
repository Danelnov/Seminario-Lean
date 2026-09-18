import VersoSlides
import Slides

open VersoSlides

/--/
partial def withBackgroundColor
    (color : String)
    (part : Verso.Doc.Part VersoSlides.Slides) :
    Verso.Doc.Part VersoSlides.Slides :=
  let metadata :=
    match part.metadata with
    | some m => some { m with backgroundColor := some color }
    | none => some { (default : SlideMetadata) with backgroundColor := some color }
  { part with
    metadata
    subParts := part.subParts.map (withBackgroundColor color) }
-/

def main : IO UInt32 :=
  slidesMain
    (config := { theme := "white-contrast", slideNumber := true, transition := "slide" })
    --(doc := withBackgroundColor "#f5f5f5" (%doc Slides))
    (doc := %doc Slides)
