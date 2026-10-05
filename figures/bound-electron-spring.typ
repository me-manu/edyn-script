// Figure: electron bound to a nucleus by a spring force (Lorentz model)
#import "/lib.typ": cetz

#cetz.canvas(length: 1cm, {
  import cetz.draw: *

  // x axis (vertical), pointing up
  line((-1.3, -1.8), (-1.3, 2.4), stroke: 0.7pt + black, mark: (end: ">", fill: black, size: 0.15))
  content((-1.3, 2.7), text(size: 9pt)[$x$])

  // Equilibrium position (dashed)
  line((-0.9, 0), (2.4, 0), stroke: (paint: gray, dash: "dashed", thickness: 0.6pt))
  content((1.9, 0.25), text(size: 8pt, fill: gray)[equilibrium])

  // Nucleus
  circle((0, -1.2), radius: 0.35, fill: rgb("#f5b7b1"), stroke: 0.8pt + rgb("#c0392b"))
  content((0, -1.2), text(size: 9pt, fill: rgb("#c0392b"), weight: "bold")[$+$])
  content((0.95, -1.2), text(size: 8pt)[nucleus])

  // Spring: zigzag between nucleus (top) and electron (bottom)
  let n = 10
  let y0 = -0.85
  let y1 = 0.85
  let pts = ()
  for i in range(n + 1) {
    let y = y0 + (y1 - y0) * i / n
    let xo = if i == 0 or i == n { 0 } else if calc.rem(i, 2) == 1 { 0.14 } else { -0.14 }
    pts.push((xo, y))
  }
  line(..pts, stroke: 1pt + black)
  content((0.75, -0.55), text(size: 8pt, fill: gray)[$k_"spring"$])

  // Electron, displaced by x from equilibrium
  circle((0, 1.1), radius: 0.09, fill: black, stroke: none)
  content((0.6, 1.1), text(size: 8pt)[electron])

  // Displacement x from equilibrium
  line((-0.55, 0), (-0.55, 1.1), stroke: 0.9pt + rgb("#2980b9"),
    mark: (end: ">", fill: rgb("#2980b9"), size: 0.13))
  content((-0.85, 0.55), text(size: 9pt, fill: rgb("#2980b9"))[$x$])
})
