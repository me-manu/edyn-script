// Figure: oblique incidence with polarization in the plane of incidence.
// k vectors are drawn in black; a small (k, E, B) frame is superimposed at
// each ray's midpoint, tilted so its own local axes align with that ray.
#import "/lib.typ": cetz, vu, vb

#cetz.canvas(length: 1cm, {
  import cetz.draw: *

  // Boundary (vertical, hatched) and normal (horizontal)
  line((0, -2.2), (0, 2.8), stroke: 1.2pt + rgb("#8b6b3d"))
  for y in (-2.0, -1.6, -1.2, -0.8, -0.4, 0, 0.4, 0.8, 1.2, 1.6, 2.0, 2.4, 2.7) {
    line((0, y), (-0.3, y - 0.3), stroke: 0.5pt + rgb("#8b6b3d"))
  }
  content((0.4, -2.5), text(size: 8pt, fill: rgb("#8b6b3d"))[boundary])

  line((3.2, 0), (-3.2, 0), stroke: 0.7pt + black, mark: (end: ">", fill: black, size: 0.15))
  content((-2.0, 2.6), text(size: 10pt, weight: "bold")[1])
  content((2.0, 2.6), text(size: 10pt, weight: "bold")[2])

  let len = 2.6
  let thetaI = 32deg
  let thetaR = 32deg
  let thetaT = 20deg

  // Draws a k vector (black) with a small tilted (k, E, B) frame
  // superimposed at its midpoint: a k stub on top of the black arrow; E
  // in-plane, perpendicular to k (rotates with the ray); and B at 45° from
  // k, on the side opposite E (a stylized "out of page" direction — not
  // meant to be a literal fixed lab direction, but always at a consistent
  // angle from that ray's own k so it stays visually a diagonal, 3D-looking
  // axis rather than ever running parallel to k). `eflip` picks which of
  // the two in-plane perpendicular directions E (and hence B) uses.
  let ray-with-pol(from, to, labcol, midfrac: 0.55, eflip: false, bflip: false) = {
    line(from, to, stroke: 1.3pt + black, mark: (end: ">", fill: black, size: 0.18))
    let mx = from.at(0) + (to.at(0) - from.at(0)) * midfrac
    let my = from.at(1) + (to.at(1) - from.at(1)) * midfrac
    let dx = to.at(0) - from.at(0)
    let dy = to.at(1) - from.at(1)
    let norm = calc.sqrt(dx * dx + dy * dy)
    let (kx, ky) = (dx / norm, dy / norm)
    let sign = if eflip { -1 } else { 1 }
    let (px, py) = (sign * -ky, sign * kx) // in-plane, perpendicular to k

    // B direction: rotate k by -sign*45°, i.e. 45° from k, on the side
    // opposite E (135° away from E), so it never runs parallel to k.
    // `bflip` reverses this by 180° to keep (k, E, B) right-handed.
    let bang = -sign * 45deg
    let bsign = if bflip { -1 } else { 1 }
    let (bx0, by0) = (
      bsign * (kx * calc.cos(bang) - ky * calc.sin(bang)),
      bsign * (kx * calc.sin(bang) + ky * calc.cos(bang)),
    )

    // k stub: arrow on top of the black line, same direction
    line((mx, my), (mx + 0.9 * kx, my + 0.9 * ky), stroke: 1.4pt + labcol,
      mark: (end: ">", fill: labcol, size: 0.13))

    // E arrow: in-plane, perpendicular to k (tilted with the ray)
    line((mx, my), (mx + 0.6 * px, my + 0.6 * py), stroke: 1.1pt + labcol,
      mark: (end: ">", fill: labcol, size: 0.13))
    content((mx + 0.85 * px, my + 0.85 * py), text(size: 8pt, fill: labcol)[$vb(E)$])

    // B arrow: 45° from k
    line((mx, my), (mx + 0.55 * bx0, my + 0.55 * by0), stroke: 1.1pt + labcol,
      mark: (end: ">", fill: labcol, size: 0.13))
    content((mx + 0.8 * bx0, my + 0.8 * by0), text(size: 8pt, fill: labcol)[$vb(B)$])
  }

  ray-with-pol(
    (-len * calc.cos(thetaI), -len * calc.sin(thetaI)), (0, 0), rgb("#27ae60"),
    midfrac: 0.4,
  )
  content((-len * calc.cos(thetaI) - 0.15, -len * calc.sin(thetaI) - 0.15),
    text(size: 9pt, fill: rgb("#27ae60"))[$vb(k)_I$])

  ray-with-pol(
    (0, 0), (-len * calc.cos(thetaR), len * calc.sin(thetaR)), rgb("#e67e22"),
    midfrac: 0.45, eflip: true, bflip: true,
  )
  content((-len * calc.cos(thetaR) - 0.15, len * calc.sin(thetaR) + 0.15),
    text(size: 9pt, fill: rgb("#e67e22"))[$vb(k)_R$])

  ray-with-pol(
    (0, 0), (len * calc.cos(thetaT), len * calc.sin(thetaT)), rgb("#2980b9"),
    midfrac: 0.5,
  )
  content((len * calc.cos(thetaT) + 0.25, len * calc.sin(thetaT) + 0.1),
    text(size: 9pt, fill: rgb("#2980b9"))[$vb(k)_T$])

  // Angle arcs, as in the previous (geometry) figure
  let arc-radius = 0.9
  arc((arc-radius * calc.cos(180deg), arc-radius * calc.sin(180deg)),
    start: 180deg, stop: 180deg + thetaI, radius: arc-radius,
    stroke: 0.6pt + rgb("#27ae60"))
  content((-1.25, -0.28), text(size: 9pt, fill: rgb("#27ae60"))[$theta_I$])

  arc((arc-radius * calc.cos(180deg), arc-radius * calc.sin(180deg)),
    start: 180deg, stop: 180deg - thetaR, radius: arc-radius,
    stroke: 0.6pt + rgb("#e67e22"))
  content((-1.25, 0.28), text(size: 9pt, fill: rgb("#e67e22"))[$theta_R$])

  arc((arc-radius, 0), start: 0deg, stop: thetaT, radius: arc-radius,
    stroke: 0.6pt + rgb("#2980b9"))
  content((1.25, 0.28), text(size: 9pt, fill: rgb("#2980b9"))[$theta_T$])
})
