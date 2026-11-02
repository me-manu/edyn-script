// Figure: the gauge-field configuration space. A gauge condition selects one
// representative (A, V) from the gauge orbit of equivalent configurations.
#import "/lib.typ": cetz, vb

#cetz.canvas(length: 1cm, {
  import cetz.draw: *

  let red = rgb("#c0392b")

  // Axes
  line((0, 0), (0, 4.2), stroke: 0.7pt + black, mark: (end: ">", fill: black, size: 0.15))
  content((-0.75, 4.2), text(size: 9pt)[$vb(A)(vb(x),t)$])
  line((0, 0), (7.8, 0), stroke: 0.7pt + black, mark: (end: ">", fill: black, size: 0.15))
  content((8.35, 0), text(size: 9pt)[$V(vb(x),t)$])

  // Gauge orbit: a smooth curve through configuration space
  let pts = ((0.6, 0.9), (1.8, 1.7), (3.2, 2.15), (4.6, 2.5), (6.0, 3.0), (7.0, 3.7))
  hobby(..pts, stroke: 1pt + black)

  // Tick marks and labels along the orbit for the first few configurations
  content((pts.at(0).at(0) - 0.1, pts.at(0).at(1) + 0.4), text(size: 8pt)[$vb(A), V$])
  content((pts.at(1).at(0) - 0.1, pts.at(1).at(1) + 0.4), text(size: 8pt)[$vb(A)', V'$])
  content((pts.at(2).at(0) - 0.1, pts.at(2).at(1) + 0.4), text(size: 8pt)[$vb(A)'', V'', dots.h$])

  // The gauge condition selects one configuration, marked in red (drawn as
  // two crossed strokes, exactly centered on the curve point — a math glyph
  // placed via content() is not reliably centered on its anchor)
  let sel = pts.at(4)
  let s = 0.09
  line((sel.at(0) - s, sel.at(1) - s), (sel.at(0) + s, sel.at(1) + s), stroke: 1pt + red)
  line((sel.at(0) - s, sel.at(1) + s), (sel.at(0) + s, sel.at(1) - s), stroke: 1pt + red)
  content(
    (sel.at(0) - 0.3, sel.at(1) + 1.1),
    text(size: 9pt, fill: red)[gauge condition\ selects one configuration],
  )
  line((sel.at(0) - 0.2, sel.at(1) + 0.65), (sel.at(0), sel.at(1) + 0.2),
    stroke: 0.6pt + red, mark: (end: ">", fill: red, size: 0.12))

  // "Gauge orbit" label pointing at the curve
  content((5.2, 1.5), text(size: 9pt, fill: rgb("#2980b9"))[gauge "orbit" — along this\ line $vb(E)$ and $vb(B)$ do not change])
  line((5.6, 1.9), (5.5, 2.75), stroke: 0.6pt + rgb("#2980b9"),
    mark: (end: ">", fill: rgb("#2980b9"), size: 0.12))
})
