// Figure: Sphere with uniform charge distribution getting polarized by external E field
#import "/lib.typ": cetz

#cetz.canvas(length: 1cm, {
  import cetz.draw: *

  // --- Left: unpolarized sphere ---
  circle((-4, 0), radius: 1.5, stroke: 1.2pt + rgb("#2980b9"))

  // Random charges inside
  let charges = (
    ((-4.6, 0.5), "+"), ((-3.5, 0.7), "-"), ((-4.3, -0.3), "-"),
    ((-3.4, -0.5), "+"), ((-4.8, -0.6), "+"), ((-3.2, 0.2), "-"),
    ((-4.1, 0.9), "-"), ((-4.5, 0.1), "+"), ((-3.7, -0.8), "+"),
    ((-4.0, -0.5), "-"),
  )
  for (pos, sign) in charges {
    let clr = if sign == "+" { rgb("#e74c3c") } else { rgb("#2980b9") }
    content(pos, text(size: 7pt, fill: clr, weight: "bold")[#sign])
  }

  // Arrow to the right
  line((-2.0, 0), (-0.5, 0), stroke: 1pt, mark: (end: ">", size: 0.25))
  content((-1.25, 0.6), text(size: 8pt)[Apply $va(E)$])

  // External E field arrow
  line((0.8, -1.8), (0.8, 1.8), stroke: 1.2pt + rgb("#e67e22"),
    mark: (end: ">", fill: rgb("#e67e22"), size: 0.25))
  content((1.3, 1.5), text(size: 9pt, fill: rgb("#e67e22"))[$va(E)$])

  // --- Right: polarized sphere ---
  // Negative charges (blue circle, shifted down)
  circle((3, -0.3), radius: 1.5, stroke: 1pt + rgb("#2980b9"))

  // Positive charges (red circle, shifted up)
  circle((3, 0.3), radius: 1.5, stroke: 1pt + rgb("#e74c3c"))

  // Displacement vector d
  line((3, -0.3), (3, 0.3), stroke: 1pt + rgb("#e67e22"),
    mark: (end: ">", fill: rgb("#e67e22"), size: 0.2))
  content((3.4, 0.0), text(size: 8pt, fill: rgb("#e67e22"))[$va(d)$])

  // Plus signs at top
  for x in (2.3, 2.7, 3.0, 3.3, 3.7) {
    content((x, 1.5), text(size: 6pt, fill: rgb("#e74c3c"), weight: "bold")[$+$])
  }
  // Minus signs at bottom
  for x in (2.3, 2.7, 3.0, 3.3, 3.7) {
    content((x, -1.5), text(size: 6pt, fill: rgb("#2980b9"), weight: "bold")[$-$])
  }
})
