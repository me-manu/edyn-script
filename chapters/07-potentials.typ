// Chapter 7: Potential Formulation of Electrodynamics
// Based on Lecture 7 — Griffiths Ch. 10.1 & 10.2
#import "/lib.typ": *

= Potential Formulation of Electrodynamics

#text(fill: gray)[_Literature: Griffiths Ch. 10.1 & 10.2_]

After electromagnetic waves, we are going to switch gears now. We will discuss
*potentials*: the potential formulation underlies all of modern field theory
(quantum field theory, used to describe all known elementary particles and
their interactions).
The potential formulation in electrodynamics is also very useful to describe
radiation of accelerating charges, as we will see later in the lecture. 

We will for now work in non-relativistic notation
(3-vectors), but later realize that we can rewrite everything very compactly
using relativistic 4-vector notation.

#exercise-box[
  How are the electric and magnetic fields derived from potentials in the
  electrostatic case?
]

Why should we bother rewriting Maxwell's equations with potentials? In the
static case, for given charge and current densities, $vb(E)$ and $vb(B)$ are
determined from Coulomb's and Biot–Savart's laws. Not anymore in
electrodynamics — but we can find generalizations working with potentials.

== The Vector and Scalar Potentials

#supplement-box(title: [Reminder: Coulomb's and Biot–Savart's laws])[

  *1.* Coulomb's law: the force experienced by a test charge $Q$ from charges
  $q_i$ at rest,
  $
    vb(F) = Q dot vb(E)(vb(r)), quad
    vb(E)(vb(r)) = 1/(4 pi epsilon_0) sum_(i=1)^N q_i (vb(r) - vb(r)_i)/(abs(vb(r) - vb(r)_i)^3),
  $ <eq:pot-coulomb-law>
  where $vb(r)_i$ is the position of charge $q_i$.

  *2.* The Biot–Savart law determines the magnetic field of a steady (i.e.
  constant in time) line current $I$,
  $
    vb(B)(vb(r)) = mu_0/(4 pi) I integral dd(vb(l)') times (vb(r) - vb(r)')/abs(vb(r) - vb(r)')^3,
  $ <eq:pot-biot-savart>
  where primed coordinates are the source region.
]

#exercise-box[
  Why don't Coulomb's and Biot–Savart's laws hold any
  longer in electrodynamics?
]

Coulomb's and Biot–Savart's laws silently assume *instant action at a
distance*: the field "right now" is computed from the charges and currents
"right now," with no time delay, no matter how far away the source is. This
is fine in statics, since nothing is changing anyway, but once charges and
currents move and change in time, it clashes with a basic fact of nature: no
information can travel faster than the speed of light. If a charge jiggles
on the far side of the room, we cannot possibly feel it instantaneously —
the "news" first has to reach us, and that takes time.
(Compare: we don't
see what the Sun is doing *right now*, but what it was doing 8 minutes ago, which is 
the time light takes to reach us.)
We will make this precise with the
*retarded time* later in this chapter (@eq:pot-retarded-time), which fixes
exactly this gap.

Let's start by rewriting Maxwell's equations @eq:maxwell in terms of
potentials. We start with (ii), $div vb(B) = 0$.

Just as in the electrostatic case, this equation can be automatically
fulfilled by a vector field $vb(A)$ for which

#key-box[
  $ vb(B) = curl vb(A), $ <eq:pot-B-from-A>
]
since the divergence of a curl is always zero. We call $vb(A)$ the *vector
potential*.

With this, Faraday's law (iii) becomes
$
  curl vb(E) = -pdv(,t) (curl vb(A))
  quad => quad
  curl (vb(E) + pdv(vb(A), t)) = vb(0).
$

In the parentheses $(dots.h)$ we have a vector field for which the curl vanishes.
Such a vector field can always be written as the
gradient of a scalar function (see tutorial 1). 
Let's call it $V(vb(r), t)$, the *scalar potential*.

So $vb(E) + pdv(vb(A), t) = -grad V$, i.e.

#key-box[
  $ vb(E) = -grad V - pdv(vb(A), t). $ <eq:pot-E-from-V-A>
]

What about the other two Maxwell equations, (i) and (iv)? Let's check
explicitly.

From Gauss's law, $div vb(E) = rho \/ epsilon_0$:
$
  rho/epsilon_0 &= div (-grad V - pdv(vb(A), t)) \
  &= -nabla^2 V - pdv(,t) (div vb(A)) 
