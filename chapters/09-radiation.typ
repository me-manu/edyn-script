// Chapter 9: Radiation
// Based on Lecture 9 — Griffiths Ch. 11.1
#import "/lib.typ": *

= Radiation

#text(fill: gray)[_Literature: Griffiths Ch. 11.1_]

We've seen that Maxwell's equations have wave solutions, which correspond to
light, or (more generally) electromagnetic radiation. Now we would like to
understand: how do we actually produce light?

We will see that *accelerated* charges produce radiation, i.e. they emit
light (we already saw that acceleration of a point charge leads to an
electric field when discussing the Liénard-Wiechert potentials). This matters in a variety of settings, for example:
- Oscillating charges lead to an oscillating dipole moment and the emission
  of EM waves. This is how an *antenna* works!
- Relativistic charged particles, i.e. particles with a velocity close to
  the speed of light, that are deflected by a magnetic field will emit
  so-called *synchrotron radiation*.

#supplement-box(title: [Synchrotron radiation in practice])[
  Synchrotron radiation is important in many astrophysical settings, and is
  one of the major energy-loss channels in circular particle accelerators
  like the LHC — and the reason why you want to build colliders with large
  radii, to reduce synchrotron losses. It's also why accelerating protons is
  easier than electrons, since synchrotron losses scale with $1\/m^4$, where
  $m$ is the mass of the particle, and $m_p \/ m_e approx 1/2 dot 10^3$.
]

#supplement-box(title: [Comment: classical instability of matter])[
  The classical description that we will deal with here would lead to an
  instability of matter: an electron orbiting its nucleus would lose energy
  continuously and plunge into the nucleus. You need quantum mechanics to
  explain why this does not happen — we will touch on this in the
  tutorials.
]

== Radiated Power Through a Distant Surface

Here, we're interested in the radiation far away from some volume where
charges and currents produce the radiation in the first place. To make this
more concrete, we're often interested in the radiated power passing through
a surface far away from the source, as sketched in @fig:rad-sphere-source,
such that $r' equiv abs(vb(r)') lt.double abs(vb(r)) equiv r$.

#figure(
  include "/figures/rad-sphere-source.typ",
  caption: [
    A localized source of charges and currents, confined to a volume $V$
    of size $~d^3$, and a distant sphere of radius $r$, with
    $abs(vb(r)-vb(r)') >> d$ for all $vb(r)' in V$.
  ],
) <fig:rad-sphere-source>

The radiated power passing through the entire surface of the sphere is given
by the integral of the Poynting vector:

#key-box[
  $
    P(r,t) = integral.cont vb(S) dot dd(vb(a)) = 1/mu_0 integral.cont (vb(E) times vb(B)) dot dd(vb(a)),
  $ <eq:rad-poynting-power>
]
taking into account that the radiation passing through the sphere at time
$t$ was emitted at time

#key-box[
  $ t_r = t - abs(vb(r)-vb(r)')/c approx t - r/c. $ <eq:rad-retarded-time-approx>
]

To find the fields, we start with the retarded potentials
 using Lorenz gauge, see @eq:pot-retarded-potentials,
$
  V(vb(r),t) &= 1/(4 pi epsilon_0) integral_V dd(V') (rho(vb(r)', t_r))/abs(vb(r)-vb(r)'), \
  vb(A)(vb(r),t) &= mu_0/(4 pi) integral_V dd(V') (vb(J)(vb(r)', t_r))/abs(vb(r)-vb(r)'),
$ <eq:rad-potentials>
where we only consider $rho, vb(J)$ to be nonzero for $vb(r)' in V$ (some
finite volume). #text(fill:rgb(128, 128, 128), [Sorry, letter $V$ stands here both for volume and for the scalar potential, but we hope you can tell them apart from context.]).

== The Multipole Expansion

