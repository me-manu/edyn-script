// Chapter 2: Magnetic Fields in Matter
// Based on Lecture 2 — Griffiths Ch. 7.3 (cont'd) and Ch. 9
#import "/lib.typ": *

= Maxwell's Equations in Matter <sec:me-matter>
#text(fill: gray)[_Literature: Griffiths Ch. 7.3 (cont'd)_]

Maxwell's equations @eq:maxwell (i)–(iv) are also valid in the presence of matter. However, $rho$
and $vb(J)$ then include _all_ charges and currents, also those that are "bound" in
matter — over which we have no direct influence.

It is convenient to rewrite Maxwell's equations in terms of new fields $vb(D)$ and
$vb(H)$ that distinguish between _free_ charges and currents ($rho_f$, $vb(J)_f$)
that we can experimentally control, and _bound_ charges and currents ($rho_b$, $vb(J)_b$).

The bound charges $rho_b$ and currents $vb(J)_b$ are produced as $vb(E)$ and $vb(B)$
_polarize_ and _magnetize_ a medium (e.g. electrons and protons in a material get
slightly shifted against each other).

At the microscopic level, $vb(E)$ and $vb(B)$ are extremely complex: close to
particles, fields become extremely large; further away, closer to another particle,
the field might flip direction; at finite temperature, particles undergo thermal
fluctuations and fields change continuously.

We focus on the _macroscopic_ level — averaged over large enough regions such that
we are not affected by microscopic effects. This approach of finding relevant
information using an _effective_ (averaged) description instead of accounting for
all microscopic physics is ubiquitous in physics.

== Dielectrics and Polarization

#exercise-box[
  What happens inside matter when you apply an electric field? 
]
Answer: it depends on the material.

In a *conductor*, there are lots of free electrons. Any electric field is compensated
very fast, so $vb(E) = 0$ inside the conductor. (There will still be a current
when you hook up a battery, but inside the wire $vb(E) = 0$. We will look at
conductors later.)

In *dielectrics* (non-conducting materials), there are no free charge carriers —
electrons are bound in atoms. When you apply an electric field, the positions of
electrons (negatively charged) and nuclei (positively charged) shift (in which direction will the particles shift with respect to each other?), leading to
small _dipole moments_:
$ vb(p) = q dot vb(d) = alpha dot vb(E) $
where $alpha$ is the _polarizability_ (a scalar or tensor).

Molecules like water that already have a dipole moment will experience a torque and
align with the $vb(E)$ field.

The result: lots of dipoles pointing along $vb(E)$ — the material gets _polarized_.
A convenient measure is the *polarization*:

#key-box[
  #align(center)[
    $vb(P) =$ dipole moment per unit volume
  ]
]

=== Bound Charges

We can also understand polarization in terms of _bound charges_ or the bound charge density $rho_b$.

When the induced dipoles all align, the interior charges cancel in pairs, as depected in Figure @fig:bound. The net
effect is a surface charge — what we call _bound charge_.

#figure(
  image("/figures/bound-charge.pdf", width: 50%),
  caption: [
    Illustration of aligned dipoles inside a material. The inner charges cancel leaving effectively a bound surface charge. 
  ],
) <fig:bound>

One can show (Griffiths Ch. 4) that bound charges and polarization are connected
through

#key-box[
  $ -div vb(P) = rho_b $ <eq:bound-charge>
]

The total charge density is
#key-box[
  $ rho = rho_b + rho_f $
]
where $rho_f$ is the _free_ charge density that we can manipulate in the lab.

