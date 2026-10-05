// Figure: wave hitting the boundary between a non-conducting medium and a
// conductor. Styled like figures/oblique-incidence-geometry.typ, with a
// small (E, B) frame added on the incident ray.
#import "/lib.typ": cetz, vu, vb

#cetz.canvas(length: 1cm, {
  import cetz.draw: *

  // Boundary (vertical, hatched) and z axis
  line((0, -2.2), (0, 2.6), stroke: 1.2pt + rgb("#8b6b3d"))
  for y in (-2.0, -1.6, -1.2, -0.8, -0.4, 0, 0.4, 0.8, 1.2, 1.6, 2.0, 2.4) {
    line((0, y), (0.3, y - 0.3), stroke: 0.5pt + rgb("#8b6b3d"))
  }
  content((0.4, -2.5), text(size: 8pt, fill: rgb("#8b6b3d"))[boundary])

  line((-3.2, 0), (3.2, 0), stroke: 0.7pt + black, mark: (end: ">", fill: black, size: 0.15))
  content((3.5, 0), text(size: 9pt)[$z$])

  // Surface normal: short arrow at the boundary, near the bottom
  line((0, -1.9), (-0.9, -1.9), stroke: 0.7pt + black, mark: (end: ">", fill: black, size: 0.15))
  content((-1.3, -2.25), text(size: 9pt)[$vu(n) = -vu(z)$])

  content((-2.0, 2.4), text(size: 10pt, weight: "bold")[1])
  content((2.3, 2.4), text(size: 10pt, weight: "bold", fill: rgb("#555555"))[conductor])

  let len = 2.6
  let thetaI = 32deg
  let thetaR = 32deg
  let thetaT = 20deg

  // Incident ray: from lower-left to origin, with a small (k, E, B) frame
  // at its midpoint, in the same style as the polarization-in-plane figure.
  let ex = -len * calc.cos(thetaI)
  let ey = -len * calc.sin(thetaI)
  line((ex, ey), (0, 0), stroke: 1.3pt + black,
    mark: (end: ">", fill: black, size: 0.18))
  content((ex - 0.3, ey - 0.3), text(size: 9pt, fill: rgb("#27ae60"))[$vb(k)_I$])

  // Tilted (k, E, B) frame superimposed on the incident ray, as in the
  // oblique-incidence polarization figure.
  let midfrac = 0.55
  let mx = ex + (0 - ex) * midfrac
  let my = ey + (0 - ey) * midfrac
  let (kx, ky) = (-ex / len, -ey / len)
  let (px, py) = (-ky, kx) // in-plane perpendicular to k, pointing up-left
  line((mx, my), (mx + 0.9 * kx, my + 0.9 * ky), stroke: 1.4pt + rgb("#27ae60"),
    mark: (end: ">", fill: rgb("#27ae60"), size: 0.13))
  line((mx, my), (mx + 0.6 * px, my + 0.6 * py), stroke: 1.1pt + rgb("#27ae60"),
    mark: (end: ">", fill: rgb("#27ae60"), size: 0.13))
  content((mx + 0.85 * px - 0.4, my + 0.85 * py - 0.3), text(size: 8pt, fill: rgb("#27ae60"))[$vb(E)_I$])
  let bang = -45deg
  let (bx, by) = (
    kx * calc.cos(bang) - ky * calc.sin(bang),
    kx * calc.sin(bang) + ky * calc.cos(bang),
  )
  line((mx, my), (mx + 0.45 * bx, my + 0.45 * by), stroke: 1.1pt + rgb("#27ae60"),
    mark: (end: ">", fill: rgb("#27ae60"), size: 0.13))
  content((mx + 0.45 * bx + 0.2, my + 0.45 * by - 0.15), text(size: 8pt, fill: rgb("#27ae60"))[$vb(B)_I$])

  // Reflected ray: from origin to upper-left
  line((0, 0), (-len * calc.cos(thetaR), len * calc.sin(thetaR)),
    stroke: 1.3pt + rgb("#e67e22"), mark: (end: ">", fill: rgb("#e67e22"), size: 0.18))
  content((-len * calc.cos(thetaR) - 0.3, len * calc.sin(thetaR) + 0.3),
    text(size: 9pt, fill: rgb("#e67e22"))[$vb(k)_R$])

  // Transmitted ray: into the conductor
  line((0, 0), (len * calc.cos(thetaT), len * calc.sin(thetaT)),
    stroke: 1.3pt + rgb("#2980b9"), mark: (end: ">", fill: rgb("#2980b9"), size: 0.18))
  content((len * calc.cos(thetaT) + 0.4, len * calc.sin(thetaT) + 0.2),
    text(size: 9pt, fill: rgb("#2980b9"))[$vb(k)_T$])

  // Angle arcs
  let arc-radius = 0.9
  arc((arc-radius * calc.cos(180deg), arc-radius * calc.sin(180deg)),
    start: 180deg, stop: 180deg + thetaI, radius: arc-radius,
    stroke: 0.6pt + rgb("#27ae60"))
  content((-0.7, -0.22), text(size: 9pt, fill: rgb("#27ae60"))[$theta_I$])

  arc((arc-radius * calc.cos(180deg), arc-radius * calc.sin(180deg)),
    start: 180deg, stop: 180deg - thetaR, radius: arc-radius,
    stroke: 0.6pt + rgb("#e67e22"))
  content((-1.25, 0.28), text(size: 9pt, fill: rgb("#e67e22"))[$theta_R$])

  arc((arc-radius, 0), start: 0deg, stop: thetaT, radius: arc-radius,
    stroke: 0.6pt + rgb("#2980b9"))
  content((1.25, 0.28), text(size: 9pt, fill: rgb("#2980b9"))[$theta_T$])
})
