// Figure: a localized source (charges and currents) of volume V, with a
// distant sphere of radius r over which we integrate the Poynting vector
// to find the radiated power.
#import "/lib.typ": cetz, vb, dd

#cetz.canvas(length: 1cm, {
  import cetz.draw: *

  let blue = rgb("#2980b9")

  // Sphere at radius r
  circle((0, 0.5), radius: 4.6, stroke: 1pt + black)
  content((3.55, 4.1), anchor: "south-west", text(size: 9pt)[sphere at radius $r$])

  // Source region (irregular blob) with volume V
  let blob = ((-2.6, -1.6), (-1.6, -2.3), (-0.4, -2.0), (0.3, -1.1),
    (-0.2, -0.1), (-1.6, 0.3), (-2.8, -0.5), (-2.6, -1.6))
  hobby(..blob, stroke: 1pt + blue, close: true)
  content((0.5, -2.1), anchor: "north-west", text(size: 9pt, fill: blue)[source\ with volume $V$])

  // Origin and axes, inside the source region
  let o = (-1.9, -1.5)
  circle(o, radius: 0.03, fill: black, stroke: none)
  line(o, (rel: (-0.9, -0.6), to: o), stroke: 0.6pt + black, mark: (end: ">", fill: black, size: 0.1))
  content((rel: (-1.1, -0.65), to: o), text(size: 8pt)[$x$])
  line(o, (rel: (1.0, 0), to: o), stroke: 0.6pt + black, mark: (end: ">", fill: black, size: 0.1))
  content((rel: (1.2, 0), to: o), text(size: 8pt)[$y$])
  line(o, (rel: (0, 1.1), to: o), stroke: 0.6pt + black, mark: (end: ">", fill: black, size: 0.1))
  content((rel: (0, 1.3), to: o), text(size: 8pt)[$z$])

  // Source point r' with volume element d^3 r'
  let rp = (-1.1, -0.9)
  line(o, rp, stroke: 0.8pt + black, mark: (end: ">", fill: black, size: 0.12))
  // label in the wedge between the y axis and the r' arrow
  content((-1.23, -1.28), text(size: 9pt)[$vb(r)'$])

  // Small cube (volume element) at r': front face plus receding edges
  let s = 0.09 // half edge length
  let dx = 0.07 // receding offset
  let fl = (rp.at(0) - s, rp.at(1) - s)
  let fr = (rp.at(0) + s, rp.at(1) - s)
  let tr = (rp.at(0) + s, rp.at(1) + s)
  let tl = (rp.at(0) - s, rp.at(1) + s)
  let off(q) = (q.at(0) + dx, q.at(1) + dx)
  line(fl, fr, tr, tl, close: true, fill: white, stroke: 0.5pt + black)
  line(tl, off(tl), off(tr), off(fr), fr, stroke: 0.5pt + black)
  line(tr, off(tr), stroke: 0.5pt + black)
  content((rel: (0.8, 0.15), to: rp), text(size: 8pt)[$dd(V')$])

  // Observer point on the sphere (center (0, 0.5), radius 4.6), at r
  let p = (4.6 * calc.cos(75deg), 0.5 + 4.6 * calc.sin(75deg))
  line(o, p, stroke: 0.8pt + black, mark: (end: ">", fill: black, size: 0.12))
  content((-0.75, 1.9), text(size: 9pt)[$vb(r)$])

  // Separation vector r - r'
  // start just outside the cube so the line doesn't cross its faces
  let (ddx, ddy) = (p.at(0) - rp.at(0), p.at(1) - rp.at(1))
  let len = calc.sqrt(ddx * ddx + ddy * ddy)
  let start = (rp.at(0) + 0.18 * ddx / len, rp.at(1) + 0.18 * ddy / len)
  line(start, p, stroke: 0.8pt + black, mark: (end: ">", fill: black, size: 0.12))
  content((0.35, 2.0), anchor: "west", text(size: 9pt)[$vb(r) - vb(r)'$])
})
