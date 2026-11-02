// Chapter 6: Guided Waves
// Based on Lecture 6 — Griffiths Ch. 9.5
#import "/lib.typ": *

= Guided Waves

#text(fill: gray)[_Literature: Griffiths Ch. 9.5_]

In the previous lectures we saw how EM waves propagate in (linear) dielectrics,
and what happens at the boundary between two types of media — we essentially
looked at infinite planes. We also studied conductors.

Now we want to study how EM waves propagate inside *wave guides*, i.e.
inside hollow pipes — e.g. an optical fiber, or a coaxial cable. Two common
examples are the *cylindrical wave guide* (a hollow tube of radius $R$) and
the *rectangular wave guide* (a hollow pipe of rectangular cross-section,
with side lengths $a$ and $b$ along $x$ and $y$, and the wave propagating
along $z$). We will focus on the rectangular case.

#figure(
  include "/figures/waveguide-geometries.typ",
  caption: [The two example wave guide geometries: a cylindrical wave guide
    of radius $R$, and a rectangular wave guide with side lengths $a$ and
    $b$. In both cases the wave propagates along $z$.],
) <fig:wg-geometries>

== Motivation: Why Use Wave Guides?

Why should we use wave guides at all to transmit information (e.g. sound,
light, $dots.h$)?

The intensity of a wave, measured at some distance $d$ from its source,
drops with $d^2$: if the source radiates into all directions, the power
$P$ it emits is spread out over a sphere of area $A = 4 pi R^2$ at distance
$R$, and since power is intensity times area, $P = I dot A$, the intensity
at the receiver falls off as $1\/R^2$.

A receiver of area $A_"receiver"$, at distance $R$ from the transmitter,
only intercepts a fraction $A_"receiver"\/A$ of the total power, as illustrated in @fig:wg-intensity-falloff. 

#figure(
  include "/figures/wg-intensity-falloff.typ",
  caption: [The wavefronts emitted by a point source grow in area
    ($A_1 < A_2 < dots.h$) as they spread out, so the power per unit area
    — the intensity — drops off as $1\/R^2$.],
) <fig:wg-intensity-falloff>

The power received is
$ P_"receiver" = A_"receiver"/A P_"transmitter", quad A = 4 pi R^2. $ <eq:wg-power>

#supplement-box(title: [Example: listening from 1 km away])[
  Take a receiver with the area of a human ear, $A_"receiver" tilde.op 10 "cm"^2$. 
  Let's take a distance of $R = 1 "km"$ to compute the area $A_5$ in @fig:wg-intensity-falloff.
  Then, the received power is
  $
    P_"receiver" = (10 "cm"^2)/(4 pi (1 "km")^2) P_"transmitter"
    approx 10^(-10) P_"transmitter".
  $
  Essentially all of the transmitted power is lost! 
]

== Waves in a Hollow Conductor
To avoid enormous losses when transmitting over long distances, we need a wave guide as depicted in @fig:wg-tube.

#figure(
  include "/figures/waveguide-tube.typ",
  caption: [
    A wave guide carries a wave from a transmitter to a receiver, confined
    to the inside of the tube.
  ],
) <fig:wg-tube>

We'll make the simplifying assumption that the wave guide is a *perfect
conductor*, i.e. $sigma = infinity$. As a consequence, inside the material
of the wave guide,

$ vb(E) = vb(B) = vb(0). $ <eq:wg-conductor>

#supplement-box(title: [Why $vb(E) = vb(B) = vb(0)$ inside a perfect conductor])[
  *1.* $vb(E) = vb(0)$: inside a conductor, $vb(J)_f = sigma vb(E)$
  (@eq:ohms-law). For $sigma = infinity$, $vb(J)_f$ would be infinite unless
  $vb(E) = vb(0)$ — free charges immediately short out any electric field.
  Then, from Faraday's law,
  $ curl vb(E) = -pdv(vb(B), t) = vb(0), $
  so if $vb(B)(t=0) = vb(0)$, then $vb(B)(t) = vb(0)$ for all time.

  *2.* $vb(E) = vb(0)$ in a perfect conductor is also what we found when EM
  waves impinge on a conductor last lecture: there, $tilde(vb(E)) prop e^(-kappa z)$,
  with $kappa -> infinity$ as $sigma -> infinity$ (@eq:k-kappa) — the field
  is attenuated to zero instantly.
]

=== Boundary Conditions