$
So we find 
#key-box[
  $
    nabla^2 V + pdv(,t) (div vb(A)) = -rho/epsilon_0,
  $ <eq:pot-poisson-general>
]
which is the generalization of the Poisson equation $nabla^2 V = -rho \/ epsilon_0$
of electrostatics.

Lastly, let's check (iv), Ampère's law with Maxwell's addition. Using
@eq:pot-B-from-A and @eq:pot-E-from-V-A,
$
  curl (curl vb(A)) &= mu_0 vb(J) + mu_0 epsilon_0 pdv(,t) (-grad V - pdv(vb(A), t)) \
  &= mu_0 vb(J) + 1/c^2 (-pdv(vb(A), t, 2) - grad pdv(V, t)),
$
where we used $mu_0 epsilon_0 = 1 \/ c^2$. For the left-hand side we use the
curl-of-a-curl identity from @sec:curl-curl,
$ curl (curl vb(A)) = grad (div vb(A)) - nabla^2 vb(A). $
Collecting all terms including potentials on the right-hand side,

#key-box[
  $
    nabla^2 vb(A) - 1/c^2 pdv(vb(A), t, 2) - grad (div vb(A) + 1/c^2 pdv(V, t)) = -mu_0 vb(J).
  $ <eq:pot-A-wave-general>
]

#supplement-box(title: [The d'Alembert operator])[
  Remember the d'Alembert operator (or "box" operator),
  $ square equiv nabla^2 - 1/c^2 pdv(,t,2), $ <eq:pot-dalembert>
  so that the first two terms of @eq:pot-A-wave-general combine into
  $square vb(A)$.
]

@eq:pot-poisson-general and @eq:pot-A-wave-general together contain *all* of
Maxwell's equations.

#exercise-box[
  How many equations are these (counting components)?
]

@eq:pot-poisson-general and @eq:pot-A-wave-general certainly don't look nice,
but once $vb(A)$ and $V$ are determined, we can calculate the fields
$vb(E)$ and $vb(B)$ from @eq:pot-B-from-A and @eq:pot-E-from-V-A.

== Gauge Freedom

We have some *freedom* in the choice of $vb(A)$ and $V$, because
for a physical system with given $vb(E)$ and $vb(B)$, several different
$vb(A)$ and $V$ yield the *same* field configurations $vb(E)$ and $vb(B)$.


This is the case because the equations for $vb(E)$ and $vb(B)$,
@eq:pot-B-from-A and @eq:pot-E-from-V-A, don't uniquely determine $vb(A)$
and $V$. We can impose some extra conditions on $vb(A)$ and $V$ without
changing the physical fields $vb(E)$ and $vb(B)$.

This freedom is called *gauge freedom* (pronounced "gauge" as in "cage"), and
can be used to greatly simplify @eq:pot-poisson-general and
@eq:pot-A-wave-general. This means that we can change $vb(A)$ and $V$ by
so-called *gauge transformations* without changing $vb(E)$ and $vb(B)$.

#supplement-box(title: [Gauge freedom and the standard model])[
  The idea of gauge freedom is a key building block of the standard model of
  particle physics.
]

Let's see how this works exactly. Given two vector potentials $vb(A)$ and
$vb(A)'$, what's their connection to yield the same $vb(B)$ field?

Take $vb(A)' = vb(A) + vb(alpha)$. What's the condition on $vb(alpha)$?
Taking the curl,
$ curl vb(A)' = curl vb(A) + curl vb(alpha), $
tells us that we need $curl vb(alpha) = vb(0)$ in order for $vb(B)$ to remain
unchanged. This is true if $vb(alpha)$ can be written as a gradient of a
scalar function,
$ vb(alpha) = grad lambda, quad "so that" quad vb(A)' = vb(A) + grad lambda. $

By demanding that $vb(E)$ is unchanged, we can find the allowed gauge
transformation for the scalar potential, $V' = V + beta$:
$
  vb(E) = -pdv(vb(A)', t) - grad V'
  = underbrace(-pdv(vb(A), t) - grad V, = vb(E)) - grad (pdv(lambda, t) + beta).
$
So that $vb(E)$ is unchanged, we need $grad (pdv(lambda, t) + beta) = vb(0)$,
i.e.
$ beta = -pdv(lambda, t)(vb(r), t) + k(t) $
— it is possible to add some function that only depends on time, such that
$grad k(t) = vb(0)$. But we can just absorb $k(t)$ into $lambda(vb(r), t)$.

So the allowed gauge transformations are given by

#key-box[
  $
    vb(A)' = vb(A) + grad lambda, quad V' = V - pdv(lambda, t),
  $ <eq:pot-gauge-transform>
]
which do not change the physical fields $vb(E), vb(B)$.

