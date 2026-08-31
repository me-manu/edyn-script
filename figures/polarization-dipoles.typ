// Figure: Aligned dipoles in a dielectric and their cancellation
#import "/lib.typ": cetz

#cetz.canvas(length: 1cm, {
  import cetz.draw: *

  // Row of individual dipoles
  content((-4, 2.5), text(size: 9pt)[Individual dipoles:])

  for i in range(5) {
    let x = -3.0 + i * 1.5
    let y = 1.5
    // negative charge (blue)
    circle((x - 0.25, y), radius: 0.12, fill: rgb("#2980b9"), stroke: 0.5pt)
    content((x - 0.25, y), text(size: 5pt, fill: white, weight: "bold")[$-$])
    // positive charge (red)
    circle((x + 0.25, y), radius: 0.12, fill: rgb("#e74c3c"), stroke: 0.5pt)
    content((x + 0.25, y), text(size: 5pt, fill: white, weight: "bold")[$+$])
    // arrow
    line((x - 0.05, y), (x + 0.05, y), stroke: 0.6pt, mark: (end: ">", size: 0.12))
  }

  // Brace and "cancel" annotation in the middle
  content((0.0, 0.8), text(size: 8pt)[interior charges cancel])

  // Resulting net effect: just surface charges
  content((-4, -0.2), text(size: 9pt)[Net effect:])

  // Long arrow representing the dipole
  let xl = -3.0
  let xr = 3.75
  let y = -1.0
  // negative surface charge
  circle((xl - 0.25, y), radius: 0.12, fill: rgb("#2980b9"), stroke: 0.5pt)
  content((xl - 0.25, y), text(size: 5pt, fill: white, weight: "bold")[$-$])
  // positive surface charge
  circle((xr + 0.25, y), radius: 0.12, fill: rgb("#e74c3c"), stroke: 0.5pt)
  content((xr + 0.25, y), text(size: 5pt, fill: white, weight: "bold")[$+$])
  // arrow
  line((xl, y), (xr, y), stroke: 1pt, mark: (end: ">", size: 0.2))
})
