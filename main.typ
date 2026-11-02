// Electrodynamics Lecture Notes — FY549
// Based on Griffiths and David Tong's lecture notes

#import "lib.typ": *

// ── Document setup ──────────────────────────────────────────────────
#set document(
  title: "Electrodynamics — FY549",
  author: "Manuel Meyer",
)

#set page(
  paper: "a4",
  margin: (left: 2cm, right: 5cm, y: 2cm),
  numbering: "1",
  header: context {
    let sel = selector(heading.where(level: 1)).before(here())
    let chapters = query(sel)
    if chapters.len() > 0 {
      let current = chapters.last()
      set text(size: 9pt, style: "italic")
      current.body
      h(1fr)
      "Electrodynamics — FY549"
    }
  },
)

#set text(
  font: "New Computer Modern",
  size: 11pt,
  lang: "en",
)

#set par(justify: true)

#set heading(numbering: "1.1")

// Chapter-scoped numbering "X.n" for equations and figures, where X is the
// chapter number and n resets to 1 at the start of each chapter.
//
// We can't just read `counter(heading)` from inside the equation/figure
// numbering function: when that function is re-invoked to render a
// *cross-reference* (`@eq:...`) elsewhere in the document, it resolves
// relative to the citing location, not the original equation's location,
// which silently produces the wrong chapter number. Instead, we encode the
// chapter number directly into the counter value itself (chapter * 1000 +
// n) when it's reset at each chapter heading, so the numbering function is
// pure arithmetic on that single integer and needs no location lookups.
#let chapter-number-parts(it) = (calc.quo(it, 1000), calc.rem(it, 1000))

#let chapter-eq-numbering(it) = {
  let (chapter, n) = chapter-number-parts(it)
  "(" + str(chapter) + "." + str(n) + ")"
}

#let chapter-fig-numbering(it) = {
  let (chapter, n) = chapter-number-parts(it)
  str(chapter) + "." + str(n)
}

#set math.equation(numbering: chapter-eq-numbering, supplement: [Eq.])

// Figures in this document are cetz drawings or included content, not
// `image()` elements, so typst can't auto-infer a `kind` for them — and
// without an explicit, uniform kind, `counter(figure.where(kind: ..))`
// (what `figure()` actually numbers against) can't be reset per chapter.
// Force one fixed kind for every figure so the reset below reaches it.
#show figure: set figure(kind: "fig", supplement: [Figure])
#set figure(numbering: chapter-fig-numbering)

#show link: set text(fill: blue.darken(20%))

#show heading.where(level: 1): it => {
  let chapter = counter(heading).at(it.location()).first()
  counter(math.equation).update(chapter * 1000)
  counter(figure.where(kind: "fig")).update(chapter * 1000)
  pagebreak(weak: true)
  it
}

// ── Title page ──────────────────────────────────────────────────────
#align(center + horizon)[
  #text(size: 28pt, weight: "bold")[Electrodynamics]

  #v(0.5em)

  #text(size: 18pt, weight: "bold")[FY549]

  #v(1em)

  #text(size: 16pt)[Lecture Notes for 3rd semester physics and physics and engineering students]

  #v(2em)

  #text(size: 14pt)[Manuel Meyer]

  #text(size: 12pt)[University of Southern Denmark]

  #v(1em)

  #text(size: 11pt, style: "italic")[
    Based on D.J. Griffiths, _Introduction to Electrodynamics_ \
    and D. Tong, _Lectures on Electromagnetism_
  ]

  #v(2em)

  #text(size: 10pt)[#datetime.today().display("[month repr:long] [year]")]

  #v(4em)

  #block(width: 80%, stroke: none, inset: 12pt)[
    #set text(size: 10pt)
    #set par(justify: true)
    *How to read these notes:*
    #align(left)[
    - Sections in #text(fill: rgb("#2980b9"))[blue boxes] contain extra material
      that is helpful or interesting but not strictly necessary.
    - Sections in #text(fill: rgb("#8e44ad"))[purple boxes] are for the interested
      reader who wants to go deeper.
    - Sections in #text(fill: rgb("#e74c3c"))[red boxes] are in-class exercises.
    - Key equations are marked with #text(fill: rgb("#f39c12"))[orange boxes].
    - Text marked in #text(fill: rgb("#008080"))[teal] refers to slides shown in the lecture.
    - You have plenty of space in the left margin for your own comments.
    ]
  ]
]

#pagebreak()

// ── Table of contents ───────────────────────────────────────────────
#outline(indent: auto, depth: 3)

#pagebreak()

// ── Chapters ────────────────────────────────────────────────────────
#include "chapters/01-maxwells-equations.typ"
#include "chapters/02-maxwells-equations-in-matter.typ"
#include "chapters/03-electromagnetic-waves.typ"
#include "chapters/04-reflection-and-transmission.typ"
#include "chapters/05-absorption-and-dispersion.typ"
#include "chapters/06-guided-waves.typ"
#include "chapters/07-potentials.typ"
#include "chapters/08-lienard-wiechert.typ"
// ...