#supplement-box(title: [Example on Polarzation])[
  Imagine a sphere with a uniform distribution of positive and negative charges, as shown in @fig:ex-polarization.

  #figure(
    image("/figures/ex-polarization.pdf", width: 50%),
    caption: [
      When an electric field is applied, the positive charges move in the direction of $vb(E)$ while the negative charges move in the opposite direction. As a result, the spheres are shifted against each other. 
    ],
  ) <fig:ex-polarization>

  The electric field in the overlaping region is given by 
  $
    vb(E)_("overlap") = - 1 / (4 pi epsilon_0) (q dot vb(d)) / R^3,
  $
  where $R$ is the radius of the sphere (believe me or check in Griffiths Ch. 2 and 4).
  
  The electric field can be expressed in terms of the polarization $vb(P)$ replacing the dipole moment $vb(p)$ (with charge $q$ the net positive charge) with the polarization $vb(P)$:

  $
   vb(p) = q dot vb(d) = vb(P) dot V = vb(P) dot (4/3 pi R^3),
  $
  
  which is uniform accross the sphere. Plugging in:
  $
    => vb(E)_("overlap") = - 1 / (3 epsilon_0) vb(P).
  $

  Outside the sphere, for distances $|vb(r)| >> |vb(d)|$ we have a dipole with potential 
  $
    U = 1 / (4 pi epsilon_0) (vb(p) dot vb(r)) / (|vb(r)|^3)
  $

  The total electric field is then the sum of the field that caused the polarization in the first place and the electric field produced by the polarizatio, i.e. the shifting of the spheres. The result is shown in @fig:uniform-polarization. 

  #figure(
    image("/figures/uniform-polarization.pdf", width: 50%),
    caption: [
      The total electric field from the uniform polarization. The field is uniform inside the sphere and behaves like a dipole outside. 
    ],
  ) <fig:uniform-polarization>
]



=== The Electric Displacement $vb(D)$

We define the _electric displacement_ $vb(D)$ whose divergence equals the free
charge density:
$ div vb(D) = rho_f $

This is like Gauss's law but only for free charges and without $epsilon_0$.
Starting from the divergence of the total $vb(E)$ field:
$
  div vb(E) &= 1/epsilon_0 (rho_f + rho_b) \
  &= 1/epsilon_0 div vb(D) - 1/epsilon_0 div vb(P) \
  &= 1/epsilon_0 div(vb(D) - vb(P))
$

This gives us the definition of $vb(D)$:

#result-box[
  $ vb(D) = epsilon_0 vb(E) + vb(P) $ <eq:D-field>
]

This is actually the definition of $vb(D)$, motivated here from consistency with Maxwell's
equations.

#text(fill: gray)[
  _Next lecture:_ we will see what happens in matter when you apply a magnetic field, and rewrite Maxwell's equations fully in terms of free charges and currents.
]

== Magnetization

#text(fill: gray)[
  Last lecture we looked at the electric field in dielectrics and introduced the
  _electric displacement_
  $ vb(D) = epsilon_0 vb(E) + vb(P), quad div vb(D) = rho_f. $
  We saw that dielectrics become polarized when an external field is applied
  (note that $vb(E)$ above is the _total_ field).
]

We now ask the analogous question for magnetic fields.

#exercise-box[
  What happens when you place a piece of material in a magnetic field?
]

Again, it depends on the type of material.

Some materials, like iron, become magnets themselves and can even stay
magnetized once the external field is switched off. Such substances (e.g., iron,
nickel, cobalt) are called *ferromagnets* — we will not discuss them further
in this course.

But other materials are also affected by external fields, and are divided
into:
- *Paramagnets*: acquire a magnetization _parallel_ to $vb(B)$.
- *Diamagnets*: acquire a magnetization _antiparallel_ to $vb(B)$. 

Compared to ferromagnets, the magnetization is much smaller (you can't pick up wood with a magnet).

Let's look at paramagnets and diamagnets more closely.

=== Microscopic Origin: Magnetic Dipoles

In fact, all magnetic
phenomena are caused by tiny currents:
- electrons that have _spin_ (imagine them as spinning charged spheres, even
  though this picture is not correct in a quantum-mechanical sense),
- electrons that _orbit_ around the nucleus.

Both phenomena generate current loops that we can treat as magnetic dipoles, sketched in @fig:magnetic-dipole. The dipole moment is given by

#key-box[
  #align(center)[
    $ vb(m) = I vb(A) $
  ]
]
where $I$ is the current circulating around the loop of area $A$, and
$vb(A) = A vu(n)$ points along the loop's normal (direction set by the
right-hand rule).

