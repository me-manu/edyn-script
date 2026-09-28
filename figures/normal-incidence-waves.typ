// Figure: normal incidence — incident, reflected, and transmitted waves at a boundary
#import "/lib.typ": cetz, vu, vb

#cetz.canvas(length: 1cm, {
  import cetz.draw: *

  // Boundary at z = 0, media 1 (left) and 2 (right)
  line((0, -2.2), (0, 2.6), stroke: 1pt + rgb("#8b6b3d"))
  for y in (-2.0, -1.6, -1.2, -0.8, -0.4, 0, 0.4, 0.8, 1.2, 1.6, 2.0, 2.4) {
    line((0, y), (-0.3, y - 0.3), stroke: 0.5pt + rgb("#8b6b3d"))
  }
  content((-4.3, 3.0), text(size: 11pt, weight: "bold")[1])
  content((4.3, 3.0), text(size: 11pt, weight: "bold")[2])
  content((0, -2.6), text(size: 8pt, fill: rgb("#8b6b3d"))[boundary ($z=0$)])

  // z axis
  line((-5, 0), (5, 0), stroke: 0.6pt + gray)
  content((5.3, 0), text(size: 8pt, fill: gray)[$z$])

  // A small (E, B, k) triad, drawn at "origin" pointing along "dir" (+1 or -1 along z).
  // `bflip` flips the B arrow by 180° (needed for the reflected wave, whose
  // B amplitude carries an intrinsic minus sign — see the main text).
  let triad(origin, dir, ecolor, label, ey: 1, bflip: false) = {
    let (ox, oy) = origin
    let bsign = if bflip { -1 } else { 1 }
    // propagation arrow
    line((ox, oy), (ox + dir * 1.4, oy), stroke: 1pt + ecolor,
      mark: (end: ">", fill: ecolor, size: 0.15))
    // E arrow (along x, drawn vertical)
    line((ox, oy), (ox, oy + 0.9 * ey), stroke: 1pt + ecolor,
      mark: (end: ">", fill: ecolor, size: 0.15))
    content((ox, oy + 1.15 * ey), text(size: 8pt, fill: ecolor)[$vb(E)_#label$])
    // B arrow (along y, drawn diagonal for depth)
    line((ox, oy), (ox + bsign * -0.55, oy + bsign * -0.35), stroke: 1pt + ecolor,
      mark: (end: ">", fill: ecolor, size: 0.15))
    content((ox + bsign * -0.85, oy + bsign * -0.45), text(size: 8pt, fill: ecolor)[$vb(B)_#label$])
  }

  // Incident wave: medium 1, traveling in +z, below axis
  triad((-4.3, -1.0), 1, rgb("#27ae60"), [I])
  content((-3.6, -0.3), text(size: 8pt, fill: rgb("#27ae60"))[$e^(i(k_1 z - omega t))$])

  // Reflected wave: medium 1, traveling in -z, above axis
  triad((-1.6, 1.2), -1, rgb("#e67e22"), [R], ey: 1, bflip: true)
  content((-2.3, 1.6), text(size: 8pt, fill: rgb("#e67e22"))[$e^(i(-k_1 z - omega t))$])

  // Transmitted wave: medium 2, traveling in +z
  triad((1.6, -1.0), 1, rgb("#2980b9"), [T])
  content((2.9, -0.3), text(size: 8pt, fill: rgb("#2980b9"))[$e^(i(k_2 z - omega t))$])

  content((-4.3, -1.9), text(size: 8pt, fill: rgb("#27ae60"))[incident])
  content((-1.6, 0.6), text(size: 8pt, fill: rgb("#e67e22"))[reflected])
  content((1.6, -1.9), text(size: 8pt, fill: rgb("#2980b9"))[transmitted])
})
