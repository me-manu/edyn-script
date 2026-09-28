// Chapter 3: Electromagnetic Waves
// Based on Lecture 3 — Griffiths Ch. 9.1 and 9.2
#import "/lib.typ": *

= Electromagnetic Waves

#text(fill: gray)[_Literature: Griffiths Ch. 9.1 and 9.2_]

Last lectures we reviewed Maxwell's equations and derived the boundary
conditions at the interface between two media. We will now study how
electromagnetic waves arise from Maxwell's equations. Let's first review
waves in general.

== Waves: A Review

#exercise-box[
  What is a wave?
]

In simplest form: a *disturbance that propagates with a fixed shape at
constant velocity*. This neglects, among other things:
- _absorption_ (the wave amplitude will diminish),
- _dispersive effects_ (different frequencies travel at different speeds).

In one dimension, a wave is a solution to the *wave equation*:

#key-box[
  $ pdv(f, z, 2) = 1/v^2 pdv(f, t, 2) $ <eq:wave-equation>
]
where $v$ is the velocity of the wave.

The solution is any function of the form

#result-box[
  $ f(z, t) = g(z - v t) + h(z + v t) $ <eq:wave-solution>
]

#exercise-box[
  What is the physical interpretation of $g$ and $h$?
]

$g(z - v t)$ is a wave traveling to the _right_: the displacement found at
$z$ at time $t$ is found again at $z + v Delta t$ at the later time
$t + Delta t$, see @fig:wave-pulse.
Likewise, $h(z + v t)$ is a wave traveling to the _left_.

#figure(
  include "/figures/wave-pulse-translation.typ",
  caption: [
    A wave $g(z - v t)$ traveling to the right: the same shape reappears,
    shifted by $v t$, at a later time.
  ],
) <fig:wave-pulse>

=== Sinusoidal Waves

A particularly important special case is the *sinusoidal wave*:

#block(breakable: false)[
  #v(0.5em)

  $
    f(z, t) = mark(A, tag: #<amp>)
    cos(mark(k, tag: #<wavenum>) (z - v t) + mark(delta, tag: #<phase>))
  $

  #{
    annot-cetz(
      (<amp>, <wavenum>, <phase>),
      cetz,
      {
        import cetz.draw: *

        content((rel: (0, -0.8), to: "amp.south"), anchor: "north-east", name: "amp-label",
          text(size: 9pt, fill: rgb("#c0392b"))[Amplitude])
        line("amp-label.north", "amp.south", stroke: 0.6pt + rgb("#c0392b"),
          mark: (end: ">", fill: rgb("#c0392b"), size: 0.15))

        content((rel: (0, -0.8), to: "wavenum.south"), anchor: "north-west", name: "wavenum-label",
          text(size: 9pt, fill: rgb("#2980b9"))[wave number])
        line("wavenum-label.north", "wavenum.south", stroke: 0.6pt + rgb("#2980b9"),
          mark: (end: ">", fill: rgb("#2980b9"), size: 0.15))

        content((rel: (0, -0.8), to: "phase.south"), anchor: "north-west", name: "phase-label",
          text(size: 9pt, fill: rgb("#e67e22"))[phase])
        line("phase-label.north", "phase.south", stroke: 0.6pt + rgb("#e67e22"),
          mark: (end: ">", fill: rgb("#e67e22"), size: 0.15))
      },
    )
  }
  #v(1.5em)
]

To see that this is a wave: think of it at fixed $t$ at different $z$, and
at fixed $z$ at different times $t$, then consider what happens if you
change both $z$ and $t$.

#supplement-box(title: [Terminology])[
  - *Wavelength* $lambda = 2 pi \/ k$: distance between two maxima.
  - *Period* $T = 2 pi \/ (k v)$: in one period, a point goes through a full
    cycle (e.g. from $+A$ to $-A$ and back to $+A$).
  - *Frequency* $nu = 1 \/ T = (k v) \/ (2 pi) = v \/ lambda$: number of
    oscillations per unit time.
  - *Angular frequency* $omega = 2 pi nu = k v$: number of radians per unit
    time.
]

Using $omega = k v$, we can write the sinusoidal wave as

#key-box[
  $ f(z, t) = A cos(k z - omega t + delta) $ <eq:sinusoidal-wave>
]

We can use Euler's formula, $e^(i theta) = cos theta + i sin theta$, to
write a wave in complex notation:

