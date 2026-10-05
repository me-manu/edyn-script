// Chapter 5: Absorption and Dispersion
// Based on Lecture 5 — Griffiths Ch. 9.4
#import "/lib.typ": *

= Absorption and Dispersion

#text(fill: gray)[_Literature: Griffiths Ch. 9.4_]

Last lecture we considered the reflection and transmission of EM waves at
the boundary between two *non-conducting* media, i.e. media without free
surface charges. This simplified our boundary conditions for the parallel
and perpendicular $vb(E)$ and $vb(B)$ components.

In this lecture, we'll study what happens now at the boundary of a non-conducting and a *conducting*
medium. 

In the second part, we will return to the propagation of EM waves in non-conducting media,
but now allowing for a *frequency-dependent permittivity* $epsilon(omega)$, which leads to *dispersion*.

== Electromagnetic Waves in Conductors

In a conductor, the free current density is given by
(the generalized form of) *Ohm's law*:

#key-box[
  $ vb(J)_f = sigma vb(E), $ <eq:ohms-law>
]
where $sigma$ is called the *conductivity*.

#supplement-box(title: [Connection to $U = R I$])[
The more familiar form of Ohm's law, $U = R I$, is a special case of @eq:ohms-law.
You can retrieve it by integrating the electric field along a wire of length $L$ and cross-sectional area $A$.

For a constant field $vb(E)$ along the wire, the voltage is
$
  U = integral_0^L vb(E) dot dd(vb(l)) = E L
$
and thus $E = V / L$. 
If $vb(E)$ is uniform across the cross-section, the current is
$
  I = integral_A vb(J)_f dot dd(vb(A)) = J_f A
$
or $J_f = I / A$. 

Plugging everything into @eq:ohms-law, we recover $ U = R I$ with 
the resistance is $R = L/(sigma A)$ and the current is $I = J_f A$.
]

Plugging this into Maxwell's equations (for a linear, homogeneous medium):

#key-box[
  $
    "(i)" & quad div vb(E) = rho_f/epsilon & quad "(iii)" & quad curl vb(E) = -pdv(vb(B), t) \
    "(ii)" & quad div vb(B) = 0 & quad "(iv)" & quad curl vb(B) = mu sigma vb(E) + mu epsilon pdv(vb(E), t)
  $ <eq:maxwell-conductor>
]

You will show in the exercises that the free charge density is then a
function of time and decays,

#v(0.5em)
$
  rho_f (t) = rho_f (0) e^(-mark(sigma/epsilon, tag: #<decay-rate>) t).
$ <eq:charge-decay>

#{
  annot-cetz(
    <decay-rate>,
    cetz,
    {
      import cetz.draw: *
      content((rel: (0.9, -0.9), to: "decay-rate.south"), anchor: "north-west", name: "decay-label",
        text(size: 9pt, fill: rgb("#2980b9"))[$equiv 1\/tau$])
      line((rel: (-0.2, 0.2), to: "decay-label.north-west"), (rel: (0.05, -0.22), to: "decay-rate.south"),
        stroke: 0.6pt + rgb("#2980b9"), mark: (end: ">", fill: rgb("#2980b9"), size: 0.15))
    },
  )
}
#v(1.3em)

Thus, if you put some free charge on a conductor, it will dissipate on a
time scale $tau = epsilon\/sigma$, and "flow out to the edges." If you wait
sufficiently long, (i) in @eq:maxwell-conductor becomes

  $ div vb(E) = 0. $ <eq:conductor-div-E>

=== Wave Equation with a Complex Wavenumber

In the exercises you will also show that this set of Maxwell's equations
can be transformed into a wave equation (following the same steps as in
Chapter 3), and that it is solved by plane waves with *complex
wavenumbers*,
$ tilde(k) = k + i kappa. $ <eq:complex-k>

The complex part leads to an *attenuation* of the wave. Writing this out
explicitly — I'm now including the tilde on $vb(E)$ and $vb(B)$ to remind
you that they are complex:

#key-box[
  $
    tilde(vb(X))(z,t) = tilde(vb(X))_0 e^(-kappa z) e^(i(k z - omega t)),
    quad vb(X) = vb(E) "or" vb(B),
  $ <eq:attenuated-wave>
]
with