We again use the general boundary conditions from @sec:boundary-conditions,
now between the inside of the wave guide (medium 1) and the inside of the
conducting wall (medium 2). Our geometry is shown in @fig:wg-boundary-wall.

#figure(
  include "/figures/wg-boundary-wall.typ",
  caption: [The boundary between the inside of the wave guide and the
    inside of the conducting wall.],
) <fig:wg-boundary-wall>

Inside the conductor, $vb(E)_2^parallel = vb(0)$
and $vb(B)_2^perp = 0$ (@eq:wg-conductor), so continuity of the parallel $vb(E)$
(@eq:E-par) and perpendicular $vb(B)$ (@eq:B-perp) across the boundary gives

#key-box[
  $ #math.cases(reverse: true, $vb(E)_2^parallel = vb(0) => vb(E)_1^parallel = vb(0)$, $B^perp_2 = 0 => B^perp_1 = 0$)
     vb(E)^parallel &= vb(0), 
     B^perp &= 0 quad "inside the wave guide." $ <eq:wg-bc>
]
Free charges and currents will form on the surface of the wall to enforce
these conditions.

== Monochromatic Waves in a Wave Guide

Let's consider monochromatic waves that propagate down the tube in the
$z$-direction:
$
  tilde(vb(E))(x,y,z,t) = tilde(vb(E))_0 (x,y) e^(i(k z - omega t)), quad
  tilde(vb(B))(x,y,z,t) = tilde(vb(B))_0 (x,y) e^(i(k z - omega t)).
$ <eq:wg-ansatz>

#exercise-box[
  Is the wave number $k$ a real or a complex number in this case?
]

Two remarks on this ansatz:
+ The complex amplitudes $tilde(vb(E))_0$ and $tilde(vb(B))_0$ are only
  functions of $x, y$ — not $z$ — i.e. we look at harmonic waves in $z$ of
  the form $e^(i(k z - omega t))$.
+ $tilde(vb(E))$ and $tilde(vb(B))$ are, in general, *not* plane waves: they
  are not constant on planes of constant $z$.

Our job is to solve Maxwell's equations, subject to the boundary conditions
@eq:wg-bc.

Let's write out the components of our ansatz @eq:wg-ansatz (leaving the
subscript "0" and the tilde off the components for brevity):
$
  tilde(vb(E))_0 &= E_x (x,y) vu(x) + E_y (x,y) vu(y) + E_z (x,y) vu(z), \
  tilde(vb(B))_0 &= B_x (x,y) vu(x) + B_y (x,y) vu(y) + B_z (x,y) vu(z).
$ <eq:wg-components>
In particular, we are *not* assuming that the waves are transverse — i.e.
we do not assume $E_z = B_z = 0$ as we did in the vacuum case for $vu(k) = (0,0,1)$. We will need this generality in order to
satisfy the boundary conditions @eq:wg-bc.

#supplement-box(title:[Proof that $vb(E)$ and $vb(B)$ cannot *both* be transverse])[
In fact, we can show that $vb(E)$ and $vb(B)$ cannot *both* be transverse.

Suppose $E_z = B_z = 0$. Since $E_x, E_y, E_z$ have no explicit
$z$-dependence (they only depend on $x,y$), it follows that $curl tilde(vb(E))_0 = vb(0)$:
$
  underbrace(pdv(E_z,y), = 0 "by assumption," E_z=0) - underbrace(pdv(E_y,z), = 0 "since" E_y "has no" z"-dependence") = 0 - 0 = 0, \
  underbrace(pdv(E_x,z), = 0 "since" E_x "has no" z"-dependence") - underbrace(pdv(E_z,x), = 0 "by assumption," E_z=0) = 0 - 0 = 0, \
  pdv(E_y,x) - pdv(E_x,y) = -pdv(B_z,t) = 0 quad "(by assumption," B_z = 0 ")."
$
Since $curl tilde(vb(E))_0 = vb(0)$, we can write it as the gradient of a
scalar function, $tilde(vb(E))_0 = grad phi$. Plugging this into Maxwell's
equation (i), $div vb(E) = 0$ (no free charge inside the wave guide):
$
  0 = div tilde(vb(E)) = div tilde(vb(E))_0 = div (grad phi) = nabla^2 phi,
$ <eq:wg-laplace>
— a Laplace equation for $phi$.

The boundary condition $vb(E)^parallel = vb(0)$ on the inner wall
(@eq:wg-bc) implies $grad phi = vb(0)$ on the wall, so $phi$ is constant on
the wall. Finally, solutions to Laplace's equation don't have local minima
or maxima inside the region (the *maximum principle*) — so $phi$ must be
constant everywhere inside the wave guide too. Hence

