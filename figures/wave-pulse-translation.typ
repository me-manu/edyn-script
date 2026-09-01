// Figure: a traveling wave g(z-vt) — same pulse shape shifted right at a later time
#import "/lib.typ": cetz

#cetz.canvas(length: 1cm, {
  import cetz.draw: *

  // Axes
  line((-0.5, 0), (7.5, 0), stroke: 1pt + black, mark: (end: ">", fill: black, size: 0.2))
  content((7.8, 0), text(size: 9pt)[$z$])
  line((-0.5, 0), (-0.5, 2.6), stroke: 1pt + black, mark: (end: ">", fill: black, size: 0.2))
  content((-0.5, 2.9), text(size: 9pt)[$g(z-v t)$])

  // Pulse shape at t = 0
  hobby(
    (0, 0), (0.3, 0.6), (0.7, 1.7), (1.0, 2.2), (1.3, 1.9),
    (1.6, 2.0), (1.9, 1.5), (2.3, 0.5), (2.6, 0),
    stroke: 1.3pt + rgb("#2980b9"),
  )
  content((1.3, -0.5), text(size: 9pt, fill: rgb("#2980b9"))[$t = 0$])

  // Same pulse shape, shifted right at t > 0
  let dx = 3.6
  hobby(
    (0 + dx, 0), (0.3 + dx, 0.6), (0.7 + dx, 1.7), (1.0 + dx, 2.2), (1.3 + dx, 1.9),
    (1.6 + dx, 2.0), (1.9 + dx, 1.5), (2.3 + dx, 0.5), (2.6 + dx, 0),
    stroke: 1.3pt + rgb("#e67e22"),
  )
  content((1.3 + dx, -0.5), text(size: 9pt, fill: rgb("#e67e22"))[$t > 0$])

  // Arrow indicating the direction of translation
  line((1.3, 2.6), (1.3 + dx, 2.6), stroke: 0.8pt + gray, mark: (end: ">", fill: gray, size: 0.18))
  content((1.3 + dx / 2, 2.85), text(size: 8pt, fill: gray)[shifts by $v t$])
})
