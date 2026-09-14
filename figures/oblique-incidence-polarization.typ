// Figure: oblique incidence with polarization in the plane of incidence
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
  let thetaT = 20deg

  // Draws a ray with a small (E, B) polarization frame at its midpoint,
  // for E lying in the plane of incidence (the page) and B out of the page.
  let ray-with-pol(from, to, kcol, midfrac: 0.55) = {
    line(from, to, stroke: 1.3pt + kcol, mark: (end: ">", fill: kcol, size: 0.18))
    let mx = from.at(0) + (to.at(0) - from.at(0)) * midfrac
    let my = from.at(1) + (to.at(1) - from.at(1)) * midfrac
    let dx = to.at(0) - from.at(0)
    let dy = to.at(1) - from.at(1)
    let norm = calc.sqrt(dx * dx + dy * dy)
    let (px, py) = (-dy / norm, dx / norm) // perpendicular direction, in-plane
    // E arrow: in-plane, perpendicular to k
    line((mx, my), (mx + 0.55 * px, my + 0.55 * py), stroke: 1pt + kcol,
      mark: (end: ">", fill: kcol, size: 0.13))
    content((mx + 0.8 * px, my + 0.8 * py), text(size: 8pt, fill: kcol)[$vb(E)$])
    // B "out of page": small circled dot, offset slightly along -perpendicular
    circle((mx - 0.35 * px, my - 0.35 * py), radius: 0.09, stroke: 0.8pt + kcol)
    circle((mx - 0.35 * px, my - 0.35 * py), radius: 0.02, fill: kcol, stroke: none)
    content((mx - 0.65 * px, my - 0.65 * py), text(size: 8pt, fill: kcol)[$vb(B)$])
  }

  ray-with-pol(
    (-len * calc.cos(thetaI), -len * calc.sin(thetaI)), (0, 0), rgb("#27ae60"),
    midfrac: 0.35,
  )
  content((-len * calc.cos(thetaI) - 0.3, -len * calc.sin(thetaI) - 0.3),
    text(size: 9pt, fill: rgb("#27ae60"))[$vb(k)_I$])

  ray-with-pol(
    (0, 0), (-len * calc.cos(thetaI), len * calc.sin(thetaI)), rgb("#e67e22"),
    midfrac: 0.75,
  )
  content((-len * calc.cos(thetaI) - 0.3, len * calc.sin(thetaI) + 0.3),
    text(size: 9pt, fill: rgb("#e67e22"))[$vb(k)_R$])

  ray-with-pol(
    (0, 0), (len * calc.cos(thetaT), -len * calc.sin(thetaT)), rgb("#2980b9"),
  )
  content((len * calc.cos(thetaT) + 0.4, -len * calc.sin(thetaT) - 0.2),
    text(size: 9pt, fill: rgb("#2980b9"))[$vb(k)_T$])

  content((-2.2, -2.5), text(size: 8pt, fill: gray)[($vb(B)$ out of the page)])
})
