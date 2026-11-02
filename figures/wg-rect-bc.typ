// Figure: the rectangular wave guide, with the boundary condition
// B_perp = 0 annotated on the walls x = 0 and x = a.
#import "/lib.typ": cetz

#cetz.canvas(length: 1cm, {
  import cetz.draw: *

  let gray-fill = rgb("#d0d0d0")
  let axis-stroke = 0.7pt + black
  let orange = rgb("#e67e22")
  let bw = 1.6
  let ah = 2.3
  let dz = (2.3, 1.3)

  let nbl = (0, 0)
  let nbr = (bw, 0)
  let ntr = (bw, ah)
  let ntl = (0, ah)
  let fbl = (nbl.at(0) + dz.at(0), nbl.at(1) + dz.at(1))
  let fbr = (nbr.at(0) + dz.at(0), nbr.at(1) + dz.at(1))
  let ftr = (ntr.at(0) + dz.at(0), ntr.at(1) + dz.at(1))
  let ftl = (ntl.at(0) + dz.at(0), ntl.at(1) + dz.at(1))

  // Solid faces for a 3D look
  line(ntl, ntr, ftr, ftl, close: true, fill: gray-fill.lighten(20%), stroke: none)
  line(nbr, ntr, ftr, fbr, close: true, fill: gray-fill, stroke: none)
  line(nbl, nbr, ntr, ntl, close: true, fill: gray-fill.darken(5%), stroke: none)

  // Visible edges
  line(nbl, nbr, ntr, ntl, close: true, stroke: 1pt + black)
  line(ntl, ftl, stroke: 1pt + black)
  line(ntr, ftr, stroke: 1pt + black)
  line(nbr, fbr, stroke: 1pt + black)
  line(ftl, ftr, fbr, stroke: 1pt + black)
  // Hidden edge (dashed), doubling as the tube's center line
  line(nbl, fbl, stroke: (paint: black, thickness: 0.5pt, dash: "dashed"))

  // Axes at the origin corner
  line(nbl, (nbl.at(0), nbl.at(1) + 3.1), stroke: axis-stroke, mark: (end: ">", fill: black, size: 0.15))
  content((nbl.at(0), nbl.at(1) + 3.35), text(size: 9pt)[$x$])
  line(nbl, (nbl.at(0) + 2.6, nbl.at(1)), stroke: axis-stroke, mark: (end: ">", fill: black, size: 0.15))
  content((nbl.at(0) + 2.8, nbl.at(1)), text(size: 9pt)[$y$])
  // (typst's calc.atan2 takes (x, y), not (y, x))
  let zang = calc.atan2(dz.at(0), dz.at(1))
  line(fbl, (fbl.at(0) + 0.8 * calc.cos(zang), fbl.at(1) + 0.8 * calc.sin(zang)),
    stroke: axis-stroke, mark: (end: ">", fill: black, size: 0.15))
  content((fbl.at(0) + 1.0 * calc.cos(zang), fbl.at(1) + 1.0 * calc.sin(zang)),
    text(size: 9pt)[$z$])

  // a, b dimension braces
  content((-0.55, ah / 2), text(size: 9pt)[$a$])
  line((-0.35, 0), (-0.35, ah), stroke: 0.5pt + black,
    mark: (end: ">", start: ">", fill: black, size: 0.08))
  content((bw / 2, -0.5), text(size: 9pt)[$b$])
  line((0, -0.3), (bw, -0.3), stroke: 0.5pt + black,
    mark: (end: ">", start: ">", fill: black, size: 0.08))

  // B_perp = 0 annotation on the top wall (x = a): the target point lies
  // inside the top face itself (not on its left edge), reached via the
  // face's own (width, depth) parameterization from ntl.
  let top-target = (ntl.at(0) + 0.45 * bw + 0.4 * dz.at(0), ntl.at(1) + 0.4 * dz.at(1))
  content((top-target.at(0) - 0.65, top-target.at(1) + 0.8), text(size: 9pt, fill: orange)[$B^perp = 0$])
  line((top-target.at(0) - 0.65, top-target.at(1) + 0.55), top-target, stroke: 0.6pt + orange,
    mark: (end: ">", fill: orange, size: 0.12))

  // B_perp = 0 annotation on the bottom wall (x = 0), clear of the b-brace
  let bot-target = (nbl.at(0) + 0.9, nbl.at(1))
  content((bw + 0.55, -0.9), text(size: 9pt, fill: orange)[$B^perp = 0$])
  line((bw + 0.4, -0.7), bot-target, stroke: 0.6pt + orange,
    mark: (end: ">", fill: orange, size: 0.12))

  // Small arrows on the near cross-sectional face, pointing inward from
  // each wall, matching the hand-drawn notes. They sit below/above the
  // box's top/bottom edges (not above them), clear of the bigger "B_perp
  // = 0" callouts and the a/b braces.
  line((0.5, ah), (0.5, ah - 0.45), stroke: 0.6pt + orange,
    mark: (end: ">", fill: orange, size: 0.1))
  content((1.35, ah - 0.25), text(size: 8pt, fill: orange)[$B^perp (x=a)$])

  line((0.5, 0), (0.5, 0.45), stroke: 0.6pt + orange,
    mark: (end: ">", fill: orange, size: 0.1))
  content((1.3, 0.35), text(size: 8pt, fill: orange)[$B^perp (x=0)$])
})
