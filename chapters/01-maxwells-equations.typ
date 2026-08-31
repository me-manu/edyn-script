// Chapter 1: Maxwell's Equations
// Based on Lecture 1 — Griffiths Chapter 7.3
#import "/lib.typ": *

= Maxwell's Equations

#text(fill: gray)[_Literature: Griffiths Chapter 7.3_]

Maxwell's equations describe how electric and magnetic fields are generated from
charges and currents. Historically, they are the culmination of theory to describe
experimental results obtained by Faraday, Ampère, and many others. They form the
axioms of classical electrodynamics.

Once we have written them down, we could stop right there — they encode (almost)
everything in electrodynamics. We will study their consequences throughout this
course, with emphasis on theory. Let us first review them and some of the vector
calculus we need to understand them.

We write them in differential form and derive the integral form that you should be
familiar with from your electrostatics course.

Consider the electric field $vb(E) = (E_x, E_y, E_z)^T$ and the magnetic field
$vb(B) = (B_x, B_y, B_z)^T$.

== Gauss's Law

#key-box[
  $ div vb(E)(vb(x), t) = rho(vb(x), t) / epsilon_0 $ <eq:gauss>
]

Here, the left-hand side is the _divergence_ of $vb(E)$, with the nabla operator
$
  vb(nabla) = vec(pdv(,x), pdv(,y), pdv(,z))
$
so that
$
  div vb(E)
  = pdv(E_x, x) + pdv(E_y, y) + pdv(E_z, z)
  = sum_i partial_i E_i
  equiv partial_i E_i
$
where in the last step we have used the _Einstein summation convention_: repeated
indices are summed over.

#supplement-box(title: [Note on index notation])[
  We will frequently use index notation where $partial_i equiv partial / (partial x_i)$
  with $x_1 = x$, $x_2 = y$, $x_3 = z$. Repeated indices (one upper, one lower, or
  two of the same in this context) are implicitly summed over: $partial_i E_i equiv sum_(i=1)^3 partial_i E_i$.

  In the second part of the course, it will also become important if we write the indices as subscrits
  or as superscripts, but this will not bother us now.
]

Note that $vb(E)$ is a _vector field_: its strength and direction may vary with
position and time. The divergence measures whether $vb(E)$ has sources or sinks at
a given point.

An example of a vector field with divergence is the electric field of a point charge, see the #text(fill: rgb("#008080"))[slides for an example]. Another example is the velocity field of a fluid flowing out of a faucet. 
We will explore this further in the exercises.

Gauss's law states: the source of divergence of $vb(E)$ is the charge density:
- $rho$: charge density (charge per unit volume)
- $epsilon_0$: vacuum permittivity (ability of $vb(E)$ to permeate vacuum)
$
  epsilon_0 = 8.85 times 10^(-12) "C"^2 "N"^(-1) "m"^(-2)
  quad
  lr(paren.l epsilon_0 = 10^7 / (4 pi c^2) paren.r)
$

=== Physical Interpretation: Integral Form

Integrate both sides of @eq:gauss over a volume $V$:
$
  mark(integral_V (div vb(E)) dd(V), tag: #<gaus>)
  mark(=, tag: #<gaus-eq>)
  1/epsilon_0 integral_V rho dd(V)
$

#{
  annot-cetz(
    <gaus>,
    cetz,
    {
      import cetz.draw: *
      cetz.decorations.flat-brace(
        "gaus.south-west",
        "gaus.south-east",
        flip: true,
        name: "brace",
        stroke: blue,
      )
      content(
        (rel: (0, -0.6), to: "brace.south"),
        anchor: "north",
        name: "brace-label",
        text(fill: blue)[$= integral.cont_S vb(E) dot dd(vb(a))$],
      )
      // "Gauss' theorem" annotation pointing to the blue equals sign
      content(
        (rel: (-1.3, 0.5), to: "brace-label.north-west"),
        anchor: "south",
        name: "gauss-label",
        text(size: 9pt, fill: blue)[Gauss' theorem],
      )
      line(
        (rel: (0, -0.15), to: "gauss-label.south"),
        "brace-label.north-west",
        stroke: 0.6pt + blue,
        mark: (end: ">", fill: blue, size: 0.2),
      )
    },
  )
}
#v(1.5em)

The right-hand side gives the total charge $Q$ enclosed in $V$.

#supplement-box(title: [Note on notation for volume element $dd(V)$])[
  Throughout the course, we will use $dd(V)$ interchangeably with $dd(x, 3)$ to denote the volume element (Griffith uses $dd(tau)$). In Cartesian coordinates, this is $dd(x, 3) = dd(V) = dd(x) dd(y) dd(z)$.
]

Applying the _divergence theorem_ (Gauss's theorem) to the left-hand side:

#key-box[
  $ integral.cont_S vb(E) dot dd(vb(a)) = Q_"enc" / epsilon_0 $ <eq:gauss-integral>
]

where $S$ is the closed surface enclosing $V$ and $dd(vb(a))$ points outward. The
left-hand side is the _electric flux_ through $S$.

The larger the charge inside $V$, the larger the flux of $vb(E)$ through the closed
surface $S$.

#supplement-box(title: [Note on flux])[
  Flux is not flow. Flow is the average normal component of the field times the
  surface area.
]

