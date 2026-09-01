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

#set math.equation(numbering: numbering.with("(1)"), supplement: [Eq.])

#show link: set text(fill: blue.darken(20%))

#show heading.where(level: 1): it => {
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
// #include "chapters/03-electromagnetic-waves.typ"
// ...