#result-box[
  $ f(z, t) = "Re"(A e^(i (k z - omega t + delta))) $ <eq:complex-wave>
]
This notation is very useful for solving the wave equation.

The wave equation @eq:wave-equation is _linear_, so that the sum of two
solutions is also a solution. This is the *superposition principle*, and it is essential for combining waves (e.g. via Fourier analysis).

== Waves in 3D

In 3D, there are different possibilities for the direction of oscillation.
If we take the $z$-direction as the direction of propagation, we can have:

+ *Longitudinal waves*: oscillation in the $z$-direction. Example: sound
  waves, as density fluctuations in a medium,
  see @fig:longitudinal-wave.
+ *Transverse waves*: oscillations in directions orthogonal to $z$.

#figure(
  include "/figures/longitudinal-wave.typ",
  caption: [
    A longitudinal wave: regions of high and low density (compressions and
    rarefactions) propagate along the direction of the wave.
  ],
) <fig:longitudinal-wave>

=== Polarization

Transverse waves in 3D have *two independent states of polarization*,
because there are two directions orthogonal to the propagation direction.

The *polarization vector* $vu(n)$ (with $vu(n) dot vu(n) = 1$) denotes the
plane of oscillation, and $vu(n) dot vu(z) = 0$ for transverse waves.
@fig:transverse-polarization shows two examples for fixed time $t$, with
$vu(n) = vu(x)$ and $vu(n) = vu(y)$ respectively.

#figure(
  include "/figures/transverse-polarization.typ",
  caption: [
    A transverse wave for two linear polarizations: oscillation along
    $vu(x)$ (left) and along $vu(y)$ (right). Both are orthogonal to the
    direction of propagation $vu(z)$.
  ],
) <fig:transverse-polarization>

In general, for *linear polarization*:

#key-box[
  $ vu(n) = cos theta thin vu(x) + sin theta thin vu(y) $ <eq:linear-polarization>
]
with *polarization angle* $theta$.

#supplement-box(title: [Circular polarization])[
  $vu(n)$ can also depend on time. If it rotates clockwise around the $vu(z)$
  axis (as seen looking toward the source), we speak of *right circular
  polarization*; if it rotates counter-clockwise, of *left circular
  polarization*, see #text(fill: rgb("#008080"))[the slides for an example animation].
]

== Electromagnetic Waves

Recall Maxwell's equations in vacuum, @eq:maxwell:

  $ 
    div vb(E) &= rho / epsilon_0 & "(i)" \
    div vb(B) &= 0 & "(ii)" \
    curl vb(E) &= -pdv(vb(B), t) & "(iii)" \
    curl vb(B) &= mu_0 vb(J) + + mu_0 epsilon_0 pdv(vb(E), t) & "(iv)" 
  $

What are the consequences of these equations?

Suppose that you switch on a current $vb(J)(t)$:
- $vb(J)$ will vary in time,
- $=>$ generates a $vb(B)$ field, variable in time,
- $=>$ generates an $vb(E)$ field, variable in time,
- $=>$ will again generate $vb(B)$ through (iv),
- $=>$ perpetual interplay between $vb(E)$ and $vb(B)$ through (iii) and (iv).

This already feels like something is oscillating. Let's play a trick to
transform Maxwell's equations — first-order differential equations — into
_second-order_ differential equations, with the hope that they decouple.

We do this by taking the curl of (iii):
$
  curl (curl vb(E)) = curl (-pdv(vb(B), t)) = -pdv(, t) (curl vb(B))
  = -mu_0 pdv(vb(J), t) - mu_0 epsilon_0 pdv(vb(E), t, 2),
$
where in the last step we exchanged the order of the spatial curl and
temporal derivative (coordinates do not depend on time), and then used (iv).

What is the left-hand side? In @sec:curl-curl we derive the vector calculus identity
 $
    [curl (curl vb(E))]
    = [grad (div vb(E)) - nabla^2 vb(E)], 
$

where $nabla^2 = partial^2 / (partial x^2) + partial^2 / (partial y^2) + partial^2 / (partial z^2)$ is the *Laplacian operator*, acting on all three components of $vb(E)$ separately.

Using this identity and $div vb(E) = rho \/ epsilon_0$
from (i):
$
  grad (rho / epsilon_0) - nabla^2 vb(E) = -mu_0 pdv(vb(J), t) - mu_0 epsilon_0 pdv(vb(E), t, 2).