Importantly, the _shape_ of $S$ does not matter — only the total charge enclosed in
$S$ does, see @fig:gauss-surfaces.

#figure(
  include "/figures/gauss-law-surfaces.typ",
  caption: [
    The flux through $S_1$ and $S_2$ is the same ($= Q\/epsilon_0$), since both
    enclose $Q$. The flux through $S_3$ is zero: as much flux enters $V_3$ as
    leaves it, since $S_3$ does not enclose the charge.
  ],
) <fig:gauss-surfaces>


== Gauss's Law for Magnetism

#key-box[
  $ div vb(B) = 0 $ <eq:div-B>
]

This is analogous to Gauss's law in @eq:gauss, but for the $vb(B)$ field. It states that there
are no magnetic charges (no magnetic monopoles — at least, we have not found them
yet).

The net magnetic flux through any closed surface is zero: any outward flux is
balanced by inward flux. If you like to visualize the fields with field lines: they are always _closed_ for
magnetic fields.

This is also true in the static case (magnetostatics).


== Faraday's Law of Induction

#key-box[
  $ curl vb(E) = -pdv(vb(B), t) $ <eq:faraday>
]

This is Faraday's law of induction. Note that this is a _vector_ equation (in
contrast to Gauss's law), so both left- and right-hand sides have three components.

The curl is computed as
$
  curl vb(E) = det mat(
    vu(x), vu(y), vu(z);
    partial_x, partial_y, partial_z;
    E_x, E_y, E_z;
  )
  = vec(
    partial_y E_z - partial_z E_y,
    -partial_x E_z + partial_z E_x,
    partial_x E_y - partial_y E_x
  )
$

#advanced-box(title: [The Levi-Civita tensor])[
  In index notation, using the Levi-Civita tensor:
  $ (curl vb(E))_i = epsilon_(i j k) partial_j E_k $
  The Levi-Civita tensor $epsilon_(i j k)$ is defined as
  $
    epsilon_(i j k) = cases(
      +1 & "even permutation of" 1\,2\,3,
      -1 & "odd permutation of" 1\,2\,3,
      0 & "for repeated indices"
    )
  $
  An _even_ permutation is one obtained by cyclic rotation: $123 -> 231 -> 312$. You can think of a cyclic rotation as a rotation of a triangle with the numbers 1, 2, 3 at the corners. An _odd_ permutation is obtained by swapping two indices: $123 -> 213 -> 321 -> 132 -> 231 -> 312$.
]

=== Physical Interpretation: Integral Form

Integrate both sides over a surface $S$:

#v(1.2em)

