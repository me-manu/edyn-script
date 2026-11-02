// Figure: a train of true length L, moving with velocity v towards an
// observer. Light emitted simultaneously (as received) from the engine and
// the last car was actually emitted at different times, since it took the
// last car's light longer to arrive — so the train appears longer, L' > L.
// Dashed = the train's retarded (earlier) position; solid = its current
// (later) position.
#import "/lib.typ": cetz

#cetz.canvas(length: 1cm, {
  import cetz.draw: *

  let gray = rgb("#999999")
  let red = rgb("#c0392b")
  let dx = 2.2 // distance traveled by the train
  let trainL = 3.0 // true length L

  // Ghost train (retarded position): back at x=0, front at x=trainL
  let g-back = 0.0
  let g-front = trainL
  line((g-back, 0), (g-front, 0), stroke: (paint: gray, thickness: 1.2pt, dash: "dashed"))
  for x in (g-back + 0.5, g-back + 1.5, g-back + 2.5) {
    circle((x, -0.15), radius: 0.11, stroke: 0.6pt + gray)
  }

  // Current train: shifted right by dx
  let c-back = dx
  let c-front = dx + trainL
  line((c-back, 0), (c-front, 0), stroke: 1.2pt + black)
  for x in (c-back + 0.5, c-back + 1.5, c-back + 2.5) {
    circle((x, -0.15), radius: 0.11, fill: black, stroke: none)
  }

  // Velocity arrow, above the current train
  line((c-back + 0.6, 1.9), (c-back + 1.9, 1.9), stroke: 0.8pt + black,
    mark: (end: ">", fill: black, size: 0.13))
  content((c-back + 1.25, 2.15), text(size: 9pt)[$v$])

  // Flashes: last car of the ghost train, engine of the current train
  content((g-back, 0.0), text(size: 15pt, fill: red)[$star.stroked$])
  content((c-front, 0.0), text(size: 15pt, fill: red)[$star.stroked$])
  content((g-back, 0.5), anchor: "south", text(size: 8pt, fill: red)[light emitted\ from last car])
  content((c-front, 0.5), anchor: "south", text(size: 8pt, fill: red)[light emitted\ from engine])

  // Observer, off to the right
  content((c-front + 1.3, 0), anchor: "west", text(size: 9pt)[observer])

  // Distance traveled by the train
  line((g-back, -1.0), (c-back, -1.0), stroke: 0.5pt + black,
    mark: (end: ">", start: ">", fill: black, size: 0.08))
  content((dx / 2, -1.25), anchor: "north", text(size: 8pt)[distance traveled by train])

  // True length L, under the current train
  line((c-back, -1.8), (c-front, -1.8), stroke: 0.5pt + black,
    mark: (end: ">", start: ">", fill: black, size: 0.08))
  content((c-back + trainL / 2, -2.05), anchor: "north", text(size: 9pt)[$L$])

  // Apparent length L', from the ghost's back to the current's front
  line((g-back, -2.7), (c-front, -2.7), stroke: 0.5pt + red,
    mark: (end: ">", start: ">", fill: red, size: 0.08))
  content((c-front / 2, -2.95), anchor: "north", text(size: 9pt, fill: red)[$L'$])
})
