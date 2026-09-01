// Figure: longitudinal wave — density fluctuations in a medium (e.g. sound waves)
#import "/lib.typ": cetz

#cetz.canvas(length: 1cm, {
  import cetz.draw: *

  // Clusters of dots: dense / sparse / dense / sparse / dense, mimicking
  // compressions and rarefactions of a longitudinal wave.
  let clusters = (
    (0.0, 0.15, 0.3, 0.45, 0.6),
    (1.1, 1.5, 1.9),
    (2.4, 2.55, 2.7, 2.85, 3.0),
    (3.5, 3.9, 4.3),
    (4.8, 4.95, 5.1, 5.25, 5.4),
    (5.9, 6.3, 6.7),
  )
  let seed = 1
  for row in clusters {
    for x in row {
      for dy in (-0.15, 0, 0.15) {
        seed = calc.rem(seed * 1103515245 + 12345, 2147483648)
        let jitter = (calc.rem(seed, 100) / 100 - 0.5) * 0.08
        circle((x + jitter, dy), radius: 0.035, fill: black, stroke: none)
      }
    }
  }

  // Wavy underline markers for high-density (red) and low-density (orange) regions
  let wavy(x0, x1, y, col) = {
    let n = 6
    let pts = ()
    for i in range(n + 1) {
      let x = x0 + (x1 - x0) * i / n
      let y-off = if calc.rem(i, 2) == 0 { 0 } else { 0.08 }
      pts.push((x, y + y-off))
    }
    hobby(..pts, stroke: 1pt + col)
  }

  wavy(-0.1, 0.7, -0.55, rgb("#c0392b"))
  content((0.3, -0.9), text(size: 8pt, fill: rgb("#c0392b"))[high density])

  wavy(1.0, 2.0, -0.55, rgb("#e67e22"))

  wavy(2.3, 3.1, -0.55, rgb("#c0392b"))

  wavy(3.4, 4.4, -0.55, rgb("#e67e22"))
  content((3.9, -0.9), text(size: 8pt, fill: rgb("#e67e22"))[low density])

  wavy(4.7, 5.5, -0.55, rgb("#c0392b"))

  wavy(5.8, 6.8, -0.55, rgb("#e67e22"))

  // Propagation direction
  line((-0.3, 1.0), (6.9, 1.0), stroke: 0.8pt + gray, mark: (end: ">", fill: gray, size: 0.18))
  content((3.3, 1.3), text(size: 9pt, fill: gray)[direction of propagation ($z$)])
})
