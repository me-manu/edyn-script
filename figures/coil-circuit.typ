// Figure: coil driven by a DC source, with a material core.
// The coil is drawn as a standard circuit-schematic inductor symbol
// (a row of humps along the wire), inline in a closed loop with the source.
#import "/lib.typ": cetz

#cetz.canvas(length: 1cm, {
  import cetz.draw: *

  // Battery (DC source) symbol
  line((-0.25, 1.3), (0.25, 1.3), stroke: 1.4pt)
  line((-0.12, 1.1), (0.12, 1.1), stroke: 3pt)
  content((-0.6, 1.4), text(size: 9pt)[$+$])
  content((0.75, 1.2), text(size: 9pt)[DC])

  // Coil geometry: n humps of radius r along a horizontal baseline
  let x0 = 2.0
  let baseline = 2.6
  let r = 0.35
  let n = 5
  let x-end = x0 + n * 2 * r

  // Material core behind the coil
  rect((x0, 2.3), (x-end, baseline + r + 0.1), stroke: 0.5pt + rgb("#2980b9"), fill: rgb("#2980b9").lighten(88%))
  content((x0 + (x-end - x0) / 2, 2.45), text(size: 8pt)[material])

  // Wires forming a closed loop: battery -- coil -- battery
  line((0, 1.3), (0, baseline), (x0, baseline), stroke: 0.8pt)
  line((0, 1.1), (0, -0.3), (x-end, -0.3), (x-end, baseline), stroke: 0.8pt)

  // Coil: row of humps (standard inductor symbol)
  for i in range(n) {
    arc((x0 + i * 2 * r, baseline), start: 180deg, stop: 0deg, radius: r, stroke: 1.2pt)
  }
})
