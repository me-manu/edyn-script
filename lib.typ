// Shared definitions for the lecture notes

#import "@preview/physica:0.9.8": *
#import "@preview/mannot:0.3.3": *
#import "@preview/cetz:0.4.2"

// Blue: helpful/interesting but not strictly necessary
#let supplement-box(title: none, body) = {
  block(
    width: 100%,
    stroke: (left: 3pt + rgb("#2980b9")),
    inset: (left: 12pt, y: 8pt, right: 8pt),
    fill: rgb("#2980b9").lighten(92%),
    {
      if title != none {
        text(fill: rgb("#2980b9"), weight: "bold", title)
        parbreak()
      }
      body
    },
  )
}

// Purple: for the interested reader
#let advanced-box(title: none, body) = {
  block(
    width: 100%,
    stroke: (left: 3pt + rgb("#8e44ad")),
    inset: (left: 12pt, y: 8pt, right: 8pt),
    fill: rgb("#8e44ad").lighten(92%),
    {
      if title != none {
        text(fill: rgb("#8e44ad"), weight: "bold", title)
        parbreak()
      }
      body
    },
  )
}

// Important result box
#let result-box(body) = {
  block(
    width: 100%,
    stroke: 1.5pt + rgb("#c0392b"),
    inset: 12pt,
    radius: 4pt,
    body,
  )
}

// Key definition / equation box
#let key-box(body) = {
  block(
    width: 100%,
    stroke: 1.5pt + rgb("#f39c12"),
    inset: 12pt,
    radius: 4pt,
    fill: rgb("#f39c12").lighten(95%),
    body,
  )
}

// In-class exercise
#let exercise-box(body) = {
  block(
    width: 100%,
    stroke: (left: 3pt + rgb("#e74c3c")),
    inset: (left: 12pt, y: 8pt, right: 8pt),
    fill: rgb("#e74c3c").lighten(95%),
    {
      text(fill: rgb("#e74c3c"), weight: "bold")[In-class exercise]
      parbreak()
      body
    },
  )
}