== Choice of Gauge

A *gauge condition* is a set of conditions imposed on $vb(A)$ or $lambda$
which fixes (i.e. removes) the gauge freedom. One picks one representative
from the many gauge-equivalent configurations that all encode the same
physics, i.e. the same $vb(E)$ and $vb(B)$, as illustrated in
@fig:pot-gauge-orbit.

#figure(
  include "/figures/pot-gauge-orbit.typ",
  caption: [
    A gauge condition selects one representative $(vb(A), V)$ from the gauge
    orbit — the set of all potentials that describe the same physical fields
    $vb(E)$ and $vb(B)$.
  ],
) <fig:pot-gauge-orbit>

Let's discuss two popular examples of gauge conditions.

=== Coulomb Gauge

In the *Coulomb gauge*, we pick
#key-box[
  $ div vb(A) = 0. $ <eq:pot-coulomb-gauge>
]
Plugging this into @eq:pot-poisson-general and @eq:pot-A-wave-general, we
recover the Poisson equation from @eq:pot-poisson-general,
$ nabla^2 V = -rho/epsilon_0, $ <eq:pot-coulomb-gauge-V>
which we can solve directly using the Green's function method (see the
tutorial and the next lecture),
$ V(vb(r), t) = 1/(4 pi epsilon_0) integral_V rho(vb(r)', t)/abs(vb(r) - vb(r)') dd(V'). $ <eq:pot-coulomb-gauge-V-sol>

Two comments:

+ This is an example of how we can choose a gauge condition to simplify
  Maxwell's equations — at least @eq:pot-poisson-general.
  @eq:pot-A-wave-general still looks pretty daunting,
  $
    square vb(A) - 1/c^2 grad pdv(V, t) = -mu_0 vb(J),
  $
  which is one of the disadvantages of the Coulomb gauge.

  Note: 
  A gauge condition is not just *any* condition on $vb(A)$ and $V$ —
  $vb(E)$ and $vb(B)$ must remain unchanged. For example,
  $ pdv(V, x) + pdv(,t) A_x = 0 $
  is in general *not* an allowed gauge condition, as it would imply
  $E_x = 0$, which does not describe the most general physical
  configuration. (More on this in the tutorial.)

+ The solution @eq:pot-coulomb-gauge-V-sol implies that if we change the
  charge distribution, then the potential changes *immediately everywhere*
  (e.g. the potential on the Moon changes immediately when we change $rho$ in
  our lab in the basement), even for $abs(vb(r) - vb(r)') >> 0$.

  This seems at odds with special relativity, which states that nothing can
  travel faster than the speed of light. The point is: $V$ is not a physical
  quantity we can measure — $vb(E)$ is, and it depends on both $grad V$ and
  $pdv(vb(A), t)$ (@eq:pot-E-from-V-A). $vb(E)$ will only change after
  some time has passed. If $V$ were a physical quantity, this would enable
  faster-than-light communication.

=== Lorenz Gauge

#supplement-box(title: [A note on terminology])[
  "Lorenz gauge" $eq.not$ "Lorentz transformation" — these are two different
  scientists, a Dane (Ludvig Lorenz) and a Dutchman (Hendrik Lorentz).
]

In this gauge, we pick
#key-box[
  $ div vb(A) = -1/c^2 pdv(V, t), $ <eq:pot-lorenz-gauge>
]
which is a scalar condition. What happens to the differential equations for
$V$ and $vb(A)$, @eq:pot-poisson-general and @eq:pot-A-wave-general?

From @eq:pot-poisson-general we see that
$
  nabla^2 V + pdv(,t) (-1/c^2 pdv(V,t)) = nabla^2 V - 1/c^2 pdv(V,t,2) = square V = -rho/epsilon_0,
$
which is a wave equation for $V$ with a source term.

#exercise-box[
  What happens to @eq:pot-A-wave-general?
]

