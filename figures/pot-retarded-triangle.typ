// Figure: a signal measured at the observer's position r at time t, emitted
// from two different source points r1' and r2' at different retarded times.
#import "/lib.typ": cetz, vb

#cetz.canvas(length: 1cm, {
  import cetz.draw: *

  let green = rgb("#27ae60")
  let blue = rgb("#2980b9")
  let origin = (0, 0)
  let obs = (3.6, 4.4)
  let src1 = (0.3, 2.2) // closer source, r1'
  let src2 = (2.6, -0.2) // farther source, r2'

  // Origin
  circle(origin, radius: 0.04, fill: black, stroke: none)

  // Position vectors from the origin
  line(origin, obs, stroke: 0.8pt + black, mark: (end: ">", fill: black, size: 0.13))
  content((obs.at(0) * 0.42, obs.at(1) * 0.42 + 0.3), text(size: 9pt)[$vb(r)$])

  line(origin, src1, stroke: 0.8pt + green, mark: (end: ">", fill: green, size: 0.13))
  content((src1.at(0) * 0.5 - 0.3, src1.at(1) * 0.5), text(size: 9pt, fill: green)[$vb(r)'_1$])

  line(origin, src2, stroke: 0.8pt + blue, mark: (end: ">", fill: blue, size: 0.13))
  content((src2.at(0) * 0.5 + 0.1, src2.at(1) * 0.5 - 0.3), text(size: 9pt, fill: blue)[$vb(r)'_2$])

  // Distances from each source to the observer
  line(src1, obs, stroke: 0.8pt + black, mark: (end: ">", fill: black, size: 0.13))
  content((2.0, 3.55), anchor: "east", text(size: 9pt)[$abs(vb(r) - vb(r)'_1)$])

  line(src2, obs, stroke: 0.8pt + black, mark: (end: ">", fill: black, size: 0.13))
  content((3.4, 2.1), anchor: "west", text(size: 9pt)[$abs(vb(r) - vb(r)'_2)$])

  // Source and observer points
  circle(src1, radius: 0.07, fill: green, stroke: none)
  content((src1.at(0) - 0.15, src1.at(1) + 0.3), anchor: "south-east",
    text(size: 9pt, fill: green)[signal emitted\ at $t_(r,1)$])

  circle(src2, radius: 0.07, fill: blue, stroke: none)
  content((src2.at(0) + 0.35, src2.at(1) - 0.3), anchor: "north-west",
    box(width: 6.2cm)[
      #set text(size: 9pt, fill: blue)
      signal emitted at $t_(r,2) < t_(r,1)$ since
      $abs(vb(r)-vb(r)'_2) > abs(vb(r)-vb(r)'_1)$
    ])

  circle(obs, radius: 0.07, fill: black, stroke: none)
  content((obs.at(0) + 0.3, obs.at(1) + 0.3), anchor: "south-west",
    text(size: 9pt)[signal measured at $t$\ from both $vb(r)'_1$ and $vb(r)'_2$])
})