$
  mark(integral_S (curl vb(E)) dot dd(vb(a)), tag: #<stokes>)
  = - integral_S pdv(vb(B), t) dot dd(vb(a))
  mark(=, tag: #<surface-fixed>)
  mark(- dv(, t) integral_S vb(B) dot dd(vb(a)), tag: #<flux>)
$

#{
  annot-cetz(
    (<stokes>, <surface-fixed>, <flux>),
    cetz,
    {
      import cetz.draw: *
      cetz.decorations.flat-brace(
        "stokes.south-west",
        "stokes.south-east",
        flip: true,
        name: "brace",
        stroke: blue,
      )
      content(
        (rel: (0, -0.6), to: "brace.south"),
        anchor: "north",
        name: "brace-label",
        text(fill: blue)[$= integral.cont_C vb(E) dot dd(vb(l))$],
      )
      // "Stokes' theorem" annotation pointing to the blue equals sign
      content(
        (rel: (-1.3, 0.5), to: "brace-label.north-west"),
        anchor: "south",
        name: "stokes-label",
        text(size: 9pt, fill: blue)[Stokes' theorem],
      )
      line(
        (rel: (0, -0.15), to: "stokes-label.south"),
        "brace-label.north-west",
        stroke: 0.6pt + blue,
        mark: (end: ">", fill: blue, size: 0.2),
      )

      // Underbrace under the flux term
      cetz.decorations.flat-brace(
        "flux.south-west",
        "flux.south-east",
        flip: true,
        name: "flux-brace",
        stroke: teal.darken(30%),
      )
      content(
        (rel: (0, -0.6), to: "flux-brace.south"),
        anchor: "north",
        name: "flux-label",
        text(size: 9pt, fill: teal.darken(30%))[Magnetic flux $Phi_B$ through surface $S$],
      )

      // "Holding S constant" annotation pointing to the second equals sign
      content(
        (rel: (0.3, 0.9), to: "surface-fixed.north"),
        anchor: "south",
        name: "fixed-label",
        text(size: 9pt, fill: orange.darken(20%))[Holding $S$ constant in time],
      )
      line(
        (rel: (0, -0.15), to: "fixed-label.south"),
        "surface-fixed.north",
        stroke: 0.6pt + orange.darken(20%),
        mark: (end: ">", fill: orange.darken(20%), size: 0.2),
      )
    },
  )
}
#v(1.5em)

where $C$ is the closed curve bounding $S$, and $Phi_B = integral_S vb(B) dot dd(vb(a))$
is the magnetic flux through the surface. 
The last equality only holds when $S$ is fixed in time, i.e. the surface does not move or deform as time progresses. In that case, the time derivative can be taken outside of the integral.

Collecting results gives the integral form of Faraday's law:

#key-box[
  $ integral.cont_C vb(E) dot dd(vb(l)) = - dv(Phi_B, t) $ <eq:faraday-integral>
]


#supplement-box(title: [Geometrical interpretation of Stokes' theorem])[
  The curl measures the "twist" of a vector field (a whirlpool is a region with
  high curl). The integral of the flux of the curl through a surface represents the
  total "amount of swirl". Stokes' theorem says this equals the circulation — the
  flow along the boundary. This is illustrated in @fig:curl.
  Crucially, the integral depends only on the boundary $C$,
  not on the surface $S$ itself.

  #figure(
    image("/figures/curl.pdf", width: 40%),
    caption: [
      Small circulation loops covering the surface cancel along shared interior
      edges, leaving only the circulation along the outer boundary $C$.
    ],
  ) <fig:curl>
]

The physical content: a time-varying magnetic flux through a surface induces an
electric field along the closed path around the surface.

If you place a wire along this path, current will flow as $vb(E)$ exerts force on
the charge carriers inside the wire. This is the _electromotive force_ (emf):
$ cal(E) = integral.cont vb(f) dot dd(vb(l)) = - dv(Phi_B, t) $
where $vb(f)$ is the force per unit charge responsible for pushing the charge
around the circuit.

#supplement-box(title: [Lenz's law])[
  The minus sign in Faraday's law encodes Lenz's law: the emf opposes the change
  in magnetic flux.
]

This was Faraday's experimental breakthrough: three experiments involving a wire
and a magnetic field all yielded a current through the wire, #text(fill: rgb("008080"))[see the slides for the experimental setups].
In experiment (a), the wire moves — this is a case of _motional emf_, where the relevant force is the
Lorentz force $vb(f) = vb(v) times vb(B)$. Experiment (b) gives the same result —
only relative motion matters. In experiment (c), the wire is not moving ($vb(v) = 0$),
so who does the work? The answer: the electric field that is _induced_ by the
changing magnetic field. This was Faraday's great insight.


== Ampère's Law with Maxwell's Addition