#result-box[
  $ tilde(vb(E))_0 = grad phi = vb(0). $ <eq:wg-no-tem>
]
  No TEM waves are possible in a hollow wave guide. $qed$

  Note that this argument only holds for an *empty* wave guide — it is not true for a
  coaxial cable, which has a second (inner) conductor, so that $phi$ need
  not be constant on the (now disconnected) boundary.
]

=== Solving Maxwell's Equations in a hollow wave guide 

Let's now use our ansatz, @eq:wg-components and the boundary conditions @eq:wg-bc to solve Maxwell's equations. 

We proceed in 3 steps. 

*Step 1.* Let's plug our ansatz into Maxwell's equations (iii) and (iv).
Using $pdv(,z) -> i k$ and $pdv(,t) -> -i omega$ for our ansatz
@eq:wg-ansatz, Faraday's law, $curl vb(E) = -pdv(vb(B), t)$, gives three
component equations:
$
  (x "component") quad pdv(E_z,y) - underbrace(pdv(E_y,z), = i k E_y) = underbrace(-pdv(B_x,t), = i omega B_x) \
  (y "component") quad i k E_x - pdv(E_z,x) = i omega B_y \
  (z "component") quad pdv(E_y,x) - pdv(E_x,y) = i omega B_z.
$ <eq:wg-curl-E>

And Ampère's law without free current inside the wave guide,
$curl vb(B) = (1\/c^2) pdv(vb(E), t)$, gives
$
  pdv(B_z,y) - i k B_y = -i omega/c^2 E_x \
  i k B_x - pdv(B_z,x) = -i omega/c^2 E_y \
  pdv(B_y,x) - pdv(B_x,y) = -i omega/c^2 E_z.
$ <eq:wg-curl-B>

*Step 2.* From these six equations, we can get four equations for
$E_x, E_y, B_x, B_y$ that only depend on $E_z, B_z$
(Griffiths Problem 9.27a).
As an example, let's solve for $E_x$ and $B_y$: the second equation in
@eq:wg-curl-E and the first equation in @eq:wg-curl-B form a linear system
in $E_x, B_y$,
$
  i k E_x - i omega B_y &= pdv(E_z,x) \
  i omega/c^2 E_x - i k B_y &= -pdv(B_z,y).
$
Multiplying the first line by $k$, the second by $omega$, and subtracting
eliminates $B_y$:
$
  i (k^2 - omega^2/c^2) E_x = k pdv(E_z,x) + omega pdv(B_z,y)
  quad => quad E_x = i/((omega/c)^2 - k^2) [k pdv(E_z,x) + omega pdv(B_z,y)].
$
Solving the same pair of equations for $B_y$, and the other pair (the first
equation in @eq:wg-curl-E together with the second in @eq:wg-curl-B) for
$E_y, B_x$, gives

#key-box[
  $
    E_x &= i/((omega/c)^2 - k^2) [k pdv(E_z,x) + omega pdv(B_z,y)], \ 
    E_y &= i/((omega/c)^2 - k^2) [k pdv(E_z,y) - omega pdv(B_z,x)], \
    B_x &= i/((omega/c)^2 - k^2) [k pdv(B_z,x) - omega/c^2 pdv(E_z,y)], \ 
    B_y &= i/((omega/c)^2 - k^2) [k pdv(B_z,y) + omega/c^2 pdv(E_z,x)].
  $ <eq:wg-transverse>
]

Note: 
1. We see explicitly that if both $E_z$ and $B_z$ were zero, $tilde(vb(E))_0$
and $tilde(vb(B))_0$ would be zero too — consistent with
@eq:wg-no-tem. 
2. All that remains is to find $E_z$ and $B_z$.

=== Decoupled Equations for $E_z$ and $B_z$

*Step 3:* Use Maxwell's equations (i) and (ii) to obtain a differential equation for $E_z$ and $B_z$, by plugging the expressions @eq:wg-transverse for
$E_x, E_y, B_x, B_y$ into $div vb(E) = 0$ and $div vb(B) = 0$
(Griffiths Problem 9.27b).

This yields two *uncoupled* differential equations for $E_z$ and $B_z$:

#key-box[
  $
    [pdv(,x,2) + pdv(,y,2) + (omega/c)^2 - k^2] X_z = 0, quad X_z = E_z "or" B_z.
  $ <eq:wg-helmholtz>
]