#key-box[
  $
    k = omega sqrt((epsilon mu) / 2) [sqrt(1+(sigma/(epsilon omega))^2) + 1]^(1/2), \
    kappa = omega sqrt((epsilon mu) / 2) [sqrt(1+(sigma/(epsilon omega))^2) - 1]^(1/2).
  $ <eq:k-kappa>
]

*Consequence:* waves only penetrate a finite amount into a conductor,
characterized by the *skin depth*

#key-box[
  $ d equiv 1/kappa. $ <eq:skin-depth>
]

#supplement-box(title: [Example: skin depth of silver at optical frequencies])[
  Metals like silver have high conductivity, $sigma tilde.op 10^7 (Omega dot "m")^(-1)$,
  so the $(sigma\/(epsilon omega))^2$ term dominates in $kappa$, @eq:k-kappa:
  $
    kappa approx omega sqrt((epsilon mu)/2) sqrt(sigma/(epsilon omega)) approx sqrt((omega mu_0 sigma)/2),
  $
  so that
  $
    d = 1/kappa &approx sqrt(2/(omega mu_0 sigma))
    = sqrt(2/(10^15 dot 4 pi times 10^(-7) dot 10^7)) "m" \
    &approx 1.3 times 10^(-8) "m" = 13 "nm", 
  $
  where we have used $omega approx 10^15 "Hz"$.

  See also #link("https://www.allaboutcircuits.com/tools/skin-depth-calculator/")[this skin-depth calculator].
]

The real part of $tilde(k)$ determines the wavelength, propagation speed,
and index of refraction, as before:
$ lambda = (2pi)/k, quad v = omega/k, quad n = (c k)/omega. $

#exercise-box[
  Are the waves still transverse?
]

=== Polarization and Phase of $vb(E)$ and $vb(B)$

Let's choose the electric field to be polarized along the $x$-axis and
travelling along the $z$-direction:
$
  tilde(vb(E)) = tilde(E)_0 e^(-kappa z) e^(i(k z - omega t)) vu(x),
$
and from Maxwell's equation (iii) we find the same relation as for plane waves,
@eq:general-plane-wave, 

$
  tilde(vb(B)) = tilde(k)/omega tilde(E)_0 e^(-kappa z) e^(i(k z - omega t)) vu(y).
$

The complex number $tilde(k)$ in the magnetic field will lead to a *phase
difference* between the $vb(E)$ and $vb(B)$ fields.

How large is the phase difference? Remember that we can rewrite a complex number as
$ tilde(k) = k + i kappa = K e^(i phi.alt), quad K = sqrt(k^2 + kappa^2), quad tan phi.alt = kappa/k. $
Thus, the complex amplitudes of the fields are related by
$
  tilde(B)_0 = B_0 e^(i delta_B) = (K e^(i phi.alt))/omega E_0 e^(i delta_E)
  quad => quad delta_B - delta_E = phi.alt:
$
the magnetic field *lags behind* the electric field #text(fill: rgb("#008080"))[(see the slides for a plot)].

== Reflection off a Conductor

Now we can carry out the analysis of what happens when an EM wave hits the
boundary between a non-conducting medium and a conductor. For simplicity,
let's look at the case of *normal incidence*: waves polarized in the
$vu(x)$ direction, propagating along the $z$-axis, i.e. $theta_I = 0$.


#figure(
  include "/figures/conductor-boundary.typ",
  caption: [
    A wave hits the boundary between a non-conducting medium (1) and a
    conductor. For the derivation in the text, we specialize to normal
    incidence, $theta_I = 0$.
  ],
) <fig:conductor-boundary>

Now, we use again the general boundary conditions, @eq:boundary.  
#text(fill: rgb("#008080"))[(see the slides for a reminder)].
For ohmic conductors, there can be no free surface current $vb(K)_f$, as this would
require an infinite electric field at the boundary:
$ vb(K)_f = 0. $
With $theta_I = 0$, we don't have a polarization perpendicular to the
boundary (i.e. parallel to the surface normal $vu(n)$), so boundary
condition (i) yields
$ sigma_f = 0. $

=== Parallel Components

