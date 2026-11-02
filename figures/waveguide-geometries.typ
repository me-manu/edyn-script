// Figure: the two example wave-guide geometries (cylindrical and
// rectangular), drawn in a cavalier-style projection: the x-y cross
// section is shown true-shape, with z the diagonal (receding) direction.
#import "/lib.typ": cetz

#cetz.canvas(length: 1cm, {
  import cetz.draw: *

  let gray-fill = rgb("#d0d0d0")
  let axis-stroke = 0.7pt + black

  // ── Cylindrical wave guide (left) ──────────────────────────────────
  let r = 0.75
  let dz = (2.6, 1.4)
  let far = dz
  // angle of the center-to-center direction, measured the usual way
  // (typst's calc.atan2 takes (x, y), not (y, x))
  let cl-angle = calc.atan2(dz.at(0), dz.at(1))
  let perp = cl-angle + 90deg
  let (px, py) = (calc.cos(perp), calc.sin(perp))

  let top-near = (r * px, r * py)
  let top-far = (far.at(0) + r * px, far.at(1) + r * py)
  let bot-near = (-r * px, -r * py)
  let bot-far = (far.at(0) - r * px, far.at(1) - r * py)

  // Tube body (tangent lines) with light fill for a solid look
  line(top-near, top-far, bot-far, bot-near, close: true,
    fill: gray-fill, stroke: none)
  circle((0, 0), radius: r, fill: gray-fill, stroke: none)

  // Far cap (half-circle arc, the visible far rim), shaded like the rest
  // of the tube
  arc(top-far, start: perp, stop: perp - 180deg, radius: r,
    mode: "CLOSE", fill: gray-fill, stroke: none)
  arc(top-far, start: perp, stop: perp - 180deg, radius: r, stroke: 1pt + black)
  // Tangent lines
  line(top-near, top-far, stroke: 1pt + black)
  line(bot-near, bot-far, stroke: 1pt + black)
  // Near face (full circle, drawn on top)
  circle((0, 0), radius: r, fill: none, stroke: 1pt + black)

  // Dashed center line through the tube: starts at the origin, and ends
  // at the point on the back circle that is furthest out along the tube
  // axis (so it exactly meets the cap rim, without crossing into it).
  let back-anchor = (far.at(0) + r * calc.cos(cl-angle), far.at(1) + r * calc.sin(cl-angle))
  line((0, 0), back-anchor, stroke: (paint: black, thickness: 0.5pt, dash: "dashed"))

  // x, y axes (true cross-section) and z — a straight prolongation of the
  // dashed center line, starting exactly where it meets the back cap.
  line((0, 0), (0, 1.3), stroke: axis-stroke, mark: (end: ">", fill: black, size: 0.15))
  content((0, 1.55), text(size: 9pt)[$x$])
  line((0, 0), (2.1, 0), stroke: axis-stroke, mark: (end: ">", fill: black, size: 0.15))
  content((2.35, 0), text(size: 9pt)[$y$])
  line(back-anchor, (back-anchor.at(0) + 0.9 * calc.cos(cl-angle), back-anchor.at(1) + 0.9 * calc.sin(cl-angle)),
    stroke: axis-stroke, mark: (end: ">", fill: black, size: 0.15))
  content((back-anchor.at(0) + 1.15 * calc.cos(cl-angle), back-anchor.at(1) + 1.15 * calc.sin(cl-angle)),
    text(size: 9pt)[$z$])

  // R arrow
  let rang = 150deg
  line((0, 0), (r * calc.cos(rang), r * calc.sin(rang)), stroke: 0.6pt + black,
    mark: (end: ">", fill: black, size: 0.1))
  content((r * calc.cos(rang) - 0.25, r * calc.sin(rang) + 0.05), text(size: 8pt)[$R$])

  content((0.2, -1.3), text(size: 9pt, fill: rgb("#2980b9"))[cylindrical wave guide])

  // ── Rectangular wave guide (right) ─────────────────────────────────
  let xoff = 5.6
  let bw = 1.5
  let ah = 1.9
  let dzb = (2.0, 1.1)

  let nbl = (xoff, 0)
  let nbr = (xoff + bw, 0)
  let ntr = (xoff + bw, ah)
  let ntl = (xoff, ah)
  let fbl = (nbl.at(0) + dzb.at(0), nbl.at(1) + dzb.at(1))
  let fbr = (nbr.at(0) + dzb.at(0), nbr.at(1) + dzb.at(1))
  let ftr = (ntr.at(0) + dzb.at(0), ntr.at(1) + dzb.at(1))
  let ftl = (ntl.at(0) + dzb.at(0), ntl.at(1) + dzb.at(1))

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
  line(nbl, (nbl.at(0), nbl.at(1) + 2.5), stroke: axis-stroke, mark: (end: ">", fill: black, size: 0.15))
  content((nbl.at(0), nbl.at(1) + 2.75), text(size: 9pt)[$x$])
  line(nbl, (nbl.at(0) + 2.3, nbl.at(1)), stroke: axis-stroke, mark: (end: ">", fill: black, size: 0.15))
  content((nbl.at(0) + 2.5, nbl.at(1)), text(size: 9pt)[$y$])
  let zang = calc.atan2(dzb.at(0), dzb.at(1))
  line(fbl, (fbl.at(0) + 0.8 * calc.cos(zang), fbl.at(1) + 0.8 * calc.sin(zang)),
    stroke: axis-stroke, mark: (end: ">", fill: black, size: 0.15))
  content((fbl.at(0) + 1.0 * calc.cos(zang), fbl.at(1) + 1.0 * calc.sin(zang)),
    text(size: 9pt)[$z$])

  content((xoff + 0.9, -1.3), text(size: 9pt, fill: rgb("#2980b9"))[rectangular wave guide])
})