If $E_z = 0$, the waves are called *transverse electric* (TE) waves; if
$B_z = 0$, they are *transverse magnetic* (TM) waves; and if
$E_z = B_z = 0$, they would be *TEM* waves — which we have just shown
cannot occur in a hollow wave guide (though EM waves in vacuum, and waves
in a coaxial cable, _are_ TEM waves).

#exercise-box[
Try to see that @eq:wg-helmholtz can also be obtained by plugging in @eq:wg-transverse into, e.g., $div vb(E) = 0$.

Also, take a second and discuss with your neighbor: retrace the steps we took to get to @eq:wg-helmholtz, and see if you can understand why we had to go through all three steps. Why can't we just plug the ansatz @eq:wg-ansatz into Maxwell's equations and solve for $E_z$ and $B_z$ directly?
]

== TE Waves in a Rectangular Wave Guide

#text(fill: gray)[_Literature: Griffiths Ch. 9.5.2_]

#figure(
  include "/figures/wg-rect-dims.typ",
  caption: [The rectangular wave guide, with side lengths $a$ (along $x$)
    and $b$ (along $y$), propagating along $z$.],
) <fig:wg-rect-dims>

Let's look at TE waves, i.e. $E_z = 0$. We are then left with solving
@eq:wg-helmholtz for $B_z$ alone,
$ [pdv(,x,2) + pdv(,y,2) + (omega/c)^2 - k^2] B_z = 0, $ <eq:wg-helmholtz-TE>
subject to the boundary conditions @eq:wg-bc. (We could just as well work
with TM modes.)

=== Separation of Variables

We proceed by *separation of variables* — very similar to how we solve the
1D or 3D Schrödinger equation in quantum mechanics. We make the ansatz
$ B_z (x,y) = X(x) Y(y). $ <eq:wg-separation-ansatz>
Plugging this into @eq:wg-helmholtz-TE:
$ Y pdv(X,x,2) + X pdv(Y,y,2) + [(omega/c)^2 - k^2] X Y = 0. $
Dividing by $X Y$:
$
  underbrace(1/X pdv(X,x,2), "only depends on" x) + underbrace(1/Y pdv(Y,y,2), "only depends on" y) + [(omega/c)^2 - k^2] = 0.
$ <eq:wg-separated>
Since the first term only depends on $x$ and the second only on $y$ (and
their sum, together with the constant third term, must vanish for *all*
$x,y$), a change in $x$ can never be compensated by a change in $y$ unless
both terms are themselves constant. Let's call these constants $-k_x^2$ and
$-k_y^2$:

#key-box[
  $ 1/X pdv(X,x,2) = -k_x^2, quad 1/Y pdv(Y,y,2) = -k_y^2, $ <eq:wg-ode>
]
so that, from @eq:wg-separated,
$ k_x^2 + k_y^2 + k^2 = (omega/c)^2. $ <eq:wg-k-relation>

The two equations of @eq:wg-ode are just harmonic oscillators, with solutions
$
  X(x) = A sin(k_x x) + B cos(k_x x), quad Y(y) = C sin(k_y y) + D cos(k_y y).
$ <eq:wg-XY>

=== Boundary Conditions and the $"TE"_(m n)$ Modes

Now we use the boundary condition $B^perp = 0$ (@eq:wg-bc) to fix
$A, B, C, D, k_x, k_y$, see @fig:wg-rect-bc.

#figure(
  include "/figures/wg-rect-bc.typ",
  caption: [The boundary condition $B^perp = 0$ applied to the walls
    $x=0$ and $x=a$ of the rectangular wave guide.],
) <fig:wg-rect-bc>

At the walls $x=0$ and $x=a$, the perpendicular
component of $vb(B)$ is $B_x$, so
$ 
 B_perp (x=0, y) &= B_perp (x=a, y) = 0. \
 <=> quad B_x (x=0, y) &= B_x (x=a, y) = 0.
$
$B_x$ is found from @eq:wg-transverse, with $E_z = 0$ (TE waves),
$ 
  B_x = i/((omega/c)^2-k^2) k pdv(B_z,x) = 0 , 
$
for $x = 0$ and $x = a$. 
From this, it follows that 
$
  pdv(B_z,x) (0,y) = pdv(B_z,x) (a,y) = 0.
$
So the condition $B_x = 0$ at $x=0,a$ is equivalent to
$
  pdv(X,x) (0) = pdv(X,x) (a) = 0.
