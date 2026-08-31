// Figure: Surface orientation for Stokes' theorem
// Surface S with normal vector n-hat, boundary curve C with direction from right-hand rule
#import "/lib.typ": cetz

#cetz.canvas(length: 1cm, {
  import cetz.draw: *

  // Tilted ellipse representing surface S
  hobby(
    (-2.5, -0.3), (-1.0, -0.8), (1.0, -0.5), (2.5, 0.2),
    (1.5, 0.8), (-0.5, 0.6), (-2.0, 0.3),
    close: true,
    stroke: 1.2pt + rgb("#2980b9"),
    fill: rgb("#2980b9").lighten(90%),
  )

  // Hatching lines inside surface
  for x in (-1.5, -0.5, 0.5, 1.5) {
    line((x, -0.2), (x + 0.3, 0.4), stroke: 0.3pt + rgb("#2980b9"))
  }

  // Normal vector
  line((0.5, 0.2), (0.5, 2.0), stroke: 1.2pt + red, mark: (end: ">", fill: red, size: 0.25))
  content((0.9, 1.8), text(size: 9pt, fill: red)[$vu(n)$])

  // Boundary curve direction arrow
  content((-2.8, -0.5), text(size: 9pt, fill: rgb("#2980b9"))[$C$])

  // dl arrow along boundary
  line((-2.2, -0.1), (-2.5, -0.35), stroke: 1pt + rgb("#e74c3c"),
    mark: (end: ">", fill: rgb("#e74c3c"), size: 0.2))
  content((-2.9, -0.1), text(size: 8pt, fill: rgb("#e74c3c"))[$dd(va(l))$])

  // Label
  content((3.0, 0.2), text(size: 9pt)[$S$])
})
