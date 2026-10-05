// Figure: EM wave (E along x, propagating along z) driving an electron on a spring
#import "/lib.typ": cetz, vb

#cetz.canvas(length: 1cm, {
  import cetz.draw: *

  let red = rgb("#c0392b")
  let amp = 1.1
  let lam = 4.0

  // Propagation axis z (horizontal), x axis (vertical) at the left
  line((0, 0), (7.6, 0), stroke: 0.7pt + black, mark: (end: ">", fill: black, size: 0.15))
  content((7.9, -0.25), text(size: 9pt)[$z$])
  line((0, -1.4), (0, 2.3), stroke: 0.7pt + black, mark: (end: ">", fill: black, size: 0.15))
  content((0.25, 2.5), text(size: 9pt)[$x$])

  // Wave E(z) along x: one wavelength
  let n = 40
  let pts = ()
  for i in range(n + 1) {
    let t = i / n
    pts.push((lam * t, amp * calc.sin(2 * calc.pi * t)))
  }
  hobby(..pts, stroke: 1.2pt + red)

  // Field arrows along the wave
  for i in range(0, n + 1, step: 5) {
    let t = i / n
    let y = amp * calc.sin(2 * calc.pi * t)
    if calc.abs(y) > 0.12 {
      line((lam * t, 0), (lam * t, y), stroke: 0.9pt + red,
        mark: (end: ">", fill: red, size: 0.13))
    }
  }
  content((1.0, 1.55), text(size: 9pt, fill: red)[$vb(E)$])

  // Propagation velocity
  line((1.2, 2.0), (3.2, 2.0), stroke: 0.9pt + black, mark: (end: ">", fill: black, size: 0.13))
  content((2.2, 2.3), text(size: 9pt)[$v$])

  // Electron on a spring, attached to the axis
  let xe = 5.9
  line((xe - 0.45, 0), (xe + 0.45, 0), stroke: 1.6pt + black)
  let m = 10
  let ys = 0.0
  let ye = 1.5
  let spts = ()
  for i in range(m + 1) {
    let y = ys + (ye - ys) * i / m
    let xo = if i == 0 or i == m { 0 } else if calc.rem(i, 2) == 1 { 0.14 } else { -0.14 }
    spts.push((xe + xo, y))
  }
  line(..spts, stroke: 1pt + black)
  circle((xe, 1.7), radius: 0.09, fill: black, stroke: none)
  content((xe + 0.65, 1.7), text(size: 8pt)[electron])
  content((xe + 0.6, 0.7), text(size: 8pt, fill: gray)[$k_"spring"$])
})
