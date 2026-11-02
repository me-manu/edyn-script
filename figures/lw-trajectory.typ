// Figure: a point charge moving along a trajectory w(t). The observer at r
// sees, at time t, the field sourced by the charge's retarded position
// w(t_r), not by its current position.
#import "/lib.typ": cetz, vb

#cetz.canvas(length: 1cm, {
  import cetz.draw: *

  let blue = rgb("#2980b9")
  let orange = rgb("#e67e22")

  // Trajectory (smooth curve) with retarded and current position marked
  let traj = ((0.2, 0.9), (1.4, 2.9), (2.5, 3.5), (3.6, 3.2), (4.5, 2.6))
  hobby(..traj, stroke: 1pt + blue)
  content((4.7, 2.5), text(size: 9pt, fill: blue)[particle trajectory $vb(w)(t)$])

  let ret-pos = (1.4, 2.9)
  let cur-pos = (3.6, 3.2)
  circle(ret-pos, radius: 0.06, fill: black, stroke: none)
  circle(cur-pos, radius: 0.06, fill: blue, stroke: none)
  content((ret-pos.at(0) - 0.1, ret-pos.at(1) + 0.2), anchor: "south-east",
    text(size: 9pt, fill: blue)[retarded\ position])
  content((cur-pos.at(0) + 0.2, cur-pos.at(1) + 0.4), anchor: "south-west",
    text(size: 9pt, fill: blue)[current position])

  // Origin and axes
  circle((0, 0), radius: 0.04, fill: black, stroke: none)
  line((0, 0), (0, 1.0), stroke: 0.6pt + black, mark: (end: ">", fill: black, size: 0.1))
  content((-0.25, 1.1), text(size: 8pt)[$x$])
  line((0, 0), (1.0, 0), stroke: 0.6pt + black, mark: (end: ">", fill: black, size: 0.1))
  content((1.2, 0), text(size: 8pt)[$y$])

  // Vector to the retarded position, w(t_r)
  line((0, 0), ret-pos, stroke: 0.8pt + black, mark: (end: ">", fill: black, size: 0.13))
  content((0.3, 1.7), anchor: "east", text(size: 9pt, fill: blue)[$vb(w)(t_r)$])

  // Observer's position r
  let obs = (3.0, 0.8)
  circle(obs, radius: 0.07, fill: orange, stroke: none)
  content((obs.at(0) + 0.15, obs.at(1) - 0.35), anchor: "north-west",
    text(size: 9pt, fill: orange)[observer's position])
  line((0, 0), obs, stroke: 0.8pt + orange, mark: (end: ">", fill: orange, size: 0.13))
  content((1.9, 0.15), anchor: "north", text(size: 9pt, fill: orange)[$vb(r)$])

  // Separation vector R = r - w(t_r)
  line(ret-pos, obs, stroke: 1pt + black, mark: (end: ">", fill: black, size: 0.13))
  content((2.9, 1.9), anchor: "west",
    text(size: 9pt)[$vb(r) - vb(w)(t_r) equiv vb(R)$])
})