For @eq:pot-A-wave-general we find that the gradient term on the left-hand
side disappears (by @eq:pot-lorenz-gauge), and we're left with
$ nabla^2 vb(A) - 1/c^2 pdv(vb(A), t, 2) = square vb(A) = -mu_0 vb(J), $
which is also a wave equation with a source term. Thus, in Lorenz gauge we
have

#key-box[
  $ square V = -rho/epsilon_0, quad square vb(A) = -mu_0 vb(J). $ <eq:pot-lorenz-wave-eqs>
]

#supplement-box(title: [A hint of relativity])[
  This already suggests that we can use 4-vectors with $(V\/c, vb(A))$ and
  $(rho c, vb(J))$ — see a future lecture on the relativistic formulation of
  electrodynamics.
]

In Lorenz gauge, we can most easily achieve the main goal of electrodynamics:
find the field configurations for a given distribution of charges and
currents. We do this by solving @eq:pot-lorenz-wave-eqs for $V$ and $vb(A)$,
and then get the fields from @eq:pot-B-from-A and @eq:pot-E-from-V-A.

== Retarded Potentials

In the static case, @eq:pot-lorenz-wave-eqs reduce to
$ nabla^2 V = -rho/epsilon_0, quad nabla^2 vb(A) = -mu_0 vb(J), $
which are solved with the Green's function method (see the tutorial and the
math interlude next lecture),
$
  V(vb(r)) &= 1/(4 pi epsilon_0) integral_V rho(vb(r)')/abs(vb(r)-vb(r)') dd(V'),\ 
  vb(A)(vb(r)) &= mu_0/(4 pi) integral_V (vb(J)(vb(r)'))/abs(vb(r)-vb(r)') dd(V').
$ <eq:pot-static-sol>

How does this generalize to the non-static case and make the solution
time-dependent?

We know that a disturbance in the electromagnetic field travels at the speed
of light, as this is the velocity of the EM waves. So, it's not the status of
the source *right now* at time $t$ that matters, but rather the state the
source was in at the time when the emission was sent out by the source, at
time $t_r$. $t_r$ is called the *retarded time*,

#key-box[
  $
    t_r = t - mark(abs(vb(r) - vb(r)') / c, tag: #<pot-rettime-term>).
  $ <eq:pot-retarded-time>
]

#{
  import "/lib.typ": cetz
  annot-cetz(
    <pot-rettime-term>,
    cetz,
    {
      import cetz.draw: *
      content(
        (rel: (0, -1.0), to: "pot-rettime-term.south"),
        anchor: "north",
        name: "pot-rettime-label",
        box(width: 7cm)[
          #set align(center)
          #set text(size: 9pt, fill: rgb("#2980b9"))
          time it takes for the emission to travel from source at $vb(r)'$ to
          observer at $vb(r)$
        ],
      )
      line("pot-rettime-label.north", "pot-rettime-term.south",
        stroke: 0.6pt + rgb("#2980b9"), mark: (end: ">", fill: rgb("#2980b9"), size: 0.15))
    },
  )
}
#v(1.8em)

Here, $t$ is the time now, when the emission is observed, and $vb(r)$ ($vb(r)'$)
is the observer's (source's) position.

@fig:pot-retarded-triangle illustrates this for two different source points:
a signal that reaches the observer at $vb(r)$ at time $t$ from two different
source points $vb(r)'_1$ and $vb(r)'_2$ must have been emitted at two
different retarded times $t_(r,1)$ and $t_(r,2)$.

#figure(
  include "/figures/pot-retarded-triangle.typ",
  caption: [
    A signal measured at the observer's position $vb(r)$ at time $t$, coming
    from two different source points $vb(r)'_1$ and $vb(r)'_2$, must have
    been emitted at different retarded times: since
    $abs(vb(r) - vb(r)'_2) > abs(vb(r) - vb(r)'_1)$, the signal from
    $vb(r)'_2$ was emitted earlier, $t_(r,2) < t_(r,1)$.
  ],
) <fig:pot-retarded-triangle>

#exercise-box[
  Do you understand this concept? Discuss with your neighbor.
]

Thus, the natural generalization of @eq:pot-static-sol that we could guess is

#key-box[
  $
    V(vb(r), t) = 1/(4 pi epsilon_0) integral_V rho(vb(r)', t_r (abs(vb(r)-vb(r)'))) / abs(vb(r)-vb(r)') dd(V'), \
    vb(A)(vb(r), t) = mu_0/(4 pi) integral_V (vb(J)(vb(r)', t_r (abs(vb(r)-vb(r)')))) / abs(vb(r)-vb(r)') dd(V').
  $ <eq:pot-retarded-potentials>
]
Note that $t_r$ depends on the source point $vb(r)'$ being integrated over.

