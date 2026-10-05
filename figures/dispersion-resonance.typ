// Figure: index of refraction n and absorption coefficient alpha_j near a
// Lorentz-oscillator resonance at omega_j
#import "/lib.typ": cetz

#cetz.canvas(length: 1cm, {
  import cetz.draw: *

  // Axes
  line((0, 0.6), (8, 0.6), stroke: 0.8pt + black, mark: (end: ">", fill: black, size: 0.15))
  content((8.3, 0.6), text(size: 9pt)[$omega$])

  // omega_1, omega_j, omega_2 tick marks (labels placed well clear of the
  // curves, which dip close to the axis and below it near omega_j)
  line((2.6, 0.6), (2.6, 0.45), stroke: 0.6pt + black)
  content((2.6, -1.5), text(size: 8pt)[$omega_1$])
  line((4.0, 0.6), (4.0, 0.45), stroke: 0.6pt + black)
  content((4.0, -1.5), text(size: 8pt)[$omega_j$])
  line((5.4, 0.6), (5.4, 0.45), stroke: 0.6pt + black)
  content((5.4, -1.5), text(size: 8pt)[$omega_2$])
  line((4.0, 0.6), (4.0, 3.6), stroke: 0.4pt + gray)

  // alpha_j: Lorentzian-like absorption peak centered at omega_j
  hobby(
    (1.0, 0.65), (2.6, 0.85), (3.4, 1.8), (4.0, 3.6), (4.6, 1.8), (5.4, 0.85), (7.0, 0.65),
    stroke: 1.3pt + rgb("#c0392b"),
  )
  content((5.9, 2.6), text(size: 9pt, fill: rgb("#c0392b"))[$alpha_j$])

  // n (or n_j - 1): rises before the resonance (normal dispersion), drops
  // sharply through it (anomalous dispersion), then rises again slowly
  hobby(
    (1.0, 1.3), (2.0, 1.75), (2.6, 2.5), (3.3, 2.9),
    (3.8, 1.9), (4.0, 0.6), (4.2, -0.7), (4.7, -1.4),
    (5.4, -1.1), (6.2, -0.4), (7.0, -0.1),
    stroke: 1.3pt + rgb("#2980b9"),
  )
  content((2.35, 3.1), text(size: 9pt, fill: rgb("#2980b9"))[$n$])

  content((1.3, -2.1), text(size: 8pt)[normal dispersion])
  content((5.7, -2.1), text(size: 8pt)[anomalous dispersion])
})
