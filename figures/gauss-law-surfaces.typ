// Figure: Gauss's law — different surfaces enclosing a charge Q
// S1 (inner, black), S2 (outer, orange), S3 (purple, not enclosing Q)
#import "/lib.typ": cetz

#cetz.canvas(length: 1cm, {
  import cetz.draw: *

  // S1: inner ellipse around Q
  circle((0, 0), radius: (1.5, 1.0), stroke: 1.5pt + black, name: "S1")
  content((1.7, 0.5), text(size: 9pt)[$S_1$])

  // Charge Q
  circle((0, -0.1), radius: 0.08, fill: red, stroke: none)
  content((0.3, -0.35), text(size: 9pt, fill: red)[$Q$])

  // Field lines from Q (red arrows)
  let arrow-dirs = (0, 45, 90, 135, 180, 225, 270, 315)
  for angle in arrow-dirs {
    let rad = angle * calc.pi / 180
    let dx = calc.cos(rad)
    let dy = calc.sin(rad)
    let x0 = 0.2 * dx
    let y0 = 0.2 * dy - 0.1
    let x1 = 1.1 * dx
    let y1 = 1.1 * dy - 0.1
    line((x0, y0), (x1, y1), stroke: 0.8pt + red, mark: (end: ">", fill: red, size: 0.2))
  }

  // S2: outer blob (orange)
  hobby(
    (-3.0, 0), (-2.0, 2.0), (0, 2.5), (2.5, 1.5), (3.0, 0),
    (2.5, -1.5), (0, -2.0), (-2.5, -1.5),
    close: true,
    stroke: 1.8pt + rgb("#e67e22"),
  )
  content((1.5, 2.2), text(size: 9pt, fill: rgb("#e67e22"))[$S_2$])

  // S3: surface not enclosing Q (purple), off to the right
  hobby(
    (1.5, 1.0), (2.0, 1.8), (3.5, 1.5), (4.0, 0),
    (3.5, -1.5), (2.0, -1.8), (1.5, -1.0),
    close: true,
    stroke: 1.8pt + rgb("#8e44ad"),
  )
  content((3.8, 1.2), text(size: 9pt, fill: rgb("#8e44ad"))[$S_3$])

  // Annotations
  content((5.5, 1.5), align(left, text(size: 8pt)[
    Flux through $S_1$ and $S_2$ \
    is the same: $Q \/ epsilon_0$
  ]))
  content((5.5, -0.5), align(left, text(size: 8pt, fill: rgb("#8e44ad"))[
    Flux through $S_3$ is zero \ (does not enclose $Q$)
  ]))
})