$
Rearranging, with all $vb(E)$-terms on the left:

#key-box[
  $
    underbrace(mu_0 epsilon_0 pdv(vb(E), t, 2) - nabla^2 vb(E), square vb(E))
    = -grad rho / epsilon_0 - mu_0 pdv(vb(J), t)
  $ <eq:wave-E>
]
The operator $square equiv mu_0 epsilon_0 pdv(, t, 2) - nabla^2$ is the
*d'Alembert operator* (or wave operator).

Let's do the same for Maxwell's equation (iv). Due to the high symmetry
between $vb(E)$ and $vb(B)$ in the vacuum Maxwell equations, we suspect
that we will also arrive at a wave equation:
$
  curl (curl vb(B)) = grad (underbrace(div vb(B), = 0)) - nabla^2 vb(B)
  = mu_0 curl vb(J) + mu_0 epsilon_0 pdv(, t) (underbrace(curl vb(E), = -pdv(vb(B), t))),
$
where we used (ii) and (iv) on the left, and (iv) then (iii) on the right.
Rearranging:

#key-box[
  $ mu_0 epsilon_0 pdv(vb(B), t, 2) - nabla^2 vb(B) = mu_0 curl vb(J) $ <eq:wave-B>
]

We have transformed Maxwell's equations into decoupled second-order
differential equations for regions with charges and currents. (They are
not _always_ decoupled — e.g. Ohm's law $vb(J) = sigma vb(E)$ couples them back together, as is relevant for conductors like radio antennas or the
plasma in the sun's corona.)

== Electromagnetic Waves in Vacuum

Let's consider $vb(E)$ and $vb(B)$ fields generated in some region (e.g. by
an antenna). How will the fields propagate in vacuum (free space), i.e.
away from the region with charges and currents?

There, @eq:wave-E and @eq:wave-B become:

#key-box[
  $
    mu_0 epsilon_0 pdv(vb(E), t, 2) - nabla^2 vb(E) = 0, quad
    mu_0 epsilon_0 pdv(vb(B), t, 2) - nabla^2 vb(B) = 0
  $ <eq:vacuum-wave-eqs>
]
These are 3D wave equations! (@eq:wave-E and @eq:wave-B, with sources on
the right-hand side, are called _inhomogeneous_ wave equations.)

The velocity of the wave is

#result-box[
  $ c^2 = 1 / (mu_0 epsilon_0) $ <eq:speed-of-light>
]
$mu_0$ and $epsilon_0$ can be measured in the lab, and we find
$c approx 2.9979 times 10^8 "m/s"$ — the speed of light!
(Check yourself that $1 \/ sqrt(mu_0 epsilon_0)$ indeed has units of m/s.)

We have stumbled onto the nature of light: it is, in fact, a disturbance
in the $vb(E)$ and $vb(B)$ fields. With this, Maxwell's equations unify
electricity, magnetism, _and_ light.
This is one of the great triumphs of 19th
century physics.

Note that Maxwell's equations are 8 equations (1 from (i), 1 from (ii), 3 each from
(iii) and (iv)), but @eq:vacuum-wave-eqs only give us 6 (3 components
each for $vb(E)$ and $vb(B)$). Not every solution of the wave equation is
a solution of Maxwell's equations — it must fulfill some extra
constraints, as we will see next.

=== Plane Wave Solutions

Consider the plane wave ansatz
$ vb(E)(z, t) = vb(E)_0 e^(i (k z - omega t)), $
with constant $vb(E)_0$. In vacuum, $div vb(E) = 0$, and since
$vb(E)(z,t)$ is independent of $x, y$:
$ partial_x E_x + partial_y E_y + partial_z E_z = 0 => E_(0 z) (i k) e^(i(k z - omega t)) = 0, $
which only holds if $E_(0 z) = 0$. Hence:

#result-box[
  EM waves are *transversal*: $vb(E)$ and $vb(B)$ are perpendicular to the
  direction of propagation. <eq:transversality>
]

Take also $vb(B)(z, t) = vb(B)_0 e^(i(k z - omega t))$ as a plane wave.
From Faraday's law, $curl vb(E) = -pdv(vb(B), t)$, one finds (check this
yourself!) the compact relation

