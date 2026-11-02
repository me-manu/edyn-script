// Chapter 8: Liénard–Wiechert Potentials
// Based on Lecture 8 — Griffiths Ch. 10.3.1 & 10.3.2, David Tong's lecture notes
#import "/lib.typ": *

= Liénard–Wiechert Potentials

#text(fill: gray)[_Literature: Griffiths Ch. 10.3.1 & 10.3.2, David Tong's lecture notes_]

Last lecture (and also in the Green's function interlude below) we saw that
the solutions to the potentials in Lorenz gauge are

#key-box[
  $
    V(vb(r), t) &= 1/(4 pi epsilon_0) integral_V (rho(vb(r)', t_r (abs(vb(r)-vb(r)')))) / abs(vb(r)-vb(r)') dd(V'), \
    vb(A)(vb(r), t) &= mu_0/(4 pi) integral_V (vb(J)(vb(r)', t_r (abs(vb(r)-vb(r)')))) / abs(vb(r)-vb(r)') dd(V'),
  $ <eq:lw-retarded-recap>
]
with the retarded time $t_r = t - abs(vb(r)-vb(r)')\/c$ (@eq:pot-retarded-time).

In this lecture, we first fill in a gap from last time: we derive the
Green's function for the d'Alembert operator that we used to justify
@eq:lw-retarded-recap, as a mathematical interlude. Then we specialize to the
case of a point charge $q$ whose position at time $t$ is determined by some
path $vb(w)(t)$. We will see that in this case, the potentials are given by
the *Liénard–Wiechert potentials*. These potentials are regularly used in
high-energy (astro-)particle physics to derive the radiation emitted by
point charges — we will look at this in more detail next lecture.

== Mathematical Interlude: Green's Functions

Let's review the Green's function method in 1D, and then apply it to our
situation.

Consider the following differential equation (e.g. the Poisson equation
$nabla^2 V = -rho \/ epsilon_0$, in 1D),

#key-box[
  $ dv(f, x, 2) = s(x). $ <eq:gf-1d-eq>
]
Given the *Green's function* $G(x, x')$ for the differential operator
$dv(,x,2)$, i.e. a function that satisfies
$ dv(,x,2) G(x,x') = delta(x-x'), $ <eq:gf-1d-def>
the solution to @eq:gf-1d-eq is
$ f(x) = integral_(-infinity)^(infinity) dd(x') G(x,x') s(x'). $ <eq:gf-1d-sol>
Thus, the Green's function allows us to turn a *differential* equation into
an *integral* equation.

#exercise-box[
  Check yourself: show that @eq:gf-1d-sol is a solution to @eq:gf-1d-eq.
]

