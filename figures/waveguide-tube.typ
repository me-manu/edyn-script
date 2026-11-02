// Figure: a wave guide (tube) carrying a wave from a transmitter to a receiver
#import "/lib.typ": cetz

#cetz.canvas(length: 1cm, {
  import cetz.draw: *

  // Tube walls
  line((0, 1.0), (8.2, 1.0), stroke: 1pt + black)
  line((0, -1.0), (8.2, -1.0), stroke: 1pt + black)
  line((8.2, 1.0), (8.2, -1.0), stroke: 1pt + black)

  // Transmitter
  circle((0.5, 0), radius: 0.08, fill: black, stroke: none)
  content((0.5, -1.4), text(size: 8pt)[transmitter])

  // Wavefronts between transmitter and receiver: half-circles open towards
  // the transmitter, with their ends touching the tube walls at y = ±1.
  // (arc()'s first argument is the point on the circle where drawing
  // starts, at angle "start" — here the bottom wall, (x, -1).)
  for x in (1.3, 2.1, 2.9, 3.7, 4.5, 5.3, 6.1, 6.9) {
    arc((x, -1.0), start: -90deg, stop: 90deg, radius: 1.0, stroke: 0.8pt + black)
  }

  // Receiver
  line((7.9, 0.6), (7.9, -0.6), stroke: 1.2pt + black)
  content((7.9, -1.4), text(size: 8pt)[receiver])
})
