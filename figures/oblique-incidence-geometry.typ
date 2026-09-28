// Figure: oblique incidence — plane of incidence, angles, and wave vectors
#import "/lib.typ": cetz, vu, vb

#cetz.canvas(length: 1cm, {
  import cetz.draw: *

  // Boundary (vertical, hatched) and normal (horizontal)
  line((0, -2.2), (0, 2.6), stroke: 1.2pt + rgb("#8b6b3d"))
  for y in (-2.0, -1.6, -1.2, -0.8, -0.4, 0, 0.4, 0.8, 1.2, 1.6, 2.0, 2.4) {
    line((0, y), (-0.3, y - 0.3), stroke: 0.5pt + rgb("#8b6b3d"))
  }
  content((0.4, -2.5), text(size: 8pt, fill: rgb("#8b6b3d"))[boundary])

  line((-3.2, 0), (3.2, 0), stroke: 0.7pt + black, mark: (end: ">", fill: black, size: 0.15))
  content((3.5, 0), text(size: 9pt)[$z$])

  // Surface normal: short arrow at the boundary, near the bottom (away
  // from the k_R line/label), pointing in the -z direction
  line((0, -1.9), (-0.9, -1.9), stroke: 0.7pt + black, mark: (end: ">", fill: black, size: 0.15))
  content((-1.3, -2.25), text(size: 9pt)[$vu(n) = -vu(z)$])

  content((-2.0, 2.4), text(size: 10pt, weight: "bold")[1])
  content((2.0, 2.4), text(size: 10pt, weight: "bold")[2])

  // Incident ray: from lower-left to origin
  let len = 2.6
  let thetaI = 32deg
  let thetaR = 32deg
  let thetaT = 20deg
  line((-len * calc.cos(thetaI), -len * calc.sin(thetaI)), (0, 0),
    stroke: 1.3pt + rgb("#27ae60"), mark: (end: ">", fill: rgb("#27ae60"), size: 0.18))
  content((-len * calc.cos(thetaI) - 0.3, -len * calc.sin(thetaI) - 0.3),
    text(size: 9pt, fill: rgb("#27ae60"))[$vb(k)_I$])

  // Reflected ray: from origin to upper-left
  line((0, 0), (-len * calc.cos(thetaR), len * calc.sin(thetaR)),
    stroke: 1.3pt + rgb("#e67e22"), mark: (end: ">", fill: rgb("#e67e22"), size: 0.18))
  content((-len * calc.cos(thetaR) - 0.3, len * calc.sin(thetaR) + 0.3),
    text(size: 9pt, fill: rgb("#e67e22"))[$vb(k)_R$])

  // Transmitted ray: from origin into medium 2, above the z axis (same
  // side as the transverse component of the incident/reflected rays)
  line((0, 0), (len * calc.cos(thetaT), len * calc.sin(thetaT)),
    stroke: 1.3pt + rgb("#2980b9"), mark: (end: ">", fill: rgb("#2980b9"), size: 0.18))
  content((len * calc.cos(thetaT) + 0.4, len * calc.sin(thetaT) + 0.2),
    text(size: 9pt, fill: rgb("#2980b9"))[$vb(k)_T$])

  // Angle arcs (cetz `arc`: position is the point ON the circle at the
  // `start` angle; the arc then sweeps to `stop`, both measured as
  // standard math angles from the positive x-axis)
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