#key-box[
  $
    mark(curl vb(B) = mu_0 vb(J), tag: #<ampere-term>)
    +
    mark(mu_0 epsilon_0 pdv(vb(E), t), tag: #<maxwell-term>)
  $ <eq:ampere>

  #{
    annot-cetz(
      (<ampere-term>, <maxwell-term>),
      cetz,
      {
        import cetz.draw: *
        cetz.decorations.flat-brace(
          (rel: (0, -0.2), to: "ampere-term.south-west"),
          (rel: (0, -0.2), to: "ampere-term.south-east"),
          flip: true,
          name: "ampere-brace",
          stroke: blue,
        )
        content(
          (rel: (0, -0.2), to: "ampere-brace.south"),
          anchor: "north",
          name: "ampere-label",
          text(size: 9pt, fill: blue)[Ampère's law],
        )

        cetz.decorations.flat-brace(
          (rel: (0, -0.35), to: "maxwell-term.south-west"),
          (rel: (0, -0.35), to: "maxwell-term.south-east"),
          flip: true,
          name: "maxwell-brace",
          stroke: blue,
        )
        content(
          (rel: (0, -0.2), to: "maxwell-brace.south"),
          anchor: "north",
          name: "maxwell-label",
          text(size: 9pt, fill: blue)[Maxwell's addition],
        )
      },
    )
  }
  #v(0.8em)
]

The first term is _Ampère's law_, and the second is _Maxwell's addition_
(the displacement current term).

Here:
- $vb(J)$: current density — the amount of current passing through a surface per
  unit time. The number of charges passing per second through an area element
  $dd(vb(S))$ is $vb(J) dot vu(n) dd(S)$. Units: $[vb(J)] = "A" dot "m"^(-2)$.

- $mu_0$: permeability of free space,
  $mu_0 approx 4 pi times 10^(-7) "N" "A"^(-2)$.

#supplement-box(title: [Definition of $mu_0$])[
  $mu_0$ is defined through the force of attraction between two infinite wires with
  infinitesimal cross section, 1 m apart, carrying 1 A current in the same
  direction. In natural units: $mu_0 \/ (4 pi) = alpha \/ (2 pi) dot hbar \/ (e^2 c)$.
  Here, $alpha$ is the fine-structure constant, $hbar$ is the reduced Planck constant (see your quantum mechanics class!), $e$ is the electric charge and $c$ is the speed of light. 
]

=== Physical Interpretation: Integral Form (Static Case)

In the static case ($pdv(vb(E), t) = 0$), integrate over a surface $S$ and apply
Stokes' theorem:

$
  integral_S (curl vb(B)) dot dd(vb(a))
  = integral.cont_C vb(B) dot dd(vb(l))
  = mu_0 integral_S vb(J) dot dd(vb(a))
$

The right-hand side is $mu_0$ times the total current through $S$. The direction
of $C$ is determined by the right-hand rule with respect to the surface normal $vu(n)$.

The magnetic field along $C$ is determined by the total current passing through $S$.

=== Why Is Maxwell's Addition Necessary?

The displacement current term ensures the _consistency_ of Maxwell's equations.

Take the divergence of Faraday's law @eq:faraday:
$
  underbrace(div (curl vb(E)), = 0 "(divergence of curl always zero)")
  = -pdv(, t)(underbrace(div vb(B), = 0 "(2nd Maxwell equation)"))
  = 0 quad checkmark
$

Now take the divergence of Ampère's law in @eq:ampere _without_ Maxwell's addition:
$
  underbrace(div (curl vb(B)), = 0)
  = mu_0 div vb(J)
$
This would require $div vb(J) = 0$ always, which is not true in general (e.g.
when charges leave a volume).

With Maxwell's addition:
$
  0 = mu_0 div vb(J) + mu_0 epsilon_0 pdv(, t)(div vb(E))
  = mu_0 div vb(J) + mu_0 epsilon_0 pdv(, t) rho/epsilon_0
$
which gives the _continuity equation_:

#key-box[
  $ div vb(J) + pdv(rho, t) = 0 $ <eq:continuity>
]

This is an important result that we will use often. It expresses _conservation of charge_:
a change in charge density in time is associated with a divergence in the current
(charges flowing in or out of the volume).

In integral form:
$ integral.cont_S vb(J) dot dd(vb(a)) = - dv(Q, t) $

== Summary: Maxwell's Equations

These are Maxwell's _microscopic_ equations: $rho$ and $vb(J)$ include _all_
charges and currents, also "internal" ones like bound charges in atoms and molecules.
They are a system of coupled first-order partial differential equations.

#exercise-box[
  - How many equations do we have (counting components)?
  - Why didn't we write them in Cartesian coordinates?
]

Here they are in one place (combining @eq:gauss, @eq:div-B, @eq:faraday, and @eq:ampere):

#key-box[
  $ 
    div vb(E) &= rho / epsilon_0 & "(i)" \
    div vb(B) &= 0 & "(ii)" \
    curl vb(E) &= -pdv(vb(B), t) & "(iii)" \
    curl vb(B) &= mu_0 vb(J) + + mu_0 epsilon_0 pdv(vb(E), t) & "(iv)" 
  $
  <eq:maxwell>
]

=== Consequences

Suppose you switch on a current $vb(J)$:
- $vb(J)$ varies in time
- generates a time-variable $vb(B)$ field through Ampère's law (iv)
- generates a time-variable $vb(E)$ field through Faraday's law (iii)
- which in turn modifies $vb(B)$, and so on...

This sounds like an oscillation that propagates — Maxwell's equations are the source
of _electromagnetic waves_. We will get to that in the coming weeks.

