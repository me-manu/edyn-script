// Chapter 4: Reflection and Transmission of Electromagnetic Waves
// Based on Lecture 4 — Griffiths Ch. 9.3
#import "/lib.typ": *

= Reflection and Transmission

#text(fill: gray)[_Literature: Griffiths Ch. 9.3_]

Last lecture we saw that Maxwell's equations lead to EM waves. Today we
continue our discussion of EM waves in matter. In particular, we want to see
what happens when EM waves traverse the boundary between two media, and use
the boundary conditions we derived previously (@sec:boundary-conditions).

== Normal Incidence

#exercise-box[
  What happens when a wave passes an interface, e.g. air $->$ water or
  water $->$ air? (Think of your personal experience!)
]

For an incident wave, there will be a *reflected* and a *transmitted* wave,
both for $vb(E)$ and $vb(B)$, which we call $vb(E)_I, vb(E)_R, vb(E)_T$ and
$vb(B)_I, vb(B)_R, vb(B)_T$ respectively. The reflected and transmitted
fields are determined from the boundary conditions we already derived
(@sec:boundary-conditions).

Let's first look at the case of *normal incidence*: the incident $vb(E)$
field is a plane wave traveling in the $+z$ direction, polarized along
$vu(x)$, with the boundary in the $x y$ plane at $z=0$,
#text(fill: rgb("#008080"))[see @fig:normal-incidence].

#figure(
  include "/figures/normal-incidence-waves.typ",
  caption: [
    Normal incidence: the incident wave (medium 1) generates a reflected
    wave (medium 1) and a transmitted wave (medium 2) at the boundary
    $z=0$.
  ],
) <fig:normal-incidence>

The incoming wave is
$
  vb(E)_I (z, t) = E_(0I) e^(i(k_1 z - omega t)) vu(x), quad
  vb(B)_I (z, t) = B_(0I) e^(i(k_1 z - omega t)) vu(y),
$ <eq:incident-wave>
where, as we saw last lecture, $vb(B) = 1/v (vu(k) times vb(E))$, so that

#v(0.4em)
$ B_(0I) = E_(0I) / mark(v_1, tag: #<vel-tag>) $

#{
  annot-cetz(
    <vel-tag>,
    cetz,
    {
      import cetz.draw: *
      line((rel: (0, -1.0), to: "vel-tag.south"), "vel-tag.south",
        stroke: 0.6pt + rgb("#c0392b"), mark: (end: ">", fill: rgb("#c0392b"), size: 0.15))
      content((rel: (0, -1.2), to: "vel-tag.south"), anchor: "north",
        text(size: 9pt, fill: rgb("#c0392b"))[wave velocity in medium (1)])
    },
  )
}
#v(1.5em)

with $ v_i = 1 / sqrt(epsilon_i mu_i) = c / n_i, quad n_i > 1, quad i = 1,2. $ <eq:v-medium>

A *reflected* wave is generated,