Indeed,
$
  dv(f,x,2) = integral dd(x') underbrace(dv(,x,2) G(x,x'), = delta(x-x') "by definition") s(x')
  = integral dd(x') delta(x-x') s(x') = s(x),
$
where we could move the second derivative into the integral, since it acts
only on $x$, not on the integration variable $x'$.

=== Green's Function for the Laplacian

Now let's check if this is also true in 3D, for the Poisson equation of
electrostatics, $nabla^2 V(vb(r)) = -rho(vb(r))\/epsilon_0$. For the Green's
function that satisfies
$ nabla^2 G(vb(r), vb(r)') = delta^((3))(vb(r)-vb(r)'), $ <eq:gf-3d-def>
we have, in complete analogy with @eq:gf-1d-sol,
$ V(vb(r)) = -1/epsilon_0 integral_V dd(V') G(vb(r), vb(r)') rho(vb(r)'). $ <eq:gf-3d-sol>
Plugging in,
$
  nabla^2 V(vb(r)) &= -1/epsilon_0 integral_V dd(V') underbrace(nabla^2 G(vb(r), vb(r)'), = delta^((3))(vb(r)-vb(r)')) rho(vb(r)') \
  &= -1/epsilon_0 integral_V dd(V') delta^((3))(vb(r)-vb(r)') rho(vb(r)') = -rho(vb(r))/epsilon_0. quad checkmark
$

This all looks fine, but in order for the Green's function to be useful, we
need to know what it *is*. We will prove now that the Green's function for
the Laplacian operator is given by

#key-box[
  $ G(vb(r), vb(r)') = -1/(4 pi) 1/abs(vb(r)-vb(r)'). $ <eq:gf-laplacian>
]
What we need to calculate is $nabla^2 (1\/abs(vb(R)))$ (recall
$vb(R) equiv vb(r) - vb(r)'$, as in the previous chapter), but we have to
take care when $vb(r) = vb(r)'$.

*Case I: $vb(r) != vb(r)'$.* Using identity (i) from @eq:pot-identities,
$
  nabla^2 1/abs(vb(R)) = div (grad 1/abs(vb(R))) = div (-vb(R)/abs(vb(R))^3).
$
Let's calculate the $z$-component (the $x$- and $y$-components work the same
way):
$
  pdv(,z) [-(z-z')/abs(vb(R))^3]
  &= -1/abs(vb(R))^3 - (z-z') pdv(,z) 1/abs(vb(R))^3 \
  &= -1/abs(vb(R))^3 + (z-z') (3(z-z'))/abs(vb(R))^5
  = -1/abs(vb(R))^3 + 3(z-z')^2/abs(vb(R))^5,
$
using the product rule and the chain rule (feel encouraged to check this yourself if in doubt). Summing the three (one from each
of $partial_x, partial_y, partial_z$),
$
  nabla^2 1/abs(vb(R)) &= -3/abs(vb(R))^3 + 3 ((x-x')^2+(y-y')^2+(z-z')^2)/abs(vb(R))^5 \
  &= -3/abs(vb(R))^3 + 3/abs(vb(R))^3 = 0.
$

*Case II: $vb(r) = vb(r)'$.* Here $1\/abs(vb(R))$ is divergent, and thus
$nabla^2 (1\/abs(vb(R)))$ diverges too. We therefore guess that it should be
proportional to $delta^((3))(vb(r)-vb(r)')$, because the delta function has
exactly the property of being zero everywhere except where its argument is
zero, where it diverges.

To determine the constant of proportionality $C$, we write
$ integral_V dd(V) nabla^2 1/abs(vb(R)) &= 
integral_V dd(V) div (grad 1/abs(vb(R))) \
&= C integral_V dd(V) delta^((3))(vb(r)-vb(r)') = C. $ <eq:gf-C-def>
Now use the divergence theorem to change the volume integral over a divergence to a surface integral and compute the gradient with relation (i) from @eq:pot-identities,
$ integral_V dd(V) div (grad 1/abs(vb(R))) = integral.cont_S (-vb(R)/abs(vb(R))^3) dot dd(vb(a)) = C. $
We integrate over a sphere of radius $abs(vb(R))$ around $vb(r)'$, with
$dd(vb(a)) = abs(vb(R))^2 vu(R) sin theta dd(theta) dd(phi)$:
$
  -integral_0^(2pi) dd(phi) integral_0^pi dd(theta) (-vu(R)/abs(vb(R))^2) dot (abs(vb(R))^2 vu(R) sin theta) \
  = -integral_0^(2pi) dd(phi) integral_0^pi sin theta dd(theta) = -4 pi = C,
$
using $vu(R) dot vu(R) = 1$. So $C = -4pi$, and

#result-box[
  $ nabla^2 1/abs(vb(r)-vb(r)') = -4 pi delta^((3))(vb(r)-vb(r)'). $ <eq:gf-laplacian-identity>
]
which is exactly @eq:gf-3d-def with $G(vb(r),vb(r)') = -1\/(4 pi abs(vb(r)-vb(r)'))$
— confirming @eq:gf-laplacian.

#supplement-box(title: [Consistency with identity (ii)])[
  Since $grad (1\/abs(vb(R))) = -vu(R)\/abs(vb(R))^2$ (identity (i) in
  @eq:pot-identities), @eq:gf-laplacian-identity is equivalent to
  $ div (vu(R)/abs(vb(R))^2) = -nabla^2 1/abs(vb(R)) = 4 pi delta^((3))(vb(r)-vb(r)'), $
  which is exactly identity (ii) in @eq:pot-identities from last lecture,
  which we had deferred to "next lecture" — now proven!
]

=== Green's Function for the d'Alembert Operator

For the retarded potentials in Lorenz gauge, we have a similar problem, but
instead of the Laplacian, we need to find the Green's function of the
d'Alembert operator $square = nabla^2 - 1\/c^2 partial_t^2$ (@eq:pot-dalembert),
with
$ square G(vb(r), vb(r)'; t, t') = delta^((3))(vb(r)-vb(r)') delta(t-t'), $ <eq:gf-dalembert-def>
so that, for e.g. the scalar potential, we have
$ square V(vb(r), t) = -1/epsilon_0 integral_V dd(V') integral dd(t') G(vb(r),vb(r)';t,t') rho(vb(r)',t'). $ <eq:gf-dalembert-sol>

From what we know from the $nabla^2 V$ case and the retarded time
$t_r = t - abs(vb(r)-vb(r)')\/c$, we can guess the ansatz
$ G(vb(r),vb(r)';t,t') = f(t - abs(vb(r)-vb(r)')/c - t') / abs(vb(r)-vb(r)'), $
with a scalar function $f(q)$. One can show (see
#link("https://farside.ph.utexas.edu/teaching/em/lectures/node49.html")[Farside's lecture notes]
— you will also check this yourself in the exercises) that

#result-box[
  $
    G(vb(r),vb(r)';t,t') = -1/(4pi) 1/abs(vb(r)-vb(r)') delta(t - abs(vb(r)-vb(r)')/c - t').
  $ <eq:gf-dalembert>
]

Then we can perform the integral over $t'$, which gives us the result for
the potentials from last lecture: plugging @eq:gf-dalembert into
@eq:gf-dalembert-sol,
$
  V(vb(r),t) &= 1/(4 pi epsilon_0) integral_V dd(V') 1/abs(vb(r)-vb(r)')
    integral dd(t') delta(mark(t - abs(vb(r)-vb(r)')/c, tag: #<gf-tr-term>) - t') rho(vb(r)', t') \
  &= 1/(4 pi epsilon_0) integral_V dd(V') rho(vb(r)', t - abs(vb(r)-vb(r)')/c)/abs(vb(r)-vb(r)'),
$
with the delta function ensuring that we have to evaluate the charge (and current) distributions at the retarded time.
This reproduces exactly the retarded potential of @eq:lw-retarded-recap.

#{
  import "/lib.typ": cetz
  annot-cetz(
    <gf-tr-term>,
    cetz,
    {
      import cetz.draw: *
      content(
        (rel: (0, -0.8), to: "gf-tr-term.south"),
        anchor: "north",
        name: "gf-tr-label",
        text(size: 9pt, fill: rgb("#2980b9"))[$= t_r$],
      )
      line("gf-tr-label.north", "gf-tr-term.south",
        stroke: 0.6pt + rgb("#2980b9"), mark: (end: ">", fill: rgb("#2980b9"), size: 0.15))
    },
  )
}
#v(1.3em)

== Liénard–Wiechert Potentials of Point Charges

Let's apply our formalism to the case of a point charge $q$ whose position
at time $t$ is determined by some path $vb(w)(t)$, as illustrated in
@fig:lw-trajectory.

#figure(
  include "/figures/lw-trajectory.typ",
  caption: [
    A point charge moving along the trajectory $vb(w)(t)$. The field at the
    observer's position $vb(r)$ at time $t$ is determined by the charge's
    *retarded* position $vb(w)(t_r)$, not its current position.
  ],
) <fig:lw-trajectory>

The retarded time is given implicitly by

#key-box[
  $
    mark(abs(vb(r) - vb(w)(t_r)), tag: #<lw-dist>) = c thin mark((t - t_r), tag: #<lw-time>).
  $ <eq:lw-retarded-time-implicit>

  #{
    import "/lib.typ": cetz
    annot-cetz(
      (<lw-dist>, <lw-time>),
      cetz,
      {
        import cetz.draw: *
        cetz.decorations.flat-brace(
          "lw-dist.south-west", "lw-dist.south-east",
          flip: true, name: "dist-brace", stroke: rgb("#27ae60"),
        )
        content(
          (rel: (0, -0.5), to: "dist-brace.south"),
          anchor: "north", name: "dist-label",
          box(width: 1.7cm, align(center, text(size: 7.5pt, fill: rgb("#27ae60"))[distance "news" must travel $equiv abs(vb(R))$])),
        )
        cetz.decorations.flat-brace(
          "lw-time.south-west", "lw-time.south-east",
          flip: true, name: "time-brace", stroke: rgb("#27ae60"),
        )
        content(
          (rel: (0, -0.5), to: "time-brace.south"),
          anchor: "north", name: "time-label",
          box(width: 1.7cm, align(center, text(size: 7.5pt, fill: rgb("#27ae60"))[time it takes to make the trip])),
        )
      },
    )
  }
  #v(2.4em)
]

The potential is $V(vb(r),t) = 1\/(4 pi epsilon_0) integral_V rho(vb(r)',t_r) \/ abs(vb(r)-vb(r)') dd(V')$
(@eq:lw-retarded-recap). For a point charge, we would expect
$ rho(vb(r)', t_r) ~ q delta^((3))(vb(r)' - vb(w)(t_r)) $
and thus
$ V(vb(r),t) = 1/(4pi epsilon_0) q/abs(vb(r)-vb(w)(t_r)). $
*But this is wrong!* The denominator is fine, but the integral
$integral_V dd(V') rho(vb(r)',t_r) != q$, since the retarded time obliges us
to integrate over the charge distribution $rho$ at *different times*.

Instead, we can motivate

#key-box[
  $ integral_V rho(vb(r), t_r) dd(V') = q/(1 - vu(R) dot vb(v) \/ c), $ <eq:lw-geometric-factor>
]
where $vb(v)$ is the particle velocity at $t_r$. This is a purely
geometrical effect, and to understand it, consider a train of length $L$
moving with velocity $v$ towards the observer, @fig:lw-train.

#figure(
  image("/figures/doppler-train.pdf", width: 90%),
  caption: [
    Light emitted simultaneously from the engine and the last car (as
    received by the observer) was not emitted at the same time, since the
    light from the last car takes longer to arrive. As a consequence, the
    approaching train appears a bit longer: $L' > L$.
  ],
) <fig:lw-train>

The light we receive simultaneously from the last car and the engine wasn't
emitted at the same time, as it took a longer time for the light from the
last car to reach us. As a consequence, the approaching train will look a
bit longer: light from the last car travels $L'$ to reach the engine's
(later) position. During the time it takes the light to travel $L'$, the
train itself has moved by $L' - L$.
We can equate the light travel time $L'/c$ with the time it took the train 
to move by $L' - L$ to find an expression for $L'$:
$
  L'/c = (L'-L)/v
  quad => quad
  L' (1/v - 1/c) = L/v
  quad => quad
  L' (1 - v/c) = L \
  quad => quad
  L' = L/(1-v/c).
$
Note: this has *nothing* to do with Lorentz contraction — it's rather
reminiscent of the Doppler factor.

In general, the velocity $vb(v)$ will make an angle $theta$ to the line of
sight with the observer, in which case
$ L' = L/(1 - v/c cos theta), quad v/c cos theta = (vb(v) dot vu(R))/c. $
As the dimension perpendicular to the velocity of the train does not change,
a volume element of the train transforms as
$ dd(V') = dd(V)/(1 - vu(R) dot vb(v)\/c). $
Thus, whenever you have an integral of the type in @eq:lw-geometric-factor,
you pick up a factor $(1 - vu(R) dot vb(v)\/c)^(-1)$, and the final result
for the potential is

#key-box[
  $
    V(vb(r),t) = 1/(4 pi epsilon_0) 1/abs(vb(R)) q/(1 - vu(R) dot vb(v)\/c)
    = 1/(4 pi epsilon_0) (q c)/(abs(vb(R)) c - vb(R) dot vb(v)),
  $ <eq:lw-V-motivated>
]
with $vb(R) = vb(r) - vb(w)(t_r)$, all evaluated at $t_r$.

#exercise-box[
  Discuss with your neighbor: is this clear?
]

=== Formal Derivation

Let's derive this result more formally. For this (and also for the lectures
on radiation), we will follow parts of David Tong's lecture notes
(Ch. 6.4.1).

The potential at $(vb(r),t)$ for a point charge following the path
$vb(w)(t)$ is given by
$ V(vb(r),t) = q/(4 pi epsilon_0) integral_V dd(V') (delta^((3))(vb(r)' - vb(w)(t_r)))/abs(vb(r)-vb(r)'). $ <eq:lw-naive-integral>
This integral is cumbersome, since $vb(r)'$ appears in the delta function in
the obvious place, but also in $t_r = t - abs(vb(r)-vb(r)')\/c$.

The best way to handle this is to go a step back and use the Green's
function for the d'Alembert operator, @eq:gf-dalembert:
$
  V(vb(r),t) &= -1/epsilon_0 integral dd(t') integral_V dd(V') rho(vb(r)',t') G(vb(r),vb(r)';t,t') \
  &= q/(4 pi epsilon_0) integral dd(t') integral_V dd(V') (delta^((3))(vb(r)'-vb(w)(t')) delta(t_r(abs(vb(r)-vb(r)')) - t'))/abs(vb(r)-vb(r)').
$
Notice how $vb(w)$ now depends on the *integration* variable $t'$, and not
on the retarded time. Now we can simply carry out the integration over
$dd(V')$, which yields (plugging in the definition of $t_r$)
$ V = q/(4 pi epsilon_0) integral dd(t') (delta(t - abs(vb(r)-vb(w)(t'))\/c - t'))/abs(vb(r)-vb(w)(t')). $ <eq:lw-pre-substitution>

Now we still have the issue that $t'$ appears in two places in the argument
of the delta function, but it's more straightforward to deal with it. Let's
introduce the separation vector
$ vb(R)(t') = vb(r) - vb(w)(t'), $ <eq:lw-R-def>
and define a helper function
$ f(t') = t' + abs(vb(R)(t'))\/c, $
with
$
  dot(f)(t') = dv(f,t') = 1 + 1/c dv(,t') abs(vb(R)(t')).
$
You can show this explicitly with e.g. Cartesian coordinates and the chain
rule — here, we just use that $dd(,t')abs(vb(R)) = vu(R) dot dot(vb(R))$
(since $abs(vb(R)) = sqrt(vb(R) dot vb(R))$). With @eq:lw-R-def,
$ dot(vb(R))(t') = -dot(vb(w))(t') = -vb(v)(t'), $
so that
$ dot(f)(t') = 1 - 1/c vu(R) dot vb(v) = 1 - (vu(R)(t') dot vb(v)(t'))/c. $ <eq:lw-fdot>

Now we can solve the integral @eq:lw-pre-substitution by doing a
substitution, changing the variable of integration from $t'$ to $f$:
$
  V(vb(r),t) &= q/(4 pi epsilon_0) integral dd(t') 1/abs(vb(R)(t')) delta(t - f(t')) \
  &= q/(4 pi epsilon_0) integral dd(f) abs(dv(t',f)) 1/abs(vb(R)(t')) delta(t-f),
$
with the substitution Jacobian $abs(dd(t')\/dd(f)) = abs(dot(f)(t'))^(-1)$.
The delta function sets $f(t') = t$ — which, by the definition of $f$, is
exactly the implicit retarded-time condition @eq:lw-retarded-time-implicit,
i.e. $t' = t_r$:
$ V(vb(r),t) = q/(4 pi epsilon_0) [1/dot(f)(t') 1/abs(vb(R)(t'))]_(f(t')=t) = q/(4 pi epsilon_0) 1/(dot(f)(t_r) abs(vb(R)(t_r))). $
Plugging in @eq:lw-fdot,

#result-box[
  $
    V(vb(r),t) = q/(4 pi epsilon_0) c/(c abs(vb(R)(t_r)) - vb(R)(t_r) dot vb(v)(t_r)),
  $ <eq:lw-V-formal>
]
which is the same result that we found above in @eq:lw-V-motivated.

We can find the vector potential in exactly the same fashion, by using
$ vb(J)(vb(r),t) = q vb(v)(t) delta^((3))(vb(r) - vb(w)(t)), $
which gives us (from the definition of $vb(A)$, with $mu_0 = 1\/(epsilon_0 c^2)$)

#key-box[
  $
    vb(A)(vb(r),t) = (q mu_0)/(4 pi) (c vb(v)(t_r))/(c abs(vb(R)(t_r)) - vb(R)(t_r) dot vb(v)(t_r))
    = (vb(v)(t_r))/c^2 V(vb(r),t).
  $ <eq:lw-A>
]

Collecting @eq:lw-V-formal and @eq:lw-A, these are the *Liénard–Wiechert
potentials* for moving charges:

#key-box[
  $
    V(vb(r),t) = 1/(4 pi epsilon_0) (q c)/(c abs(vb(R)) - vb(R) dot vb(v)), quad
    vb(A)(vb(r),t) = vb(v)/c^2 V(vb(r),t),
  $ <eq:lw-potentials>
  with $vb(R) = vb(r) - vb(w)(t_r)$, $vb(v) = dot(vb(w))(t_r)$, all evaluated
  at the retarded time $t_r$.
]

From these, you can get the fields $vb(E)$ and $vb(B)$ of a moving point
charge in the usual way (@eq:pot-B-from-A, @eq:pot-E-from-V-A), see #text(fill: rgb("#008080"))[the slides for a summary].
We will look at this, and the radiation it produces, in more detail next lecture.

#supplement-box(title: [Note])[
  You might argue that we haven't actually one anything: the Liénard-Wiechert potentials still depend on $t_r$ through $vb(R)(t_r)$ and the velocity $vb(v)(t_r)$.
  To actually calculate the potentials, you have to specify 
  the particle trajectory $vb(w)(t)$ and then use the implicit relation $|vb(r) - vb(w)(t_r)| = c(t - t_r)$ to find an expression for $t_r$.
  The example of a particle at constant velocity, i.e., $vb(w)(t) = vb(v)t$ is worked out in Griffith's book, example 10.3.
]