#key-box[
  $ vb(B)_0 = k / omega (vu(z) times vb(E)_0) $ <eq:B-from-E>
]

This tells us:
- $vb(E)$ and $vb(B)$ are both perpendicular to each other (and to $vu(z)$),
  and must both be non-zero.
- $vb(E)$ and $vb(B)$ are _in phase_ — they reach their maximum at the same
  time, since there is no extra phase factor in @eq:B-from-E.
- There are only _electromagnetic_ waves (not waves of $vb(E)$ or $vb(B)$
  alone).

=== General Monochromatic Plane Waves

With $vu(k)$ the unit wave vector in the direction of propagation, and the
dispersion relation $k = omega \/ c$, we have for monochromatic plane waves:

#key-box[
  $
    vb(E)(vb(r), t) &= E_0 e^(i (vb(k) dot vb(r) - omega t)) vu(n), \
    vb(B)(vb(r), t) &= 1/c E_0 e^(i (vb(k) dot vb(r) - omega t)) (vu(k) times vu(n))
    = 1/c (vu(k) times vb(E))
  $ <eq:general-plane-wave>
]
with $vu(n) dot vu(k) = 0$.

== Energy and Momentum in EM Waves

The energy per unit volume stored in the fields is

#key-box[
  $ u = 1/2 (epsilon_0 E^2 + 1/mu_0 B^2) $ <eq:energy-density>
]
(check for yourself through
dimensional analysis that the units work out).

From @eq:B-from-E we see that $B^2 = E^2 \/ c^2$, so that
$ u = epsilon_0 E^2 = 1/mu_0 B^2 $
— $vb(E)$ and $vb(B)$ contribute equally to $u$ — and
$ u = epsilon_0 E_0^2 cos^2(k z - omega t + delta). $

As the wave propagates, it transports energy. The *energy flux density*
(amount of energy transported through a surface per unit time) is given by
the Poynting vector:

#key-box[
  $ vb(S) = 1/mu_0 (vb(E) times vb(B)) $ <eq:poynting>
]
$vb(S)$ points in the direction of propagation, with $|vb(S)| = c u$.

The momentum density is
$ vb(g) = 1/c^2 vb(S), quad |vb(g)| = u / c. $

=== Time-Averaged Quantities

#supplement-box(title: [Scale of visible light])[
  Visible light has a wavelength between $tilde.op 10^2$ and $10^3$ nm, which
  corresponds to a frequency $nu tilde.op 10^15 "Hz"$, i.e. a period
  $T tilde.op 10^(-15) "s"$: very fast oscillations. Usually, we measure
  for durations much longer than that.
]

We therefore consider the *time-averaged energy density* over one period
$T = 2 pi \/ omega$:

$ 
lr(〈 u 〉) = epsilon_0 E_0^2 / T integral_0^T cos^2(k z - omega t + delta) dd(t) 
$
(we will look at time averages like this in the tutorials).

Since the time average of $cos^2$ over a full period is $1\/2$, we find the result

#result-box[
  $ lr(〈 u 〉) = 1/2 epsilon_0 E_0^2 $ <eq:time-avg-energy>
]
This immediately gives the time averages for $vb(S)$ and $vb(g)$ as well.

#supplement-box(title: [A historical puzzle])[
  Note that the average energy density is _independent of frequency_. This
  led to an experimental puzzle — the photoelectric effect — which could
  not be explained classically, and required quantum mechanics to
  describe.
]

== Electromagnetic Waves in Matter

#exercise-box[
  What are the wave equations for $vb(E)$ and $vb(B)$ in a linear and
  homogeneous medium, without free currents or charges? Do EM waves
  propagate slower than in vacuum?
]

In this case, the macroscopic Maxwell's equations, @eq:maxwell-matter,
read:
$
  "(i)" quad div vb(D) = 0, quad quad quad quad
  "(iii)" quad curl vb(E) = -pdv(vb(B), t), \
  "(ii)" quad div vb(B) = 0, quad quad quad quad
  "(iv)" quad curl vb(H) = pdv(vb(D), t).
$

