// Figure: intensity of a spherical wave dropping off with distance —
// transmitter at a point source, with concentric wavefronts of growing
// area A1..A5, and a receiver intercepting the outermost one.
#import "/lib.typ": cetz

#cetz.canvas(length: 1cm, {
  import cetz.draw: *

  let radii = (0.8, 1.4, 2.0, 2.6, 3.2)

  // Transmitter
  circle((0, 0), radius: 0.06, fill: black, stroke: none)
  content((-0.85, 0.15), text(size: 8pt)[transmitter])

  // Wavefronts, open towards the transmitter (concave left), drawn in the
  // region between the transmitter and the receiver
  for (i, r) in radii.enumerate() {
    arc((r * calc.cos(-80deg), r * calc.sin(-80deg)), start: -80deg, stop: 80deg,
      radius: r, stroke: 1pt + black)
    content((r * calc.cos(80deg) + 0.1, r * calc.sin(80deg) + 0.22),
      text(size: 9pt)[$A_#(i + 1)$])
  }

  // Receiver bracket, tangent to the outermost wavefront A5 (its left edge
  // just touches the circle's rightmost point, without crossing into it)
  let rmax = radii.last()
  let rx = rmax
  line((rx, 0.45), (rx + 0.18, 0.45), (rx + 0.18, -0.45), (rx, -0.45),
    stroke: 1pt + black)
  content((rx + 0.9, 0), text(size: 9pt)[receiver])

  // Baseline from transmitter to receiver
  line((0, 0), (rx, 0), stroke: 0.6pt + black)
})
