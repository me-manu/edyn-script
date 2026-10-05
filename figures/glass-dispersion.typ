// Figure: index of refraction of typical glass vs. wavelength (normal dispersion)
#import "/lib.typ": cetz

#cetz.canvas(length: 1cm, {
  import cetz.draw: *

  // Axes
  line((0, 0), (7, 0), stroke: 0.8pt + black, mark: (end: ">", fill: black, size: 0.15))
  content((7.3, 0), text(size: 9pt)[$lambda$])
  line((0, 0), (0, 4.2), stroke: 0.8pt + black, mark: (end: ">", fill: black, size: 0.15))
  content((0, 4.5), text(size: 9pt)[$n$])

  // Tick marks and labels
  line((0, 3.6), (-0.1, 3.6), stroke: 0.6pt + black)
  content((-0.35, 3.6), text(size: 8pt)[$1.5$])
  line((0, 0.6), (-0.1, 0.6), stroke: 0.6pt + black)
  content((-0.35, 0.6), text(size: 8pt)[$1.45$])

  line((1.2, 0), (1.2, -0.1), stroke: 0.6pt + black)
  content((1.2, -0.4), text(size: 8pt)[$10^3 mono("Å")$])
  line((6.2, 0), (6.2, -0.1), stroke: 0.6pt + black)
  content((6.2, -0.4), text(size: 8pt)[$10^4 mono("Å")$])

  // Decreasing dispersion curve (normal dispersion, steep near short wavelength)
  hobby(
    (1.2, 3.6), (1.8, 2.55), (2.6, 1.75), (3.6, 1.2), (4.8, 0.82), (6.2, 0.6),
    stroke: 1.3pt + rgb("#2980b9"),
  )
})