These are called *retarded potentials*, which reduce to the correct static
solutions @eq:pot-static-sol in the static case.

=== Verifying the Retarded Potentials

These seem plausible, but we just guessed them. We need to make sure that
they fulfill Maxwell's equations and the Lorenz gauge condition.

Let's check this explicitly for the scalar potential. The calculation will
be the same for each component of the vector potential.

We'll need to compute $nabla^2 V$, which involves $nabla^2 (1 \/ abs(vb(R)))$,
where we introduce the shorthand
$
  vb(R) &equiv vb(r) - vb(r)' = (x-x', y-y', z-z'), \
  abs(vb(R)) &= [(x-x')^2 + (y-y')^2 + (z-z')^2]^(1\/2).
$
All gradients below are derivatives with respect to the *unprimed*
coordinate $vb(r)$ (the observer's position).

We will need a few identities (see also Griffiths Example 1.3 and Problem
1.13 — try to calculate these yourself, at least (i) and (iii) should be straight forward!):

#key-box[
  $
    "(i)" & quad grad 1/abs(vb(R)) = -vu(R)/abs(vb(R))^2 = -vb(R)/abs(vb(R))^3, \
    "(ii)" & quad nabla^2 (1 / abs(vb(R))) = div (grad 1 / abs(vb(R))) = div (-vu(R)/abs(vb(R))^2) \
    & quad = 4 pi delta^((3))(vb(r) - vb(r)') quad "(see next lecture)," \
    "(iii)" & quad grad abs(vb(R)) = vu(R), \
    "(iv)" & quad div (vu(R)/abs(vb(R))) = 1/abs(vb(R))^2.
  $ <eq:pot-identities>
]

#supplement-box(title: [Deriving identity (iv)])[
  In Cartesian coordinates, using (iii),
  #[
    #set math.equation(numbering: none)
    $
      div (vu(R)/abs(vb(R))) &= div (vb(R)/abs(vb(R))^2)
      = pdv(,x) ((x-x')/abs(vb(R))^2) + pdv(,y) dots.h \
      &=1/abs(vb(R))^2 + (x-x') pdv(,x)1/((x-x')^2 + (y-y')^2 + (z-z')^2) + pdv(,y) dots.h \
      &=1/abs(vb(R))^2 - (x-x') (2(x-x'))/((x-x')^2 + (y-y')^2 + (z-z')^2)^2 + pdv(,y) dots.h \
      &= 1/abs(vb(R))^2 - (x-x') (2(x-x'))/abs(vb(R))^4 + dots.h
    $
  ]
  and summing the three (one from each of $partial_x, partial_y, partial_z$),
  $
    div (vu(R)/abs(vb(R))) = 3/abs(vb(R))^2 - vb(R) dot (2 vb(R))/abs(vb(R))^4 = 3/abs(vb(R))^2 - 2/abs(vb(R))^2 = 1/abs(vb(R))^2. quad checkmark
  $
]

Combining the chain rule with $t_r = t - abs(vb(R))\/c$ (@eq:pot-retarded-time)
and identity (iii), we also need

#key-box[
  $
    "(v)" quad grad rho(vb(r)', t_r) = dot(rho) grad t_r = -1/c dot(rho) grad abs(vb(R)) = -1/c dot(rho) vu(R),
  $ <eq:pot-identity-v>
]
where the gradient only acts on $vb(r)$ in the retarded time (not on
$vb(r)'$), and $dot(rho) equiv partial rho \/ partial t_r = partial rho \/ partial t$
(since $partial t_r \/ partial t = 1$).

Equipped with these results, we now tackle $nabla^2 V = div (grad V)$.
Let's start with
$
  grad V &= 1/(4 pi epsilon_0) integral_V dd(V') grad (rho(vb(r)', t_r)/abs(vb(R))) \
  &= 1/(4 pi epsilon_0) integral_V dd(V') (1/abs(vb(R)) grad rho + rho grad 1/abs(vb(R))).
$
Using (v) and (i) from @eq:pot-identities and @eq:pot-identity-v, we find
$
  grad V = 1/(4 pi epsilon_0) integral_V dd(V') [-dot(rho)/c vu(R)/abs(vb(R)) - rho vu(R)/abs(vb(R))^2].
$
So that
$
 nabla^2 V = 1/(4 pi epsilon_0) integral_V dd(V') [underbrace(div (-dot(rho)/c vu(R)/abs(vb(R))), "term I") + underbrace(div (-rho vu(R)/abs(vb(R))^2), "term II")].
$

Using the product rule $div (f vb(A)) = f (div vb(A)) + vb(A) dot (grad f)$ term I becomes:

$
  "I" = -1/c [vu(R)/abs(vb(R)) dot grad dot(rho) + dot(rho) div (vu(R)/abs(vb(R)))].
$
Using (v) (applied to $dot(rho)$) and (iv),
$
  "I" = -1/c [vu(R)/abs(vb(R)) dot underbrace((-1/c dot.double(rho) vu(R)), "using (v)") + underbrace(dot(rho)/abs(vb(R))^2,"using (iv)")]
  = dot.double(rho)/(c^2 abs(vb(R))) - #text(fill: rgb("#8e44ad"))[$dot(rho)/(c abs(vb(R))^2)$],
$
where in the last step we used $vu(R) dot vu(R) = 1$ for the first term in the square brackets. Turning to the second term and using again the product rule, we have

$
  "II" = -[(grad rho) dot vu(R)/abs(vb(R))^2 + rho div (vu(R)/abs(vb(R))^2)].
$
Using (v) and (ii) this simplifies to
$
  "II" = -[underbrace((-1/c dot(rho) vu(R)), "using (v)") dot vu(R)/abs(vb(R))^2 + rho dot underbrace(4 pi delta^((3))(vb(R)), "using (ii)")]
  = #text(fill: rgb("#8e44ad"))[$dot(rho)/(c abs(vb(R))^2)$] - 4 pi rho delta^((3))(vb(R)).
$

Adding I and II, the $dot(rho) \/ (c abs(vb(R))^2)$ term in I and the
$-dot(rho) \/ (c abs(vb(R))^2)$ term in II #text(fill: rgb("#8e44ad"))[marked in pink
] cancel exactly, leaving
$ "I" + "II" = dot.double(rho)/(c^2 abs(vb(R))) - 4 pi rho delta^((3))(vb(R)). $

Collecting results we find
$
  nabla^2 V &= 1/(4 pi epsilon_0) integral_V dd(V') [dot.double(rho)/(c^2 abs(vb(R))) - 4 pi rho delta^((3))(vb(R))] \
  &= underbrace(1/c^2 pdv(,t,2) (1/(4 pi epsilon_0) integral_V dd(V') rho/abs(vb(R))), = 1/c^2 pdv(V,t,2)) - rho(vb(r),t)/epsilon_0,
$
where in the first term we pulled $1\/c^2 partial_t^2$ out of the integral
(the $t$-derivatives act only on the retarded time dependence, so they
commute with $integral_V dd(V')$), and in the second term the delta function
collapses the integral, setting $vb(r)' = vb(r)$. Hence

#result-box[
  $ nabla^2 V - 1/c^2 pdv(V, t, 2) = -rho/epsilon_0. $ <eq:pot-verified-V>
]

Thus, we have shown that indeed our guess @eq:pot-retarded-potentials
satisfies the differential equation for the scalar potential in Lorenz gauge,
@eq:pot-lorenz-wave-eqs. Similarly, one can show the same for the vector
potential, component by component.

For some charge and current distribution, we can now perform the integrals
in Lorenz gauge, @eq:pot-retarded-potentials, to find $V$, $vb(A)$, and from
them the $vb(E)$ and $vb(B)$ fields.

#supplement-box(title: [Comment: advanced potentials and causality])[
  Electrodynamics is invariant under time reversal. Therefore, the *advanced
  potentials*, defined by the *advanced time*
  $ t_a = t + abs(vb(r) - vb(r)')/c, $
  are also a possible solution to Maxwell's equations (you will check this in
  the exercises). However, in this case the potentials would be determined by
  charge and current distributions *in the future*.

  We reject this solution — which arises because the d'Alembertian
  @eq:pot-dalembert is time-symmetric — on the basis of *causality*.
]