#block(breakable: false)[
  #v(1.6em)
  $
    vb(E)_R (z, t) = E_(0R) e^(i (mark(-k_1 z, tag: #<sign1>) - omega t)) vu(x), quad
    vb(B)_R (z, t) = mark(-E_(0R) / v_1, tag: #<sign2>) e^(i(-k_1 z - omega t)) vu(y),
  $ <eq:reflected-wave>

  #{
    annot-cetz(
      (<sign1>, <sign2>),
      cetz,
      {
        import cetz.draw: *
        content((rel: (0, 0.9), to: "sign1.north"), anchor: "south", name: "sign1-label",
          text(size: 9pt, fill: rgb("#2980b9"))[note the minus sign!])
        line("sign1-label.south", "sign1.north", stroke: 0.6pt + rgb("#2980b9"),
          mark: (end: ">", fill: rgb("#2980b9"), size: 0.15))

        content((rel: (0, -1.1), to: "sign2.south"), anchor: "north", name: "sign2-label",
          text(size: 9pt, fill: rgb("#2980b9"))[required so $vb(S)$ points along $+z$])
        line("sign2-label.north", "sign2.south", stroke: 0.6pt + rgb("#2980b9"),
          mark: (end: ">", fill: rgb("#2980b9"), size: 0.15))
      },
    )
  }
  #v(2.5em)
]

And a *transmitted* wave is generated,
$
  vb(E)_T (z, t) = E_(0T) e^(i(k_2 z - omega t)) vu(x), quad
  vb(B)_T (z, t) = E_(0T) / v_2 e^(i(k_2 z - omega t)) vu(y).
$ <eq:transmitted-wave>

Now, given $E_(0I)$, we would like to determine $E_(0R)$ and $E_(0T)$. For
this we use the boundary conditions (@sec:boundary-conditions), noting that
the boundary is a surface in the $x y$ plane at $z=0$. We assume linear
media without surface charges or currents.

=== Boundary Conditions and Amplitudes

In general, the field on the left, $vb(E)_I + vb(E)_R$ and
$vb(B)_I + vb(B)_R$, must join with the fields on the right, $vb(E)_T$ and
$vb(B)_T$, so that the boundary conditions are satisfied. The fields have
no components perpendicular to the surface (no $z$ component), so boundary
conditions (i) and (ii) are trivial.

From (iii), $vb(E)^parallel$ continuous:
$
  underbrace(E_(0R) + E_(0I), E_1^parallel) = underbrace(E_(0T), E_2^parallel)
$ <eq:normal-bc-E>

And (iv), $vb(H)^parallel = vb(B)^parallel \/ mu$ continuous, with no
surface current:
$
  underbrace(1/mu_1 (- E_(0R) + E_(0I)), B_1^parallel \/ mu_1)
  = underbrace(E_(0T) / (mu_2 v_2), B_2^parallel \/ mu_2)
$
$
  => quad E_(0I) - E_(0R) = underbrace((mu_1 v_1) / (mu_2 v_2), beta) E_(0T)
$ <eq:normal-bc-B>

We have two unknowns, $E_(0R)$ and $E_(0T)$, and two equations,
@eq:normal-bc-E and @eq:normal-bc-B, which we can solve, e.g. by
substitution:

#key-box[
  $ E_(0R) = (1-beta)/(1+beta) E_(0I), quad E_(0T) = 2/(1+beta) E_(0I) $ <eq:normal-amplitudes>
]
with
#result-box[
  $ beta equiv (mu_1 v_1)/(mu_2 v_2) = (mu_1 n_2)/(mu_2 n_1) $ <eq:beta-def>
]

#supplement-box(title: [The special case $mu_1 approx mu_2 approx mu_0$])[
  As mentioned before, for most media $mu approx mu_0$. Under this
  assumption, $beta = v_1 \/ v_2 = n_2 \/ n_1$, and @eq:normal-amplitudes
  becomes
  $
    E_(0R) = (v_2 - v_1)/(v_1 + v_2) E_(0I), quad
    E_(0T) = (2 v_2)/(v_1 + v_2) E_(0I).
  $ <eq:normal-amplitudes-mu0>
  (Check this yourself!)
]

=== Reflection and Transmission Coefficients

What fraction of the incident energy is transmitted, and what fraction is
reflected? For this we look at the incoming intensity, i.e. the
time-averaged Poynting vector for a plane wave in a linear medium:

$
  I = underbrace(lr(〈 vb(S) 〉), "time avg. over one cycle")
  = underbrace(1/2 epsilon v E_0^2, "for plane waves in linear media")
$

With this, we can determine the reflection and transmission coefficients
(both incident and reflected waves propagate in medium 1):

#key-box[
  $
    R = I_R/I_I = ((v_1-v_2)/(v_1+v_2))^2, quad
    T = I_T/I_I = (epsilon_2 v_2)/(epsilon_1 v_1) (E_(0T)/E_(0I))^2
    = (4 v_1 v_2)/(v_1+v_2)^2
  $ <eq:normal-RT>
]

And it's easy to verify that

#result-box[
  $ R + T = 1, $ <eq:normal-energy-conservation>
]
as required from energy conservation. (Check this yourself!)

#supplement-box(title: [Connection to quantum mechanics])[
  We will revisit reflection and transmission coefficients in quantum
  mechanics, when discussing phenomena like scattering and tunneling.
]

== Reflection and Transmission at Oblique Incidence

Let's turn to the more general case of *oblique incidence*, i.e. where
light is not coming in perpendicular to the boundary, but at an angle
$theta_I$ (think e.g. of light shining through a window). Normal incidence
is just the special case $theta_I = 0$.

We have the following situation, #text(fill: rgb("#008080"))[see
@fig:oblique-geometry]:

#figure(
  include "/figures/oblique-incidence-geometry.typ",
  caption: [
    Oblique incidence: the incident, reflected, and transmitted wave
    vectors, together with the angles they make with the surface normal
    $vu(n) = -vu(z)$.
  ],
) <fig:oblique-geometry>

where the incoming wave is now
$
  vb(E)_I = vb(E)_(0I) e^(i (vb(k)_I dot vb(r) - omega t)), quad
  vb(B)_I = 1/v_1 (vu(k)_I times vb(E)_I).
$
(Remember: the physical fields are the real part of these complex
expressions.) Note that we're still assuming monochromatic waves.