#figure(
  image("/figures/mag-dipole-moment.pdf", width: 30%),
  caption: [
    A magnetic dipole moment $vb(m)$ is generated by a current loop. The direction of $vb(m)$ is given by the right-hand rule. 
  ],
) <fig:magnetic-dipole>

=== Paramagnetism

Without an external field, these dipoles point in random directions. Once you
apply a field, the dipoles experience a torque that will line them up
parallel to the field. This torque accounts for paramagnetism.

You might expect this to be a universal phenomenon, since every spinning
electron constitutes a dipole. 

However, in quantum mechanics we have the *Pauli exclusion principle*, which states
that two electrons (or more generally, _fermions_ — particles with
half-integer spin) cannot occupy the same quantum state. This tends to lock
electrons with opposite spin together in atoms, so that their torques
neutralize.

As a result, paramagnetism occurs mostly in atoms or molecules with an
_odd_ number of electrons. But even in such materials, random thermal
fluctuations compete with the ordering of the dipoles.

=== Diamagnetism

Orbits of electrons also constitute tiny current loops, but these are
randomly oriented. In the presence of a field, an orbiting electron
experiences an additional Lorentz force that will either speed it up or slow
it down. This changes its dipole moment _antiparallel_ to the field.  This is
diamagnetism.

Diamagnetism is typically weaker than paramagnetism, and mainly observed in
atoms/molecules with an _even_ number of electrons (where paramagnetism is
largely cancelled by the Pauli exclusion principle).

=== The Magnetization $vb(M)$

Similarly to polarization, we can thus define the *magnetization*:

#align(center)[
  $vb(M) =$ magnetic dipoles per unit volume
]

The magnetization is connected to a *bound current density* $vb(J)_b$
(produced by the electron spins and orbits) through

#result-box[
  $ vb(J)_b = curl vb(M) $ <eq:bound-current>
]

#text(fill: rgb("#008080"))[See the slides for an illustration.]

=== The Auxiliary Field $vb(H)$

The currents we control directly — e.g. by increasing a voltage — are called
*free currents*, and they produce a field $vb(H)$, analogous to the electric
displacement $vb(D)$ in the electrostatic case:
$ curl vb(H) = vb(J)_f. $

In practice, $vb(H)$ is used far more frequently than $vb(D)$. Usually
$vb(H)$ is defined through

#key-box[
  $ vb(H) = 1/mu_0 vb(B) - vb(M) $ <eq:H-field>
]

#supplement-box(title: [Note])[
  Unlike $vb(B)$, the field $vb(H)$ is not generally divergence-free:
  $div vb(H) = -div vb(M)$, which need not vanish.
]

=== The Polarization Current

So far, the relation $vb(J)_b = curl vb(M)$ was only established for the
electro-/magnetostatic case (only in this case we have $vb(J) = vb(J)_f + vb(J)_b$).
In the time-dependent case, we get an
additional contribution to the current density: a change in polarization
also drives a *polarization current* $vb(J)_p$:

#key-box[
  $ vb(J)_p = pdv(vb(P), t) $ <eq:polarization-current>
]

What's the physical meaning of this current? It has nothing to do with the bound current $vb(J)_b$;
$vb(J)_b$ is associated with the magnetization of the material which involves the the spin and orbital motion of electrons.
In contrast, the polarization current
$vb(J)_p$ is the result of the linear motion of charge as the polarization
changes. For example: if $vb(P)$ points in the $+x$ direction and
increases, positive charges will move slightly in the $+x$ direction while
negative charges move slightly in the $-x$ direction. The cumulative effect
of these tiny shifts is the current $vb(J)_p$.

This current is essential to ensure conservation of bound charge. We can
check this against the continuity equation (@eq:continuity):
$
  div vb(J)_p
  = div pdv(vb(P), t)
  = pdv(, t) (div vb(P))
  = -pdv(rho_b, t),