For *linear media* (@eq:lin-media), $vb(D) = epsilon vb(E)$ and
$vb(H) = 1/mu vb(B)$; for *homogeneous* media, $epsilon$ and $mu$ are
constant (they don't vary from point to point). Plugging in, we find:
$
  "(i)" quad div vb(E) = 0, quad quad quad quad
  "(iii)" quad curl vb(E) = -pdv(vb(B), t), \
  "(ii)" quad div vb(B) = 0, quad quad quad quad
  "(iv)" quad curl vb(B) = mu epsilon pdv(vb(E), t).
$

The only difference to the vacuum case, @eq:maxwell, is that
$epsilon_0 -> epsilon$ and $mu_0 -> mu$. Thus, we find EM waves that
propagate at speed

#key-box[
  $ v = 1 / sqrt(epsilon mu) = c / n $ <eq:wave-speed-medium>
]
where
$ n equiv sqrt((epsilon mu) / (epsilon_0 mu_0)) $ <eq:refraction-index>
is the *index of refraction*.

All previous results carry over to the case of a medium, with
$epsilon_0 -> epsilon$ and $mu_0 -> mu$. For most materials,
$mu approx mu_0$, so that
$ n approx sqrt(epsilon_r) = sqrt(epsilon \/ epsilon_0), $
where $epsilon_r$ is called the *dielectric constant*, which might depend
on frequency. Almost always $epsilon_r > 1$, so waves travel _slower_ in
media.

The energy density and Poynting vector become
$
  u = 1/2 (epsilon E^2 + 1/mu B^2), quad
  vb(S) = 1/mu (vb(E) times vb(B)).
$

#advanced-box(title: [Why does light slow down in matter?])[
  Mathematically, replacing $epsilon_0 -> epsilon$ and $mu_0 -> mu$ is a
  pretty trivial result — but physically, it is quite astonishing. As
  waves pass through matter, they polarize and magnetize the molecules,
  producing oscillating dipoles that create their own fields. These new
  fields combine with the original wave to give a wave at the _same_
  frequency, but a _different_ speed.

  This is a non-trivial consequence of linearity, and is the reason
  materials like glass or water are transparent: the wave that emerges is
  still a single coherent wave at the original frequency, just slowed
  down.
]

== Deriving the curl of a curl identity
<sec:curl-curl> 

#advanced-box(title: [The "BAC $-$ CAB" rule for the curl of a curl])[
  Similarly to the vector identity
  $ vb(A) times (vb(B) times vb(C)) = vb(B) (vb(A) dot vb(C)) - vb(C) (vb(A) dot vb(B)) $
  ("BAC $-$ CAB"), one can show an analogous identity for the differential
  operator $vb(nabla)$:
  $ curl (curl vb(C)) = grad (div vb(C)) - nabla^2 vb(C), $
  where $nabla^2$ is the *Laplacian operator*,
  $ nabla^2 f = partial_x^2 f + partial_y^2 f + partial_z^2 f = sum_i partial_i^2 f equiv partial_i partial_i f, $
  acting on each component of $vb(C)$ separately.

  *Proof (in Einstein notation):* look at the $i$-th component,
  $
    [vb(A) times (vb(B) times vb(C))]_i
    = epsilon_(i j k) A_j (vb(B) times vb(C))_k
    = epsilon_(i j k) A_j epsilon_(k l m) B_l C_m.
  $
  Using the cyclic property $epsilon_(i j k) = epsilon_(k i j)$ and the
  identity $epsilon_(k i j) epsilon_(k l m) = delta_(i l) delta_(j m) - delta_(i m) delta_(j l)$
  (which follows from the definition of $epsilon_(i j k)$, in the same way
  as in the note on the Levi-Civita tensor in Chapter 1), this becomes
  $
    epsilon_(i j k) A_j epsilon_(k l m) B_l C_m
    &= (delta_(i l) delta_(j m) - delta_(i m) delta_(j l)) A_j B_l C_m \
    &= B_i (A_j C_j) - C_i (A_j B_j)
    = [vb(B) (vb(A) dot vb(C)) - vb(C) (vb(A) dot vb(B))]_i. checkmark
  $
  The same computation with $vb(A) = vb(B) = vb(nabla)$ (so that
  $A_j -> partial_j$) and $vb(C) -> vb(C)$ gives
  $
    [curl (curl vb(C))]_i
    &= epsilon_(i j k) partial_j epsilon_(k l m) partial_l C_m \
    &= partial_i (partial_j C_j) - partial_j partial_j C_i
    = [grad (div vb(C)) - nabla^2 vb(C)]_i. checkmark
  $
]