For the parallel components, the analysis is the same as last lecture
(Chapter 4). The only difference: the wave vector $tilde(k)_2$, in the
conductor, is now complex. Going through the same steps as before, we get

#key-box[
  $
    tilde(E)_(0R) = (1-tilde(beta))/(1+tilde(beta)) tilde(E)_(0I), quad
    tilde(E)_(0T) = 2/(1+tilde(beta)) tilde(E)_(0I),
  $ <eq:conductor-amplitudes>
]
with

#block(breakable: false)[
  #v(0.6em)
  $
    tilde(beta) = (mu_1 v_1)/(mu_2 omega) mark(tilde(k)_2, tag: #<k2tilde>),
  $ <eq:beta-tilde>

  #{
    annot-cetz(
      <k2tilde>,
      cetz,
      {
        import cetz.draw: *
        content((rel: (0, -0.8), to: "k2tilde.south"), anchor: "north", name: "k2tilde-label",
          text(size: 9pt, fill: rgb("#2980b9"))[$in CC$ (complex number)])
        line("k2tilde-label.north", "k2tilde.south", stroke: 0.6pt + rgb("#2980b9"),
          mark: (end: ">", fill: rgb("#2980b9"), size: 0.15))
      },
    )
  }
  #v(1.3em)
]

so that $tilde(beta)$ is itself a complex number.

For a *perfect conductor*, $sigma -> infinity$. From @eq:k-kappa, both
$k_2 -> infinity$ and $kappa_2 -> infinity$, so $tilde(k)_2 -> infinity$ and
thus $tilde(beta) -> infinity$. As a result, we find

#key-box[
  $ tilde(E)_(0R) -> -tilde(E)_(0I), quad tilde(E)_(0T) -> 0. $ <eq:perfect-conductor>
]

There's no transmitted wave — only a reflected wave, which has a $180°$
phase shift compared to the incoming wave. *This is how a mirror works!*

#supplement-box(title: [Mirrors in practice])[
  A household mirror usually has a thin layer of silver on the back of a
  glass plate — the glass is just there to support the thin silver layer.
]

#exercise-box[
  Discuss with your neighbor: are these derivations clear?
]

== Frequency Dependence of the Permittivity <sec:dispersion>

#text(fill: gray)[_Literature: Griffiths Ch. 9.4.3_]

=== Recap

We have seen that the propagation of EM waves in media depends on three
material properties. 

#exercise-box[Can you name them?]

Here's a summary:

+ *Permittivity* $epsilon$ and *permeability* $mu$, giving
  $ v = 1/sqrt(mu epsilon) = 1/(n sqrt(epsilon_0 mu_0)) = c/n, $
  with the *index of refraction*
  $ n = sqrt((epsilon mu)/(epsilon_0 mu_0)) approx sqrt(epsilon_r), quad epsilon_r = 1 + chi_e. $
+ *Conductivity* $sigma$ ($ = 1\/rho.alt$, where $rho.alt$ is the
  resistivity), which in general is a tensor $sigma_(i j)$.

$epsilon$, $mu$, and $sigma$ all depend on the material. In addition, they
depend on the *wavelength* (or energy) — and with them, the refractive
index depends on energy. This is a well-known phenomenon in optics called
*dispersion*.

#supplement-box(title: [Example: typical glass])[
  #figure(
    include "/figures/glass-dispersion.typ",
    caption: [
      Index of refraction of typical glass as a function of wavelength.
    ],
  ) <fig:glass-dispersion>
  This is how a prism works, and how a rainbow is formed by rain droplets.
]

We will also see *anomalous dispersion*, where the material experiences a
resonance.

=== Phase and Group Velocity

In a dispersive medium, the wave velocity depends on the EM frequency,
$v(omega)$ (as it turns out, in quantum electrodynamics even the vacuum is
dispersive!).

Each sinusoidal component travels at the *wave* (or *phase*) *velocity*
$ v = omega/k, $
whereas the envelope of a wave packet moves at the *group velocity*
$ v_g = dv(omega, k). $

=== A Model for the Frequency-Dependent Permittivity

We now want to develop a model for the frequency dependence of $epsilon$ in
*dielectrics*, i.e. non-conducting media in which the electrons are bound
to atoms or molecules.