$
where we used the definition of the polarization current (@eq:polarization-current).
In the last step we used the relation between polarization and bound
charge, @eq:bound-charge. This is exactly the continuity equation for the
bound charge density $rho_b$, as required.

#supplement-box(title: [Does a changing magnetization lead to a charge accumulation?])[
  No — a changing magnetization changes the bound current, but
  $
    div vb(J)_b = underbrace(div (curl vb(M)), = 0 "(divergence of curl always zero)"),
  $
  so a changing $vb(M)$ redistributes current but never accumulates net
  charge anywhere. (Note that this is not to be confused with the
  polarization current $vb(J)_p$ above, which is associated with the
  polarization $vb(P)$, not the magnetization.)
]

=== Ampère's Law in Matter

The total current density now has three contributions:

#key-box[
  $
    vb(J) &= vb(J)_f + vb(J)_b + vb(J)_p \
    &= vb(J)_f + curl vb(M) + pdv(vb(P), t)
  $ <eq:total-current>
]

Let's write Ampère's law with Maxwell's addition, @eq:maxwell (iii), in terms of
$vb(H)$ and $vb(D)$ instead of $vb(B)$ and $vb(J)$. Starting from
$ curl vb(B) = mu_0 vb(J) + mu_0 epsilon_0 pdv(vb(E), t), $
we substitute $vb(B) = mu_0 (vb(H) + vb(M))$ (from @eq:H-field) on the
left-hand side, and @eq:total-current on the right-hand side:

#v(0.5em)

$
  mark(mu_0 curl (vb(H) + vb(M)), tag: #<def-h>)
  = mark(mu_0 (vb(J)_f + curl vb(M) + pdv(vb(P), t)), tag: #<def-j>)
  + mark(mu_0 epsilon_0 pdv(vb(E), t), tag: #<def-eps>)
$

#{
  annot-cetz(
    (<def-h>, <def-j>, <def-eps>),
    cetz,
    {
      import cetz.draw: *
      cetz.decorations.flat-brace(
        (rel: (0, -0.2), to: "def-h.south-west"),
        (rel: (0, -0.2), to: "def-h.south-east"),
        flip: true,
        name: "h-brace",
        stroke: blue,
      )
      content(
        (rel: (0, -0.6), to: "h-brace.south"),
        anchor: "north",
        name: "h-label",
        text(size: 9pt, fill: blue)[using definition of $vb(H)$],
      )

      cetz.decorations.flat-brace(
        (rel: (0, -0.35), to: "def-j.south-west"),
        (rel: (0, -0.35), to: "def-j.south-east"),
        flip: true,
        name: "j-brace",
        stroke: teal.darken(30%),
      )
      content(
        (rel: (0, -0.6), to: "j-brace.south"),
        anchor: "north",
        name: "j-label",
        text(size: 9pt, fill: teal.darken(30%))[using definition of $vb(J)$],
      )

      cetz.decorations.flat-brace(
        (rel: (0, -0.35), to: "def-eps.south-west"),
        (rel: (0, -0.35), to: "def-eps.south-east"),
        flip: true,
        name: "eps-brace",
        stroke: orange.darken(20%),
      )
      content(
        (rel: (0, -0.6), to: "eps-brace.south"),
        anchor: "north",
        name: "eps-label",
        text(size: 9pt, fill: orange.darken(20%))[will combine into $vb(D)$],
      )
    },
  )
}
#v(1.8em)

The $mu_0 curl vb(M)$ term appears on both sides and cancels. Dividing by
$mu_0$:
$ curl vb(H) = vb(J)_f + pdv(vb(P), t) + epsilon_0 pdv(vb(E), t). $
Using the definition of $vb(D)$, @eq:D-field, the last two terms combine
into $pdv(vb(D), t)$:

#key-box[
  $ curl vb(H) = vb(J)_f + pdv(vb(D), t) $ <eq:ampere-matter>
]

Faraday's law @eq:maxwell (iii) and Gauss's law for magnetism @eq:maxwell (ii) stay
unchanged — they don't involve currents or a free/bound charge distinction.

== Macroscopic Maxwell's Equations

We arrive at an alternative formulation of Maxwell's equations, valid inside
matter, sometimes called the *macroscopic* Maxwell's equations:

#key-box[
  $
    div vb(D) &= rho_f & "(i)" \
    div vb(B) &= 0 & "(ii)" \
    curl vb(E) &= -pdv(vb(B), t) & "(iii)" \
    curl vb(H) &= vb(J)_f + pdv(vb(D), t) & "(iv)"
  $ <eq:maxwell-matter>

  plus the constitutive relations
  $
    vb(D) = epsilon_0 vb(E) + vb(P)
    quad "and" quad
    vb(H) = 1/mu_0 vb(B) - vb(M).
  $
]

