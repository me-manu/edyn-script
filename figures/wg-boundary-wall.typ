// Figure: the boundary between the inside of the wave guide and the inside
// of the (perfectly) conducting wall, styled like figures/conductor-boundary.typ.
#import "/lib.typ": cetz, vb

#cetz.canvas(length: 1cm, {
  import cetz.draw: *

  let wall = rgb("#8b6b3d")

  // Boundary wall (vertical, hatched)
  line((0, -1.6), (0, 2.0), stroke: 1.2pt + wall)
  for y in (-1.5, -1.1, -0.7, -0.3, 0.1, 0.5, 0.9, 1.3, 1.7) {
    line((0, y), (0.3, y - 0.3), stroke: 0.5pt + wall)
  }

  content((-1.5, 1.8), text(size: 9pt)[inside\ wave guide])
  content((1.5, 1.8), text(size: 9pt)[inside conductor])

  // Small x, y, z axis triad on the wave-guide side: the wall is the
  // y-z plane, so the vertical (up) and diagonal (depth) arrows — both
  // lying within the boundary — are z and y, and the horizontal arrow
  // (the normal, pointing from the wave guide into the conductor) is x.
  line((-2.3, -1.1), (-2.3, -0.3), stroke: 0.6pt + black, mark: (end: ">", fill: black, size: 0.12))
  content((-2.5, -0.1), text(size: 8pt)[$z$])
  line((-2.3, -1.1), (-1.6, -1.1), stroke: 0.6pt + black, mark: (end: ">", fill: black, size: 0.12))
  content((-1.4, -1.1), text(size: 8pt)[$x$])
  line((-2.3, -1.1), (-1.8, -0.6), stroke: 0.6pt + black, mark: (end: ">", fill: black, size: 0.12))
  content((-1.65, -0.45), text(size: 8pt)[$y$])

  // Field annotations inside the conductor
  content((1.0, 0.5), text(size: 10pt)[$vb(E)_2 = vb(0)$])
  content((1.0, -0.1), text(size: 10pt)[$vb(B)_2 = vb(0)$])
})