Similarly, the transmitted and reflected waves are
$
  vb(E)_R = vb(E)_(0R) e^(i (vb(k)_R dot vb(r) - omega t)), quad
  vb(B)_R = 1/v_1 (vu(k)_R times vb(E)_R),
$
$
  vb(E)_T = vb(E)_(0T) e^(i (vb(k)_T dot vb(r) - omega t)), quad
  vb(B)_T = 1/v_2 (vu(k)_T times vb(E)_T).
$

All waves have the same frequency $omega$, determined e.g. by the light
source. From this we see the *dispersion relation*
$ omega = k_I v_1 = k_R v_1 = k_T v_2, $
or, in terms of just the magnitude of the wave vectors,
$ k_I = k_R = v_2/v_1 k_T = n_1/n_2 k_T. $

=== Laws of Geometric Optics

We again use the boundary conditions, where
$
  vb(E)_1 = vb(E)_I + vb(E)_R, quad vb(B)_1 = vb(B)_I + vb(B)_R, quad
  vb(E)_2 = vb(E)_T, quad vb(B)_2 = vb(B)_T.
$

#supplement-box(title: [Parallel and perpendicular components])[
  We can get the parallel ($parallel$) and perpendicular ($perp$)
  components with the help of the surface normal $vu(n)$, e.g.
  $
    vb(E)_1^perp = vb(E)_1 dot vu(n), quad
    vb(E)_1^parallel = vb(E)_1 - (vb(E)_1 dot vu(n)) vu(n).
  $
]

From boundary condition (iii) at $z=0$, we have
$
  E_1 (vb(E)_(0I)^parallel e^(i(vb(k)_I dot vb(r) - omega t))
  + vb(E)_(0R)^parallel e^(i(vb(k)_R dot vb(r) - omega t)))
  = E_2 vb(E)_(0T)^parallel e^(i(vb(k)_T dot vb(r) - omega t)).
$

With $vb(r) = (x,y,0)$, the $x,y,t$ dependence is only in the exponents, so
for any point on the boundary and any time $t$ we must have
$ vb(k)_I dot vb(r) = vb(k)_R dot vb(r) = vb(k)_T dot vb(r), $
which only holds if the components are separately equal — e.g. for $y=0$:
$ k_I^x = k_R^x = k_T^x. $ <eq:kx-matching>

Let's choose a coordinate system where $vb(k)_I$ lies in the $x z$ plane
($k_I^y = 0$); then @eq:kx-matching forces $vb(k)_R$ and $vb(k)_T$ to also
lie in the $x z$ plane. From this we find the *fundamental laws of
geometric optics*:

+ The incident, reflected, and transmitted wave vectors form a plane — the
  _plane of incidence_ — that also contains the normal vector $vu(n)$ of
  the interface.
+ $theta_I = theta_R$: the angle of incidence equals the angle of
  reflection. This follows from @eq:kx-matching,
  $ k_I sin theta_I = k_R sin theta_R, quad "and" quad k_I = k_R. $ <eq:law-of-reflection>
+ *Snell's law*:
  #result-box[
    $ sin(theta_T) / sin(theta_I) = v_2/v_1 = n_1/n_2, $ <eq:snells-law>
  ]
  which again follows from @eq:kx-matching, $k_I sin theta_I = k_T sin theta_T$,
  together with $k_(I,T) = omega \/ v_(1,2)$.

Now that we've taken care of the exponential factors in the boundary
conditions, we can continue with finding the amplitudes. The exponential
factors cancel, and we're left with:

$
  "(i)" & quad epsilon_1 (vb(E)_(0I) + vb(E)_(0R))^perp = epsilon_2 vb(E)_(0T)^perp \
  "(ii)" & quad (vb(B)_(0I) + vb(B)_(0R))^perp = vb(B)_(0T)^perp \
  "(iii)" & quad (vb(E)_(0I) + vb(E)_(0R))^parallel = vb(E)_(0T)^parallel \
  "(iv)" & quad 1/mu_1 (vb(B)_(0I) + vb(B)_(0R))^parallel = 1/mu_2 vb(B)_(0T)^parallel
$

=== Amplitudes: Polarization in the Plane of Incidence

Let's assume that the polarization of the incident wave is in the plane of
incidence, #text(fill: rgb("#008080"))[see @fig:oblique-polarization].

#figure(
  include "/figures/oblique-incidence-polarization.typ",
  caption: [
    Oblique incidence with polarization in the plane of incidence: $vb(E)$
    lies in the plane of the page for all three waves, while $vb(B)$
    points out of the page.
  ],
) <fig:oblique-polarization>

Then (i), the perpendicular component, becomes
$
  epsilon_1 underbrace((- E_(0I) sin theta_I + E_(0R) sin theta_R), "surface normal direction")
  = epsilon_2 underbrace((- E_(0T) sin theta_T), "same direction as incident wave"),
