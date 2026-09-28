// Figure: battery-charged parallel-plate capacitor with a dielectric slab
#import "/lib.typ": cetz

#cetz.canvas(length: 1cm, {
  import cetz.draw: *

  // Wires: battery -- top plate, battery -- bottom plate
  line((0, 1.3), (0, 2.5), (2.3, 2.5), stroke: 0.8pt)
  line((0, 1.1), (0, 0.1), (2.3, 0.1), stroke: 0.8pt)

  // Battery symbol
  line((-0.25, 1.3), (0.25, 1.3), stroke: 1.4pt)
  line((-0.12, 1.1), (0.12, 1.1), stroke: 3pt)
  content((-0.6, 1.4), text(size: 9pt)[$+$])
  content((0.75, 1.2), text(size: 9pt)[$V_0$])

  // Capacitor plates (horizontal, field points down between them)
  line((2.3, 2.5), (4.5, 2.5), stroke: 2.5pt)
  line((2.3, 0.1), (4.5, 0.1), stroke: 2.5pt)
  for x in (2.6, 3.1, 3.6, 4.1) {
    content((x, 2.72), text(size: 8pt)[$+$])
    content((x, -0.12), text(size: 8pt)[$-$])
  }

  // Dielectric slab between the plates
  rect((2.5, 0.15), (4.3, 2.45), stroke: 0.5pt + rgb("#2980b9"), fill: rgb("#2980b9").lighten(88%))
  content((3.4, 1.3), text(size: 8pt)[dielectric])

  content((4.9, 2.5), text(size: 8pt)[$sigma_f$])
  content((4.95, 0.1), text(size: 8pt)[$-sigma_f$])
})