We consider a volume of size $V ~ d^3$. If $abs(vb(r)-vb(r)') >> d$ for all
$vb(r)' in V$, then we can actually approximate $abs(vb(r)-vb(r)') approx abs(vb(r)) = r$.
In fact, we will also keep the first-order term of the *Taylor expansion* of
$abs(vb(r)-vb(r)')$ — this works similarly to the Taylor expansion you know
from single-variable calculus.

#supplement-box(title: [Reminder: Taylor expansion of a scalar field])[
  The absolute value can be regarded as a function $f: RR^3 -> RR$ with
  $f(vb(r)') = abs(vb(r)-vb(r)')$ for fixed $vb(r)$. Recall that for such a
  scalar field, the expansion around a vector $vb(a)$ is given by
  $
    f(vb(r)') approx f(vb(a)) + ((vb(r)'-vb(a)) dot vb(nabla)') f(vb(a))
    + 1/2 ((vb(r)'-vb(a)) dot vb(nabla)')^2 f(vb(a)) + dots.c,
  $
  where the first-order term, written out explicitly, is
  $
    (r'_x - a_x) pdv(f,x') |_(vb(a)) + (r'_y - a_y) pdv(f,y') |_(vb(a)) + (r'_z - a_z) pdv(f,z') |_(vb(a)).
  $
]

Our goal is now to expand the absolute value of the seperation vector $abs(vb(r)-vb(r)')$ as well as the retarded time $t_r$ and identify the leading order terms that contribute most to the radiated power. This is what we call the _multipole expansion_. 

=== Expanding the Separation Vector

Expanding around $vb(a) = vb(0)$ and using the explicit form of
$f(vb(r)') = abs(vb(r)-vb(r)')$,
$
  abs(vb(r)-vb(r)') = r mark(-,tag: #<rad-primed-grad>)  [1/(2 abs(vb(r)-vb(r)')) 2(vb(r)-vb(r)')]_(vb(r)'=0) dot vb(r)' + dots.c
  approx r - (vb(r) dot vb(r)')/r.
$ <eq:rad-R-expansion>

#{
  import "/lib.typ": cetz
  annot-cetz(
    (<rad-primed-grad>,),
    cetz,
    {
      import cetz.draw: *
      content(
        (rel: (0, -1.1), to: "rad-primed-grad.south"),
        anchor: "north", name: "rad-primed-grad-label",
        text(size: 9pt, fill: rgb("#c0392b"))[we differentiate w.r.t. the\ primed coordinates],
      )
      line("rad-primed-grad-label.north", "rad-primed-grad.south",
        stroke: 0.6pt + rgb("#c0392b"), mark: (end: ">", fill: rgb("#c0392b"), size: 0.15))
    },
  )
}
#v(2.2em)

Similarly, for $1 \/ abs(vb(r)-vb(r)')$ (which we also need, for the
potentials @eq:rad-potentials),
$
  1/abs(vb(r)-vb(r)') = 1/r - [-1/2 1/abs(vb(r)-vb(r)')^3 (-2)(vb(r)-vb(r)')]_(vb(r)'=0) dot vb(r)' + dots.c
  approx 1/r + (vb(r) dot vb(r)')/r^3.
$ <eq:rad-inv-R-expansion>

In both cases, we only kept the zeroth and first order terms. 

=== Expanding the Retarded Time Dependence

Again, we have to take care that the charge and current distributions
depend on the retarded time, $rho(vb(r)', t_r) = rho(vb(r)', t - abs(vb(r)-vb(r)')/c)$.
In order to expand this further, we need to assume that the movement of the
charges is *non-relativistic*, so that an associated current does not
change considerably over the timescale $tau ~ d/c$ that it would take the
current to cross the volume $d^3$.

In this case, we can expand $rho$ (and $vb(J)$) in time $t$ around the
retarded time at the origin, $t_0 equiv t - r/c$ (using the chain rule),
$
  rho(vb(r)', t - abs(vb(r)-vb(r)')/c) = rho(vb(r)', t_0) + dot(rho)(vb(r)', t_0) [grad' t_r]_(vb(r)'=0) dot vb(r)' + dots.c
$ <eq:rad-rho-expansion-setup>

The gradient of $t_r$ with respect to the *primed* coordinates is
$
  grad' t_r = grad' (t - abs(vb(r)-vb(r)')/c) = -1/c grad' abs(vb(r)-vb(r)')
  = -1/c ((-1)(vb(r)-vb(r)'))/abs(vb(r)-vb(r)') = 1/c (vb(r)-vb(r)')/abs(vb(r)-vb(r)'),
$
where we used that $grad abs(vb(r)-vb(r)') = (vb(r)-vb(r)')/abs(vb(r)-vb(r)')$
(with respect to the *unprimed* coordinates; the extra minus sign for
$grad'$ comes from differentiating $vb(r)-vb(r)'$ with respect to the
primed variable). Evaluated at $vb(r)'=0$, keeping only first order,
$
  [grad' t_r]_(vb(r)'=0) = 1/c vb(r)/abs(vb(r)) = vu(r)/c.
$ <eq:rad-grad-tr>

Plugging @eq:rad-grad-tr into @eq:rad-rho-expansion-setup, and similarly for
$vb(J)$,

#key-box[
  $
    rho(vb(r)', t_r) &approx rho(vb(r)', t_0) + dot(rho)(vb(r)', t_0) (vb(r) dot vb(r)')/(r c), \
    vb(J)(vb(r)', t_r) &approx vb(J)(vb(r)', t_0) + dot(vb(J))(vb(r)', t_0) (vb(r) dot vb(r)')/(r c).
  $ <eq:rad-rho-J-expansion>
]

What does the $(vb(r) dot vb(r)')/(r c)$ term mean physically?
$vb(r) dot vb(r)' = r r' cos theta$
is the projection of $vb(r)'$ onto $vb(r)$, and since we're considering a
volume $prop d^3$, this is of order $~r d$.
Since $vb(r) dot vb(r)' \/ (r c) ~ d/c = tau$, this term is the time it
takes a light signal to traverse the source volume.

=== The Dipole Term of the Vector Potential

We now expand the vector potential (we could also do this with the scalar
potential), using the expansions of both $vb(J)$ (@eq:rad-rho-J-expansion)
and $1 \/ abs(vb(r)-vb(r)')$ (@eq:rad-inv-R-expansion). We only want to keep
leading-order terms, $cal(O)(d)$.

#exercise-box[
  We will show in a moment that $dot(vb(J))$ itself is of order $~d$. With
  this in mind, which terms should we keep when multiplying out the two
  brackets?
]

As it turns out, this is simply the combination of the *first* term in the
expansion of $vb(J)$ and the *first* term of the expansion of
$1\/abs(vb(r)-vb(r)')$: combinations with the second term in
$1\/abs(vb(r)-vb(r)')$ are neglected since they fall off with an additional
factor $1\/r$ before the integral; combinations with the second term in
$vb(J)$ are neglected because they would be of second order in $d$. Using
both @eq:rad-rho-J-expansion and @eq:rad-inv-R-expansion,
$
  vb(A)(vb(r),t) &= mu_0/(4 pi) integral_V dd(V') (vb(J)(vb(r)',t_r))/abs(vb(r)-vb(r)') \
  &approx mu_0/(4 pi) integral_V dd(V') [vb(J)(vb(r)', t_0) + dot(vb(J))(vb(r)', t_0) (vb(r) dot vb(r)')/(r c)]
    [1/r + (vb(r) dot vb(r)')/r^3],
$
so that, keeping only the leading-order term (the $1/r$ term can be pulled
outside the integral),

$ vb(A)(vb(r),t) = mu_0/(4 pi r) integral_V dd(V') vb(J)(vb(r)', t_0) + cal(O)(d^2, 1/r^2). $ <eq:rad-A-leading>

=== The Electric Dipole Moment

We can re-write 
#key-box[
  $ integral_V dd(V') vb(J)(vb(r)', t_0) = dot(vb(p))(t_0) $ <eq:rad-J-integral-dipole>
]
where 
$
 vb(p) = integral_V dd(V') vb(r)' rho(vb(r)', t_0) 
$
is the *electric dipole moment*. 

As the dipole moment is already of order $d$ (remember $vb(p) = q vb(d)$ for
the configuration of a charge $+q$ at the origin and $-q$
displaced by $vb(d)$), we can neglect any higher-order terms in the
expansion of $vb(A)$. 

Let's show why @eq:rad-J-integral-dipole holds by considering the following divergence

$
  div (vb(J) x'_i) = (div vb(J)) x'_i + J_i,
$
where $x'_i$ is the $i$-th component of $vb(r)'$ (e.g. $y'$). Using the
continuity equation, $div vb(J) + dot(rho) = 0$ (@eq:continuity),
$
  div (vb(J) x'_i) = -dot(rho) x'_i + J_i
  quad => quad
  J_i = div (vb(J) x'_i) + dot(rho) x'_i.
$
Plugging this in for the $i$-th component of the integral,
$
  integral_V dd(V') J_i = integral_V dd(V') [div (vb(J) x'_i) + dot(rho) x'_i].
$
Using Gauss's theorem, the first term becomes a boundary term, and we
assume $vb(J) -> 0$ as $abs(vb(r)') -> infinity$, so that
$
  integral_V dd(V') J_i = integral_V dd(V') dot(rho)(vb(r)', t_0) x'_i.
$
Combining all three components $i = x,y,z$, and pulling the time
derivative out of the integral,
$
  integral_V dd(V') vb(J)(vb(r)', t_0) = dv(,t) integral_V dd(V') rho(vb(r)', t_0) vb(r)'
  = dv(,t) vb(p)(t_0) = dot(vb(p))(t_0).
$ <eq:rad-dipole-derivation>
This confirms @eq:rad-J-integral-dipole.

Plugging @eq:rad-J-integral-dipole into
@eq:rad-A-leading we find, 

#result-box[
  $ vb(A)(vb(r),t) approx mu_0/(4 pi r) dot(vb(p)) (t - r/c). $ <eq:rad-dipole-A>
]
This is the *electric dipole approximation*. It says that, to leading order
in $d/r$, for any charge distribution, it's the dipole moment that
generates the vector potential far away.

#exercise-box[
  Take a minute and discuss @eq:rad-dipole-A with your neighbor.
]

From $vb(A)$, we can now deduce the fields $vb(E)$, $vb(B)$, and from them
get the Poynting vector and the radiated power.

== Fields in the Dipole Approximation

=== Magnetic Field

Let's start with the magnetic field,
$ vb(B) = curl vb(A) = curl (mu_0/(4 pi r) dot(vb(p))(t-r/c)). $
The curl acts on the $1/r$ term as well as on the argument of $dot(vb(p))$.
We can use the product rule
$ curl (f(vb(r)) vb(C)(vb(r))) = f (curl vb(C)) - vb(C) times (grad f), $
and the fact that $grad r = vu(r)$ and $grad (1/r) = -vb(r)/r^3$, to find
$
  vb(B) &= mu_0/(4 pi) [1/r curl dot(vb(p)) - dot(vb(p)) times (grad 1/r)] \
  & mark(=, tag: #<rad-B-chain>) mu_0/(4 pi) [1/(r c) (- grad r) times dot.double(vb(p)) + dot(vb(p)) times vb(r)/r^3] \
  & mark(=, tag: #<rad-B-switch>) -mu_0/(4 pi r c) (vu(r) times dot.double(vb(p))) -mu_0/(4 pi r^2)(vu(r) times dot(vb(p)) ).
$ <eq:rad-B-setup>

#{
  import "/lib.typ": cetz
  annot-cetz(
    (<rad-B-chain>, <rad-B-switch>),
    cetz,
    {
      import cetz.draw: *
      let red = rgb("#c0392b")
      content(
        (rel: (-1.0, 0), to: "rad-B-chain.west"),
        anchor: "east", name: "rad-B-chain-label",
        align(right, text(size: 8pt, fill: red)[chain rule\ first term]),
      )
      line("rad-B-chain-label.east", "rad-B-chain.west",
        stroke: 0.6pt + red, mark: (end: ">", fill: red, size: 0.15))
      content(
        (rel: (-1.0, 0), to: "rad-B-switch.west"),
        anchor: "east", name: "rad-B-switch-label",
        align(right, text(size: 8pt, fill: red)[switched order in cross\ product in second term]),
      )
      line("rad-B-switch-label.east", "rad-B-switch.west",
        stroke: 0.6pt + red, mark: (end: ">", fill: red, size: 0.15))
    },
  )
}

#supplement-box(title: [Details on the calculation using Cartesian coordinates])[
  We can do this calculation also explicitly in Cartesian coordinates, but it's much more efficient to use the Levi-Civita tensor and component notation,
  $
    mu_0/(4 pi) vec(partial_x, partial_y, partial_z) times 1/r vec(dot(p)_x, dot(p)_y, dot(p)_z)
    = mu_0/(4 pi) sum_(i,j,k) epsilon_(i j k) partial_i (dot(p)_j/r) vu(x)_k.
  $
  Let's calculate $partial_i (1/r)$, $i=1,2,3$:
  $
    partial_i 1/r = partial_i 1/sqrt(x^2+y^2+z^2) = -1/2 1/r^3 2 x_i = -x_i/r^3,
  $
  and, using the chain rule on the retarded-time argument,
  $
    partial_i dot(p)_j = dot.double(p)_j partial_i (t - r/c) = dot.double(p)_j (-1/c) 1/2 1/r 2 x_i = -dot.double(p)_j x_i/(c r).
  $
  So that
  $
    mu_0/(4 pi) (curl dot(vb(p))/r)_k &= -mu_0/(4 pi) sum_(i,j) epsilon_(i j k) (x_i dot(p)_j/r^3 + x_i dot.double(p)_j/r) \
    &= -mu_0/(4 pi) [1/r (vu(r)/r times dot(vb(p)))_k + (vu(r) times dot.double(vb(p)))_k],
  $
  using that $sum_(i,j) epsilon_(i j k) x_i dot(p)_j = (vb(r) times dot(vb(p)))_k$
  (and similarly for the second term). So,
  $ curl dot(vb(p)) = -1/r^2 (vu(r) times dot(vb(p))) - 1/(r c) (vu(r) times dot.double(vb(p))). $
]

Collecting results, 

#result-box[
  $ vb(B)(vb(r),t) = - mu_0/(4 pi r c) (vu(r) times dot.double(vb(p))) -mu_0/(4 pi r^2) (vu(r) times dot(vb(p))) , $ <eq:rad-B-full>
]
with $dot(vb(p))$ and $dot.double(vb(p))$ evaluated at $t - r/c$.

#exercise-box[
  From the two terms in $vb(B)$ (@eq:rad-B-full), which one do you think
  dominates far away?
]

Far away from the source, we expect it to be the first one, since the
second one drops off as $1/r^2$. We can make this statement more precise if
we assume that the dipole oscillates in time at angular frequency $omega$.
Then, $dot.double(vb(p)) = omega dot (vb(p))$ and we expect the dipole to generate EM waves at wavelength $lambda ~ c/omega$.  As long as
$r >> lambda$, the second term indeed dominates,

#key-box[
  $ vb(B)(vb(r),t) approx -mu_0/(4 pi r c) [vu(r) times dot.double(vb(p))(t-r/c)]. $ <eq:rad-B-far>
]

The region $r >> lambda$ is called the *far-field zone*.

#supplement-box(title: [Hierarchy of scales])[
  $ r >> lambda >> d. $
]

=== Electric Field

To get the $vb(E)$ field, either you start from the potentials, or you use
Maxwell's equation (iv) (@eq:maxwell), with $mu_0 epsilon_0 = 1/c^2$ and
$vb(J) = vb(0)$ outside the source volume $V$:
$ dot(vb(E)) = c^2 (curl vb(B)). $
$curl vb(B)$ will again have two contributions, one from $1/r$ and the
other from the argument of $dot.double(vb(p))$. Again, using the far-field
approximation, the curl will be dominated by terms where $grad$ acts on
$dot.double(vb(p))$ (i.e. gives a $dot.triple(vb(p))$ term with a single
power of $1/r$, rather than a $1/r^2$ term). The result is
$
  dot(vb(E))(vb(r),t) approx mu_0/(4 pi r c^2) vu(r) times (vu(r) times dot.triple(vb(p))(t-r/c)),
$
so that, integrating in time (equivalently, this is just differentiating
@eq:rad-B-far once more and using $curl vb(B)=dot(vb(E))/c^2$),

#key-box[
  $
    vb(E)(vb(r),t) approx mu_0/(4 pi r) vu(r) times (vu(r) times dot.double(vb(p))(t-r/c))
    = -c (vu(r) times vb(B)),
  $ <eq:rad-E-far>
]
which is the same relation as for plane waves (note that this only holds in
the far field!).

An oscillating dipole emits *spherical waves*, and the fields fall off as
$1\/r$ (compare to $1\/r^2$ for the $vb(E)$ field of a static point charge).
In spherical coordinates, with $dot.double(vb(p))$ pointing along the
$vu(z)$ direction, the fields are

#key-box[
  $
    vb(E)(r,theta,t) = mu_0/(4 pi) dot.double(p)(t_0) (sin theta)/r vu(theta), quad
    vb(B)(r,theta,t) = mu_0/(4 pi c) dot.double(p)(t_0) (sin theta)/r vu(phi.alt),
  $ <eq:rad-fields-spherical>
]
with $t_0 = t - r/c$.

== The Larmor Formula

Given the fields, we can now finally come back to calculate the radiated
power from a source, passing through a surface.

The Poynting vector is (guess its direction first!)
$
  vb(S) = 1/mu_0 vb(E) times vb(B) = -c/mu_0 (vu(r) times vb(B)) times vb(B).
$
Using the BAC$-$CAB rule, $vb(A) times (vb(B) times vb(C)) = vb(B)(vb(A) dot vb(C)) - vb(C)(vb(A) dot vb(B))$,
$
  vb(S) = c/mu_0 mark(vb(B) times (vu(r) times vb(B)), tag: #<rad-bac-cab>)
  = c/mu_0 [vu(r)(vb(B) dot vb(B)) - vb(B)(vb(B) dot vu(r))]
  = c/mu_0 abs(vb(B))^2 vu(r),
$

#{
  import "/lib.typ": cetz
  annot-cetz(
    (<rad-bac-cab>,),
    cetz,
    {
      import cetz.draw: *
      content(
        (rel: (0, -1.1), to: "rad-bac-cab.south"),
        anchor: "north", name: "rad-bac-cab-label",
        text(size: 9pt, fill: rgb("#c0392b"))[switched order of the cross product,\ gives a minus sign],
      )
      line("rad-bac-cab-label.north", "rad-bac-cab.south",
        stroke: 0.6pt + rgb("#c0392b"), mark: (end: ">", fill: rgb("#c0392b"), size: 0.15))
    },
  )
}
#v(2.2em)
using $vb(B) dot vu(r) = 0$, since $vb(B) prop vu(r) times dot.double(vb(p))$,
so it's perpendicular to $vu(r)$. Plugging in @eq:rad-B-far,
$
  vb(S) = mu_0/(16 pi^2 r^2 c) abs(vu(r) times dot.double(vb(p)))^2 vu(r).
$
In spherical coordinates, with $dot.double(vb(p))$ along $vu(z)$,

#result-box[
  $ vb(S)(vb(r),t) = mu_0/(16 pi^2 c) dot.double(p)^2 (sin^2 theta)/r^2 vu(r). $ <eq:rad-poynting-dipole>
]

Some observations:
+ The power is emitted *radially*.
+ The emitted power falls off as $1\/r^2$, as it should, to ensure energy
  conservation.
+ Although the power is emitted radially, it's not uniform, due to the
  $sin^2 theta$ dependence in @eq:rad-poynting-dipole. Power is largest
  $perp$ to the dipole $vb(p)$, and $0$ parallel to $vb(p)$.

#exercise-box[
  Discuss: why does the $1\/r^2$ drop-off of $vb(S)$ ensure energy
  conservation?
]

The total radiated power is found by integrating over a sphere,
$ P = integral.cont vb(S) dot dd(vb(a)), $
(shown in the exercises — note that $dd(vb(a))$ is also in the $vu(r)$
direction), which gives

#key-box[
  $ P(t) = mu_0/(6 pi c) abs(dot.double(vb(p)))^2, $ <eq:rad-total-power>
]
(note that this is still time-dependent).

For a point charge, the dipole moment is given by $vb(p)(t) = q vb(d)(t)$,
where $vb(d)$ is the distance to the origin. Then
$ dot.double(vb(p))(t) = q dot.double(vb(d))(t) = q vb(a)(t), $
where $vb(a)$ is the acceleration vector. Thus, the radiated power is
(using $mu_0 = 1\/(epsilon_0 c^2)$)

#result-box[
  $ P = q^2 abs(vb(a))^2/(6 pi epsilon_0 c^3). $ <eq:rad-larmor>
]
This is the famous *Larmor formula* for the radiated power of an
accelerated point charge. It's also possible to arrive at this formula by
starting from the Liénard–Wiechert potentials (@eq:lw-potentials), deriving
the $vb(E)$ and $vb(B)$ fields from them, and calculating $vb(S)$ (again
dropping higher-order terms in $d$ and using the far-field approximation).

#supplement-box(title: [Time-averaged radiated power (shown in the exercises)])[
  If the dipole is oscillating in time, i.e. $vb(p) = vb(p)_0 cos(omega t)$,
  then $abs(dot.double(vb(p)))^2 = abs(vb(p)_0)^2 omega^4 cos^2(omega t)$,
  and it is common practice to average over one period $T = 2 pi \/ omega$,
  which gives another factor of $1/2$. In this case, the average radiated
  power reads
  $ expval(P) = mu_0/(12 pi c) abs(vb(p)_0)^2 omega^4. $
  You will verify this in the exercises.
]