$

using $theta_I = theta_R$ (law 2):
$
  epsilon_1 sin theta_I (- E_(0I) + E_(0R)) = - epsilon_2 sin theta_T E_(0T)
  quad => quad E_(0R) - E_(0I) = - epsilon_2/epsilon_1 sin(theta_T) / sin(theta_I) E_(0T).
$
Using Snell's law (law 3) to flip the sign, this becomes
$
  E_(0I) - E_(0R) = epsilon_2/epsilon_1 v_1/v_2 E_(0T) = underbrace((mu_1 v_1)/(mu_2 v_2), beta) E_(0T)
$ <eq:oblique-bc-perp>
— the same $beta$ as in @eq:beta-def. Boundary condition (ii) does not add
anything, since $vb(B)$ has no $z$ component.

Boundary condition (iii), the parallel component, becomes
$
  E_(0I) cos theta_I + E_(0R) cos theta_R = E_(0T) cos theta_T
  quad => quad E_(0I) + E_(0R) = underbrace(cos(theta_T) / cos(theta_I), alpha) E_(0T)
$ <eq:oblique-bc-par>
using law 2 again. Boundary condition (iv) gives the same result as (iii)
(check this yourself!).

With @eq:oblique-bc-perp and @eq:oblique-bc-par, we again have two
equations for two unknown amplitudes $E_(0R)$ and $E_(0T)$. Solving:

#key-box[
  $ E_(0R) = (alpha-beta)/(alpha+beta) E_(0I), quad E_(0T) = 2/(alpha+beta) E_(0I) $ <eq:fresnel>
]
with
#result-box[
  $ alpha equiv cos(theta_T) / cos(theta_I), quad beta equiv (mu_1 v_1)/(mu_2 v_2) $ <eq:alpha-beta-def>
]

These are the *Fresnel equations* for the case of polarization in the
plane of incidence.

#supplement-box(title: [Consistency checks])[
  - For $theta_I = 0$, $alpha=1$, and we recover normal incidence,
    @eq:normal-amplitudes.
  - For $theta_I = 90°$ (grazing incidence), $cos theta_I -> 0$ so
    $alpha -> infinity$, and the wave is totally reflected.
]

=== The Brewster Angle

There is also an intermediate angle, known as the *Brewster angle*
$theta_B$, where $E_(0R)$ vanishes. This occurs when $alpha = beta$, i.e.
$ cos(theta_T) / cos(theta_I) = (mu_1 v_1)/(mu_2 v_2). $
For $mu_1 approx mu_2 approx mu_0$, combining this with Snell's law
(@eq:snells-law) and $sin^2 theta + cos^2 theta = 1$ gives

#result-box[
  $ tan theta_B = n_2/n_1. $ <eq:brewster>
]
(Discuss with your neighbor: is the derivation clear?)

#supplement-box(title: [Polarized sunglasses])[
  This only occurs for polarization in the plane of incidence — this is
  why polarized (sun)glasses reduce the glare off a horizontal surface:
  they block the (unpolarized) light component reflected at close to the
  Brewster angle.
]

=== Reflection and Transmission Coefficients (Oblique Incidence)

Lastly, we derive the transmission and reflection coefficients for the
general case of oblique incidence. The intensity (power per unit area) of
the incident wave hitting the interface is $I = vb(S) dot vu(z)$, so that
$ I_I = 1/2 epsilon_1 v_1 E_(0I)^2 cos theta_I, $
while the reflected and transmitted intensities are
$
  I_R = 1/2 epsilon_1 v_1 E_(0R)^2 cos theta_R, quad
  I_T = 1/2 epsilon_2 v_2 E_(0T)^2 cos theta_T.
$
This gives

#key-box[
  $
    R &= I_R/I_I = ((alpha-beta)/(alpha+beta))^2, \
    T &= I_T/I_I = (epsilon_2 v_2)/(epsilon_1 v_1) (E_(0T)/E_(0I))^2 cos(theta_T) / cos(theta_I)
    = alpha beta (2/(alpha+beta))^2
  $ <eq:oblique-RT>
]
Again, you may check that $R+T=1$, as required by energy conservation.

#supplement-box(title: [Example: air to glass])[
  Consider the interface between air ($n_1=1$) and glass ($n_2=1.5$), so
  that (for normal incidence) $beta = n_2\/n_1 = 1.5$.
  #text(fill: rgb("#008080"))[See the slides for plots of $R$ and $T$ as a
  function of $theta_I$.]
]

#text(fill: gray)[
  _Next lecture:_ we will see what happens when waves propagate in media
  with free charges and surface currents, such as conductors — this leads
  to the phenomena of absorption and dispersion.
]