We describe the binding force with a *spring force*:

  $ vb(F)_"binding" = -k_"spring" x = -m omega_0^2 x, $ <eq:binding-force>

where $x$ is the displacement of the electron from its equilibrium position
relative to the nucleus, @fig:bound-electron-spring, and
$ omega_0 = sqrt(k_"spring"/m). $

#figure(
  include "/figures/bound-electron-spring.typ",
  caption: [
    An electron bound to a nucleus by a spring force. The displacement $x$ is
    measured from the equilibrium position.
  ],
) <fig:bound-electron-spring>

#supplement-box(title: [Why a spring force is not a crazy model])[
  If $U(x)$ was the potential of the (much more complicated) true binding
  force, we could expand it around the equilibrium point $x=0$ with a
  Taylor series:
  $
    U(x) = &underbrace(U(0), "can be chosen arbitrarily")
    + x underbrace(U'(0), = -F = 0 "(equilibrium)") \
    &+ 1/2 x^2 underbrace(U''(0), = k_"spring" > 0 "(stable equilibrium)") + med med med.
  $
  Choosing $U(0) = 0$ and using $U'(0) = 0$, this becomes
  $ U(x) = 1/2 U''(0) x^2 + O(x^3), $
  which is exactly the potential of a harmonic oscillator, with
  $k_"spring" equiv U''(0) > 0$ (we will use the same line of argument in
  quantum mechanics).
]

We probably also have a *damping force* that acts against the velocity of
the electron. The simplest model is

  $ vb(F)_"damping" = -m gamma dv(x, t). $ <eq:damping-force>

And lastly, we have a *driving force* given by the electromagnetic wave,
polarized in the $x$-direction:

  $ vb(F)_"driving" = q vb(E) = q E_0 cos(omega t). $ <eq:driving-force>

The electron is then driven by the wave, @fig:driven-electron, which combines
all three forces on the bound electron.

#figure(
  include "/figures/driven-electron.typ",
  caption: [
    An electromagnetic wave (electric field $vb(E)$ along $x$, propagating along
    $z$ with velocity $v$) drives an electron bound to the axis by a spring.
  ],
) <fig:driven-electron>

Using Newton's second law,
$ m dv(x, t, 2) = F_"binding" + F_"damping" + F_"driving", $
we find

$
  m dv(x,t,2) + m gamma dv(x,t) + m omega_0^2 x = q E_0 cos(omega t),
$ <eq:driven-oscillator>

which is a *damped harmonic oscillator*, driven at frequency $omega$.

This is easier to solve in complex notation, i.e. @eq:driven-oscillator is
the real part of

$
  dv(tilde(x), t, 2) + gamma dv(tilde(x), t) + omega_0^2 tilde(x) = q/m E_0 e^(-i omega t),
$ <eq:driven-oscillator-complex>
with $tilde(x) = x + i y$.

In steady state, the system will oscillate at the driving frequency,
$ tilde(x)(t) = tilde(x)_0 e^(-i omega t). $
Plugging this into @eq:driven-oscillator-complex and solving for
$tilde(x)_0$, we find
$
  tilde(x)_0 = (q\/m)/(omega_0^2 - omega^2 - i gamma omega) E_0.
$

In the end, we are interested in the polarization $vb(P)$, which is the dipole moment per unit volume. 
Therefore, we calculate the dipole moment of one electron, which will be the real part of the following expression:

#result-box[
  $ tilde(p)(t) = q tilde(x)(t) = (q^2\/m)/(omega_0^2 - omega^2 - i gamma omega) E_0 e^(-i omega t). $ <eq:dipole-moment>
]

The complex number in the denominator of @eq:dipole-moment means that the
dipole is *out of phase* with $vb(E)$: it lags behind by an angle

#result-box[
  $ phi.alt = tan^(-1) (gamma omega) / (omega_0^2 - omega^2). $ <eq:dipole-phase>
]

