#import "PHYS_295_template.typ": report

#show: report.with(
  title: "Electron Charge to Mass Ratio",
  author: "Sovereign Shahid",
  id: 1850255,
  partners: ("Hong Li"),
  abstract: [
    The aim of this lab is to measure the charge-to-mass ratio of the electron as well as determine earth's magnetic field strength experimentally. In order to do this, we used a Helmholtz coil and a filament to track the circular motion of electrons. From this we found a value of $1.58 times 10^11 plus.minus 2.62 times 10^14$ C/Kg for our electron charge-to-mass ratio and $3.09 times 10^(-5)plus.minus 0.418$ T, which both agree with the accepted values known today.
  ]
)

= Introduction
The determination of the electron charge-to-mass ratio $(e\/m)$ using Helmholtz coils is a classic experiment that demonstrates both fundamental physics and the utility of precise laboratory technique. As J.J Thomson @Thomson found, a cathode ray tube produced a beam of charged particles, which interacted with a magnetic field. In the modern day we use filaments along with Helmholtz coils to both determine the electron charge-to-mass ratio, but also the strength of earths magnetic field experimentally @Bocresion.

= Background/Theory
There are two stages to this lab setup, an acceleration stage and a rotation stage. A filament emits electrons and accelerates them from rest through a voltage difference $V$. 

Initially the electrons have a potential energy of $U=e V$ and they end up with a final energy of $K=1/2 m v^2$, which by conservation of energy gives us the following expression for velocity

$
1/2 m v^2 = e V => v^2 = (2 e V)/m
$ <eq:accel>


After the acceleration stage, the only forces acting on it are the magnetic force, which in a uniform field such as the Helmholtz coil results in circular motion, represented by the equation

$
e arrow(v) times arrow(B) = (m v^2)/r
$ <eq:circular>

Below you can see how this happens physically, in our lab setup:

#figure(
image("imgs/lab_setup.jpg", width: 70%),
caption: [Picture of the lab setup, You can clearly see that the path of the electron follows the circular motion described by the right hand side of @eq:circular.]
) <fig:setup>

Our setup is simplified such that the field is perpendicular to the velocity of the particle after the acceleration stage, given we have a relationship to velocity from  @eq:accel we can simplify the equation above to 

$
e B = sqrt(2m e V)/r 
$

In our case $B$ is the net magnetic field, which includes the Helmholtz field, defined as 

$
B_h = (8 mu N I)/(sqrt(125) R)
$

And Earth's magnetic field $B_e$, which we set to oppose the Helmholtz field making it negative. With these two values we can expand $B$, and linearize the equation, combining like terms to get
$
sqrt(e/m) B_h - sqrt(e/m) B_e = sqrt(2V)/r
$ <eq:linear>


= Experimental Results
As shown in @fig:setup, we have an acceleration stage (at the bottom of the bulb in the image) inside a glass bulb, In the glass bulb are prongs, which are more clearly visible in @fig:fields. The electron beam curves towards one of these prongs by the magnetic field generated through the coils around the bulbs. 

The experimental procedure of the lab follows from this. First we set an accelerating voltage target and approach it as close as possible. After setting the voltage, we tune the Helmholtz current such that the electron beam curves and hits one of the prongs, recording the current once reached. 

Repeat the last step for each prong and repeat the entire procedure for each accelerating voltage. We took increments of five volts each in our measurements. 

Finally to measure the earths magnetic field, we use the fact that we positioned the experimental apparatus anti-parallel to earth's magnetic field (as stated in @eq:linear) to set the magnitude of the Helmholtz field to be equivalent. The corresponding effect is shown in @fig:fields

#figure(
  grid(
    columns: 2,

    column-gutter: 1em,
    image("imgs/no_field.jpg", height: 30%),
    image("imgs/earth_field.jpg", height: 30%)
  ),
  caption: [A comparison of two trajectories. One in earths magnetic field and another in a net 0 magnetic field. On the left you can see the beam in the net 0 field travelling straight which implies no circular motion. On the right you see the beam curve downwards due to earth's magnetic field. Both had an accelerating voltage of $20 plus.minus 0.5$ V.]
) <fig:fields>

Overall when the path of the beam was straight, changing the accelerating voltage did not change the curvature of the path much, which confirms that our measured current was indeed causing the cancellation of the two magnetic fields. 

= Acknowledgements

I'd like to acknowledge my professor Carsten B. Krauss and my lab partner Li Hong, for helping me with the lab as well as our T.A. Anna-Sofia Jylhae, who helped us understand the experimental measurement of Earth's magnetic field

One note to mention is Li Hong is not my typical lab partner, since by usual lab partner, Konal Shah, was sick at the time of the lab and could not make it.

#heading(level: 1, numbering: none)[References]

#bibliography("bib.bib", title:none, style: "ieee", full: true)

#heading(level: 1, numbering: none)[Appendix]