Alternatively, one can stick with the _microscopic_ Maxwell's equations
(@eq:maxwell) in terms of $vb(E)$ and $vb(B)$ only, as long as the sources
$rho$ and $vb(J)$ include _all_ charges and currents — free and bound.


== Linear Media and Susceptibility

Often, the displacement and magnetizing fields are written in terms of the
*permittivity* $epsilon$ and *permeability* $mu$ of the material:
$ vb(D) = epsilon vb(E), quad vb(H) = 1/mu vb(B). $ <eq:lin-media>

$epsilon$ and $mu$ can be expressed in terms of the electric and magnetic
*susceptibilities* $chi_e$, $chi_m$:
$ epsilon = epsilon_0 (1 + chi_e), quad mu = mu_0 (1 + chi_m). $

#supplement-box(title: [The dielectric constant])[
  The (relative) *dielectric constant* is
  $ epsilon_r = epsilon / epsilon_0 = 1 + chi_e. $
  $chi_e$ and $chi_m$ are dimensionless numbers, #text(fill: rgb("#008080"))[see the slides for typical values].
]

*Linear media* have a linear relation between polarization/magnetization and
the fields:
$ vb(P) = epsilon_0 chi_e vb(E), quad vb(M) = chi_m vb(H). $

- For *homogeneous* materials, $epsilon$ and $mu$ are constants; for
  *inhomogeneous* materials, they are functions of position.
- For *isotropic* materials, $epsilon$ and $mu$ are scalars; for
  *anisotropic* materials (like crystals), they are tensors.

#supplement-box(title: [Interlude: Connection to my research on axions])[
   Axions could solve two pressing problems in particle physics and cosmology:

  - The nature of _dark matter_
  - The non-observation of an electric dipole moment of the neutron (the _strong CP
    problem_)

  If axions existed, they could couple to photons in the presence of $vb(B)$-fields.
  If axions are dark matter, they would surround us and _modify Maxwell's equations_.
  Gauss's law would get an additional source term from the spatial gradient of the
  axion field:
  $ rho -> rho - g_(a gamma) / (mu_0 c) vb(B) dot grad a $
  where $g_(a gamma)$ is the axion-photon coupling constant and $a$ the axion field.
  Ampère's law similarly gets modified:
  $ vb(J)_f + pdv(vb(D), t) -> vb(J)_f + pdv(vb(D), t) + g_(a gamma) / (mu_0 c) [pdv(a, t) vb(B) - vb(E) times grad a ] $
  Even without charges and currents, you could generate electromagnetic fields
  through axion dark matter!
  Typically, the spatial variations of the axion field are negligible,
  so the gradient term can be dropped leaving the axion current as the new dominating source term, 

  $
    vb(J)_a = g_(a gamma) / (mu_0 c) pdv(a, t) vb(B).
  $

  The axion field oscillates at a frequency $omega_a = m_a c^2 / hbar$ set by the axion mass $m_a$, which is unknown but expected to be very small. This leads to an oscillating axion current in the presence of a static magnetic field, which is the basis for many axion dark matter searches also here at SDU.
]


== Boundary Conditions <sec:boundary-conditions>