#advanced-box(title: [Where does this phase come from?])[
  $tilde(p)$ has the form $tilde(p) = A/(x - i y) e^(-i omega t)$, with
  (comparing to @eq:dipole-moment) $x = omega_0^2 - omega^2$,
  $y = gamma omega$, $A = q^2 E_0\/m$.

  Let's bring this to the form $tilde(p) = tilde(p)_0 e^(i (phi.alt - omega t))$
  by multiplying numerator and denominator by the complex conjugate of the
  denominator:
  $
    tilde(p) = (A(x+i y))/((x - i y)(x + i y)) e^(-i omega t)
    = A/(x^2+y^2) (x+i y) e^(-i omega t).
  $
  With $r^2 equiv x^2 + y^2$ and $x + i y equiv r e^(i phi.alt)$ (as sketched
  in the complex plane, with $tan phi.alt = y\/x$), this becomes
  $ tilde(p) = A/r e^(i(phi.alt - omega t)). $
  So the dipole oscillates at the same frequency $omega$ as the driving
  field, but with an extra phase $phi.alt$. Using $y = gamma omega$ and
  $x = omega_0^2-omega^2$ from @eq:dipole-moment, we recover
  $ tan phi.alt = y/x = (gamma omega)/(omega_0^2-omega^2), $
  i.e. @eq:dipole-phase. $qed$
]

=== From One Electron to the Polarization $vb(P)$

Let's consider a medium made up of $N$ molecules per unit volume, where
each molecule has $f_j$ electrons. Each electron may have a different
(resonant) frequency $omega_j$ and damping $gamma_j$.

The polarization $vb(P)$ is then the real part of

#key-box[
  $
    tilde(vb(P))(t) = (N q^2)/m (sum_j f_j / (omega_j^2 - omega^2 - i gamma_j omega)) tilde(vb(E)).
  $ <eq:polarization-dispersive>
]

#exercise-box[
  Previously, we considered the _real_ case, where $vb(E)$ and $vb(P)$ were
  proportional to each other in linear media, $vb(P) = epsilon_0 chi_e vb(E)$.
  Here, this is not the case — why?
]

The reason: $tilde(vb(P))(t)$ and $tilde(vb(E))(t)$ have a *phase
difference* (@eq:dipole-phase), so their _real parts_ $vb(P)(t)$ and
$vb(E)(t)$ are not proportional at every instant in time. But the
_complex_ $tilde(vb(P))$ and $tilde(vb(E))$ *are* proportional:

#result-box[
  $ tilde(vb(P)) = epsilon_0 tilde(chi)_e tilde(vb(E)), $ <eq:complex-susceptibility>
]
with the *complex susceptibility* $tilde(chi)_e$.

All of our previous considerations for linear media carry over, and we can
define the *complex permittivity* $tilde(epsilon) = epsilon_0 (1+tilde(chi)_e)$
and the *complex dielectric constant*

#key-box[
  $
    tilde(epsilon)_r = tilde(epsilon)/epsilon_0 = 1 + (N q^2)/(m epsilon_0) sum_j f_j / (omega_j^2 - omega^2 - i gamma_j omega).
  $ <eq:complex-dielectric-constant>
]

For $gamma_j = 0$, we see that there's an infinity when $omega -> omega_j$
in $tilde(epsilon)_r$. We call this a *resonance* (also in the case when
$gamma_j != 0$, where the divergence is tamed but there is still a
pronounced peak).

The (complex) wave equation in a dispersive medium is (using
$mu approx mu_0$)
$ nabla^2 tilde(vb(E)) = tilde(epsilon) mu_0 pdv(tilde(vb(E)), t, 2), $ <eq:dispersive-wave-eq>
which is solved by plane waves
$ tilde(vb(E))(z,t) = tilde(vb(E))_0 e^(i(tilde(k) z - omega t)). $

Just as with conductors, the wavenumber is complex, $tilde(k) = k + i kappa$,
so
$ tilde(vb(E))(z,t) = tilde(vb(E))_0 e^(-kappa z) e^(i(k z - omega t)), $
but now the attenuation is not related to the conductivity, but to the
_damping force_ acting on the electrons.

The intensity is $I = tilde(vb(E)) dot tilde(vb(E))^* prop e^(-2 kappa z)$,
and we call

#key-box[
  $ alpha equiv 2 kappa $ <eq:absorption-coefficient>
]
the *absorption coefficient*.

The last thing we want to do is find $alpha$ and the index of refraction,
$ n = (c k)/omega = sqrt((epsilon mu)/(epsilon_0 mu_0)) approx sqrt(epsilon_r) = sqrt(1+chi_e). $
So we need the real and imaginary parts of
$ tilde(k) = omega/c sqrt(tilde(epsilon)_r) = omega/c sqrt(1 + tilde(chi)_e). $

