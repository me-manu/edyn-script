// Figure: transverse EM wave for two linear polarizations, u-hat = x-hat and u-hat = y-hat
#import "/lib.typ": cetz, vu

#cetz.canvas(length: 1cm, {
  import cetz.draw: *

  // Draws one 3D-style panel: a wave propagating along z (to the right),
  // oscillating along the direction osc-dir (a 2D vector in the drawing plane).
  let panel(origin, osc-dir, u-label, col) = {
    let (ox, oy) = origin
    let z-len = 5.2
    let amp = 1.1
    let n-cycles = 1.5

    // Axes: z (right), x (up), y (diagonal, for pseudo-3D depth)
    line((ox, oy), (ox + z-len + 0.5, oy), stroke: 0.8pt + black, mark: (end: ">", fill: black, size: 0.16))
    content((ox + z-len + 0.8, oy), text(size: 9pt)[$z$])
    line((ox, oy), (ox, oy + 2.0), stroke: 0.8pt + black, mark: (end: ">", fill: black, size: 0.16))
    content((ox, oy + 2.3), text(size: 9pt)[$x$])
    line((ox, oy), (ox - 1.1, oy - 0.65), stroke: 0.8pt + black, mark: (end: ">", fill: black, size: 0.16))
    content((ox - 1.4, oy - 0.8), text(size: 9pt)[$y$])

    // Sampled wave curve and field arrows
    let n-samples = 28
    let pts = ()
    for i in range(n-samples + 1) {
      let t = i / n-samples
      let s = amp * calc.sin(2 * calc.pi * n-cycles * t)
      let x = ox + z-len * t + s * osc-dir.at(0)
      let y = oy + s * osc-dir.at(1)
      pts.push((x, y))
    }
    hobby(..pts, stroke: 1.2pt + black)

    // Field arrows at a few points along the curve
    for i in range(0, n-samples + 1, step: 4) {
      let t = i / n-samples
      let s = amp * calc.sin(2 * calc.pi * n-cycles * t)
      let base = (ox + z-len * t, oy)
      let tip = (ox + z-len * t + s * osc-dir.at(0), oy + s * osc-dir.at(1))
      if calc.abs(s) > 0.05 {
        line(base, tip, stroke: 0.9pt + col, mark: (end: ">", fill: col, size: 0.14))
      }
    }

    // Polarization vector u-hat, drawn at the origin
    let u-tip = (ox + 0.9 * osc-dir.at(0), oy + 0.9 * osc-dir.at(1))
    line((ox, oy), u-tip, stroke: 1.4pt + rgb("#c0392b"), mark: (end: ">", fill: rgb("#c0392b"), size: 0.18))
    content((u-tip.at(0) + 0.35 * osc-dir.at(0), u-tip.at(1) + 0.35 * osc-dir.at(1)), text(size: 9pt, fill: rgb("#c0392b"))[$vu(u)$])

    content((ox + z-len / 2, oy - 1.7), text(size: 9pt)[#u-label])
  }

  panel((0, 0), (0, 1), $vu(u) = vu(x)$, rgb("#2980b9"))
  panel((8.5, 0), (-0.6, -0.35), $vu(u) = vu(y)$, rgb("#8e44ad"))
})