Starting from Maxwell's equations in matter, we now ask: what happens at the
boundary between two media with different permittivities $epsilon_1$,
$epsilon_2$ and permeabilities $mu_1$, $mu_2$? For now we only look at the
general boundary conditions that the electric and magnetic fields must
fulfil.

We will soon see that electromagnetic fields are propagating waves, and that
these boundary conditions lead to reflection, transmission, and refraction (e.g. light passing from air into glass or water).

In general, $vb(E)$, $vb(D)$, $vb(B)$, and $vb(H)$ are all discontinuous at
the boundary between two media.

=== Perpendicular Components: $vb(D)$ and $vb(B)$

The form of the discontinuity can be derived from Maxwell's equations in
integral form. Starting from Gauss's law, (i) in @eq:maxwell-matter, and
applying the divergence theorem:

$ integral_V (div vb(D)) dd(V) = integral.cont_S vb(D) dot dd(vb(a)) = Q_"f, enc", $

where $Q_"f, enc"$ is the total free charge enclosed by the surface $S$.
This holds for _any_ closed surface — including a thin "pillbox" straddling
the boundary between the two media, see @fig:pillbox.

#figure(
  image("/figures/boundary-perp.pdf", width: 50%),
  caption: [
    A thin pillbox straddling the boundary between two media. The outward normal vectors $vu(n)$ point into medium 1 and medium 2, respectively. 
  ],
) <fig:pillbox>

Consider the limit where the pillbox thickness $t -> 0$: the integral only
gets a contribution from the top and bottom faces (each of area $a$, with
outward normal vectors $plus.minus vu(n)$ pointing into medium 1 and medium 2
respectively):
$
  integral.cont_S vb(D) dot dd(vb(a))
  = (vb(D)_1 dot vu(n)) a - (vb(D)_2 dot vu(n)) a
  = Q_"f, enc" = sigma_f dot a,
$
where $sigma_f$ is the free surface charge density. Dividing by $a$:

#result-box[
  $ D_1^perp - D_2^perp = sigma_f $ <eq:D-perp>
]
where $perp$ denotes the component perpendicular to the boundary. For linear
media (@eq:lin-media) with no free surface charge:
$ epsilon_1 E_1^perp = epsilon_2 E_2^perp. $ <eq:D-perp-linear>

Similarly, from Gauss's law for magnetism, (ii) in @eq:maxwell-matter, we
have $integral.cont_S vb(B) dot dd(vb(a)) = 0$. The same pillbox argument
then gives:

#key-box[
  $ B_1^perp = B_2^perp $ <eq:B-perp>
]
The perpendicular component of $vb(B)$ is always continuous.

=== Parallel Components: $vb(E)$ and $vb(H)$

Now we turn to the two Maxwell equations that involve curls. Using Stokes'
theorem,
for a closed path $C$ around $S$, we find the integral forms of (iii) and
(iv) in @eq:maxwell-matter, 

$ integral_S (curl vb(E)) dot dd(vb(a)) = integral.cont_C vb(E) dot dd(vb(l)), $

and similarly
$ integral_S (curl vb(H)) dot dd(vb(a)) = integral.cont_C vb(H) dot dd(vb(l))
= I_(f, "enc") + dv( , t)integral_S vb(D) dot dd(vb(a)), $ <eq:ampere-int>

where $I_(f, "enc")$ is the total free current enclosed by the loop.

Consider a thin rectangular Amperian loop with sides of length $Delta l$ straddling the
boundary, with height $h$, see Figure @fig:ampere-loop.
In the limit $h -> 0$, the area $S$ enclosed by the loop
vanishes, so the flux term on the right-hand side of Faraday's law vanishes:
$ vb(E)_1 dot Delta vb(l) - vb(E)_2 dot Delta vb(l) = -dv(, t) integral_S vb(B) dot dd(vb(a)) limits(->)^(h -> 0) 0, $
so

#key-box[
  $ vb(E)_1^parallel = vb(E)_2^parallel $ <eq:E-par>
]