Since $tilde(chi)_e$ is typically small, we Taylor-expand
$sqrt(1+tilde(chi)_e)$ around $tilde(chi)_e = 0$, keeping only the linear
term:

#block(breakable: false)[
  #v(0.6em)
  $
    tilde(k) = omega/c sqrt(1+tilde(chi)_e) mark(approx, tag: #<taylor-term>)
    omega/c (1 + 1/2 tilde(chi)_e),
  $

  #{
    annot-cetz(
      <taylor-term>,
      cetz,
      {
        import cetz.draw: *
        content((rel: (0, -0.8), to: "taylor-term.south"), anchor: "north", name: "taylor-label",
          text(size: 9pt, fill: rgb("#c0392b"))[$sqrt(1 + tilde(chi)_e) approx 1 + 1/2 tilde(chi)_e$])
        line("taylor-label.north", "taylor-term.south", stroke: 0.6pt + rgb("#c0392b"),
          mark: (end: ">", fill: rgb("#c0392b"), size: 0.15))
      },
    )
  }
  #v(1.6em)
]

and using @eq:complex-dielectric-constant for $tilde(chi)_e$:

#result-box[
  $
    tilde(k) approx omega/c [1 + (N q^2)/(2 m epsilon_0) sum_j f_j / (omega_j^2 - omega^2 - i gamma_j omega)].
  $ <eq:k-tilde-expanded>
]

*The index of refraction* is
$ n = c/omega "Re"(tilde(k)) approx "Re"(1 + 1/2 tilde(chi)_e). $
To extract the real part, we rationalize the denominator of each term in
@eq:k-tilde-expanded by multiplying by the complex conjugate:
$
  1/(omega_j^2 - omega^2 - i gamma_j omega)
  = (omega_j^2 - omega^2 + i gamma_j omega) / ((omega_j^2-omega^2)^2 + gamma_j^2 omega^2),
$
so that

#key-box[
  $
    n approx 1 + (N q^2)/(2 m epsilon_0) sum_j (f_j (omega_j^2-omega^2)) / ((omega_j^2-omega^2)^2+gamma_j^2 omega^2).
  $ <eq:index-of-refraction-dispersive>
]

And the *absorption coefficient* is
$
  alpha = 2 kappa = 2 "Im"(tilde(k)) approx 2 omega/c "Im"(1+1/2 tilde(chi)_e)
  = omega/c "Im"(tilde(chi)_e).
$
Using the imaginary part of the rationalized fraction above (i.e.
$gamma_j omega$ in the numerator, instead of $omega_j^2-omega^2$):

#key-box[
  $
    alpha approx (N q^2 omega^2)/(m epsilon_0 c) sum_j (f_j gamma_j) / ((omega_j^2-omega^2)^2+gamma_j^2 omega^2).
  $ <eq:absorption-coefficient-final>
]

#exercise-box[
  Check this yourself: verify the rationalization step above, and that you
  recover @eq:index-of-refraction-dispersive and
  @eq:absorption-coefficient-final.
]

Let's sketch $alpha$ and $n$ in the vicinity of one of the resonances
$omega_j$, see @fig:resonance.

#figure(
  image("/figures/anomalous_dispersion.png", width: 60%),
  caption: [
    Index of refraction $n$ and absorption coefficient $alpha$ near the $D_2$ resonance of sodium. 
  ],
) <fig:resonance>

Away from the resonance ($omega < omega_1$ or $omega > omega_2$), $n$
increases slowly with $omega$ — this is the behavior we saw in e.g. glass
(@fig:glass-dispersion), called *normal dispersion*.

In the region $omega_1 < omega_j < omega_2$ (surrounding $omega_j$), we
instead see a rapid _drop_ of $n$ with increasing $omega$ — called
*anomalous dispersion* — together with a pronounced peak in the absorption
$alpha_j$: the electrons are being driven at (close to) their "favorite"
frequency $omega_j$, leading to oscillations with large amplitude, and
hence a maximum amount of energy dissipated through damping. The material
can become *opaque* in this region.