$ <eq:wg-X-bc>
From @eq:wg-XY,
$ pdv(X,x) = A k_x cos(k_x x) - B k_x sin(k_x x). $
At $x=0$: 
$ pdv(X,x)(0) = A k_x cos(0) - B k_x sin(0) = A k_x = 0 => A = 0, $ 
assuming $k_x != 0$.
At $x=a$, with $A=0$ we have 
$ pdv(X,x)(a) = -B k_x sin(k_x a) = 0, $
so (for $B != 0$),
$ sin(k_x a) = 0 quad => quad k_x = (m pi)/a, quad m = 0, 1, 2, dots.h $ <eq:wg-kx>
and $X(x) = B cos(m pi x \/ a)$.

By the identical argument at $y=0, b$ (using $B_y = 0$ there), we find
$C = 0$ and
$ k_y = (n pi)/b, quad n = 0,1,2,dots.h $ <eq:wg-ky>
so that $Y(y) = D cos(n pi y \/ b)$.

Putting everything together, the full solution is

#key-box[
  $ B_z (x,y) = B_0 cos((m pi x)/a) cos((n pi y)/b) $ <eq:wg-TEmn>
  — the $"TE"_(m n)$ *mode*.
]
(By convention, the first index labels the larger dimension, $a >= b$, and
at least one of $m, n$ must be nonzero — else @eq:wg-TEmn is constant and
we recover the (impossible) TEM case.)

=== Dispersion Relation, Cutoff Frequency, and Wave Velocities

Plugging @eq:wg-kx and @eq:wg-ky into @eq:wg-k-relation and solving for
$k$ we obtain the *dispersion relation* for the $"TE"_(m n)$ mode:

#key-box[
  $
    k = 1/c sqrt(omega^2 - omega_(m n)^2), quad
    omega_(m n)^2 equiv underbrace(c^2 pi^2 [(m/a)^2 + (n/b)^2], = c^2 (k_x^2+k_y^2)).
  $ <eq:wg-dispersion>
]

#advanced-box(title: [An analogy with special relativity])[
  Compare @eq:wg-dispersion to the relativistic energy-momentum relation,
  $ E^2 = p^2 c^2 + m^2 c^4 quad <=> quad p = 1/c sqrt(E^2 - m^2 c^4). $
  With $omega <-> E\/hbar$ and $k <-> p\/hbar$, @eq:wg-dispersion has
  exactly this form, with $omega_(m n)$ playing the role of an *effective
  mass*!
]

If $omega < omega_(m n)$, $k$ becomes imaginary, and the fields are
exponentially attenuated rather than propagating — $omega_(m n)$ is called
the *cutoff frequency* of the $"TE"_(m n)$ mode. The lowest cutoff
frequency (for $a >= b$) is
$ omega_10 = (c pi)/a, $ <eq:wg-cutoff>
and waves with $omega < omega_10$ will not propagate down the guide at all,
regardless of mode.

The wave (phase) velocity is
$
  v = omega/k = c/sqrt(1 - (omega_(m n)\/omega)^2) > c.
$ <eq:wg-phase-velocity>
This exceeds $c$ — but that's fine, since it's not the speed at which
energy or information travels. That is instead the *group velocity*,
$
  v_g = (dv(k, omega))^(-1) = c sqrt(1 - (omega_(m n)\/omega)^2) < c.
$ <eq:wg-group-velocity>
Note that $v dot v_g = c^2$.

== Outlook

This concludes our discussion of electromagnetic waves. We have seen how
EM waves are reflected and transmitted at the boundary of linear
dielectrics and conductors, studied the frequency dependence of the
dielectric constant in dispersive media, and seen how waves propagate in
hollow wave guides.

The formalism we developed here can also be used to study:
- *Coaxial lines*, which (unlike a hollow wave guide) also allow for TEM
  modes — see Griffiths Ch. 9.5.3. and the problem set 6. 
- *Resonant cavities*, obtained by closing off a wave guide with a
  conducting cap at both ends (Griffiths Problem 9.40 and problem set 7).

#block(breakable: false)[
  #supplement-box(title: [Resonant cavities and axion dark matter])[
    Resonant cavities are a key tool in the search for *axion dark matter*
    (recall the discussion in Chapter 2): if axions exist and constitute dark
    matter, they would source a tiny oscillating electric current in the
    presence of a strong magnetic field. Tuning a resonant cavity to match
    the (unknown) axion oscillation frequency can resonantly enhance this
    tiny signal — the basis of experiments like ADMX, and work being done
    here at SDU.
  ]
]