#figure(
  image("/figures/boundary-par.pdf", width: 60%),
  caption: [
    A thin rectangular Amperian loop straddling the boundary between two media.  
  ],
) <fig:ampere-loop>

The parallel component of $vb(E)$ is always continuous across the boundary
(note that $vb(E)^parallel$ is a two-dimensional vector, living in the plane
of the boundary).

For Ampère's law (@eq:ampere-int), the total free current enclosed by the loop can be written
in terms of a free surface current density $vb(K)_f$:
$
  I_"f, enc" = vb(K)_f dot (vu(n) times Delta vb(l)),
$
where $vu(n) times Delta vb(l)$ is the vector perpendicular to the loop, so that
$vb(K)_f dot (vu(n) times Delta vb(l))$ picks out the component of $vb(K)_f$
passing through the loop. Using the cyclic property of the scalar triple
product, $vb(A) dot (vb(B) times vb(C)) = vb(B) dot (vb(C) times vb(A))= vb(C) dot (vb(A) times vb(B))$:
$ I_"f, enc" = Delta vb(l) dot (vb(K)_f times vu(n)), $
so that
$ vb(H)_1 dot Delta vb(l) - vb(H)_2 dot Delta vb(l) = I_"f, enc" = Delta vb(l) dot mark(vb(K)_f times vu(n), tag: #<surf-current>). $

#{
  annot-cetz(
    <surf-current>,
    cetz,
    {
      import cetz.draw: *
      cetz.decorations.flat-brace(
        (rel: (0, -1.2), to: "surf-current.south-west"),
        (rel: (0, -1.2), to: "surf-current.south-east"),
        flip: true,
        name: "surf-brace",
        stroke: blue,
      )
      content(
        (rel: (0, -0.5), to: "surf-brace.south"),
        anchor: "south",
        name: "surf-label",
        text(size: 9pt, fill: blue)[free surface current density],
      )
    },
  )
}
#v(1.3em)

Pulling out the common factor $Delta vb(l)$, we find

#result-box[
  $ vb(H)_1^parallel - vb(H)_2^parallel = vb(K)_f times vu(n). $ <eq:H-par>
]
The parallel component of $vb(H)$ has a discontinuity proportional to the
free surface current density. For linear media (@eq:lin-media) with no surface currents:
$ 1/mu_1 vb(B)_1^parallel = 1/mu_2 vb(B)_2^parallel. $ <eq:H-par-linear>

#supplement-box(title: [Summary: boundary conditions])[
  Collecting the four results derived above (@eq:D-perp, @eq:B-perp,
  @eq:E-par, and @eq:H-par respectively), the fields on either side of a
  boundary between two media are related by:

  $
    D_1^perp - D_2^perp &= sigma_f & "(perpendicular)" \
    B_1^perp &= B_2^perp & "(perpendicular)" \
    vb(E)_1^parallel &= vb(E)_2^parallel & "(parallel)" \
    vb(H)_1^parallel - vb(H)_2^parallel &= vb(K)_f times vu(n) & "(parallel)"
  $

  For *linear media* (@eq:lin-media) with no free surface charge or current
  ($sigma_f = 0$, $vb(K)_f = vb(0)$), the perpendicular and parallel
  conditions on $vb(D)$ and $vb(H)$ simplify to relations purely between
  $vb(E)$- and $vb(B)$-fields (@eq:D-perp-linear, @eq:B-perp, @eq:E-par, and
  @eq:H-par-linear respectively):

  $
    epsilon_1 E_1^perp &= epsilon_2 E_2^perp & "(perpendicular)" \
    B_1^perp &= B_2^perp & "(perpendicular)" \
    vb(E)_1^parallel &= vb(E)_2^parallel & "(parallel)" \
    1/mu_1 vb(B)_1^parallel &= 1/mu_2 vb(B)_2^parallel & "(parallel)"
  $

  Note that $vb(B)^perp$ and $vb(E)^parallel$ are always continuous — they
  don't depend on the medium at all. 
]

