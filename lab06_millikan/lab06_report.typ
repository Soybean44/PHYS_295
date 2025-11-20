#import "PHYS_295_template.typ": report

#show: report.with(
  title: "Measurement of the Elementary Charge via the Millikan Oil Drop Experiment",
  author: "Sovereign Shahid",
  partners: ("No Partner"),
  
  abstract: [We performed the Millikan Oil Drop experiment to determine the value of the elementary electric charge. By observing the motion of charged oil droplets in an electric field and analyzing their terminal velocities, we calculated the charge on individual droplets. Our measured value for the elementary charge is $e = (5.55 plus.minus 2.80) times 10^(-19)$ C, which does not agree due to large systematic error in the experiment.]
)

= Introduction
The quantization of electric charge is a fundamental concept in physics. The Millikan Oil Drop experiment, first performed by Robert Millikan and Harvey Fletcher in 1909, provided direct evidence for the existence and value of the elementary charge. In this experiment, tiny oil droplets are suspended between two electrically charged plates, and their motion is observed under the influence of gravity and an applied electric field.

= Background/Theory
The experiment relies on balancing the gravitational force and the electric force acting on a charged oil droplet. The gravitational force is $F_g = m g$, where $m$ is the mass of the droplet and $g$ is the acceleration due to gravity. The electric force is $F_e = q E$, where $q$ is the charge on the droplet and $E$ is the electric field between the plates.

By measuring the terminal velocity of the droplet when the field is off ($v_(op("fall"))$) and when the field is on ($v_(op("rise"))$), we can determine the radius of the droplet using Stokes' drag and the viscosity of air. 

$
k = (6 pi r eta)/(1+ (b/(P r)))
$

Then we can use this plus our falling velocity to find the radius of the droplet via the following equation:

$
r = -b/(2P) + sqrt(b^2/(4P^2) + (9 eta v_(op("fall")))/(2 rho g))
$

$
q = ((v_(op("fall")) + v_(op("rise")))/(v_(op("fall"))))(4 pi rho g r^3)/(3 E) 
$

Where $rho$ is the density difference between oil and air, and $r$ is the radius of the droplet.

= Experimental Details
The apparatus consists of a chamber with two parallel plates connected to a variable high-voltage supply, a light source, and a telescope for observing the droplets. Oil is atomized into the chamber, and droplets are allowed to enter the region between the plates. The voltage's polarity is adjusted to control the motion of a droplet between the reticles of the telescope.

#figure(
  image("images/experimental_setup.png", height: 30%),
  caption: [The Millikan Oil Drop apparatus, as shown in the lab manual. The telescope allows precise measurement of droplet motion, and the voltage across the plates is controlled to adjust the electric field.]
)

We recorded the rise and fall times for several droplets, measured the plate separation, and calculated the electric field. Environmental factors such as air pressure and temperature were also noted.

= Results and Analysis

Sample data for five droplets:

#let drop_stats = csv("data/drop_stats.csv")
#set text(size: 10.96pt)
#figure(
  table(
    columns: drop_stats.at(0).len(),
    align: range(drop_stats.at(0).len()).map(x => center),
    ..drop_stats.slice(0,6).flatten() 
  )
  ,caption: [
    Drop Stats
  ]
  ,kind: table
) <table:drop_stats>

Using the measured velocities and the known parameters, we calculated the charges for each droplet. The results for five droplets are summarized below:

#let drop_stats = csv("data/drop_charges.csv")
#set text(size: 10.96pt)
#figure(
  table(
    columns: drop_stats.at(0).len(),
    align: range(drop_stats.at(0).len()).map(x => center),
    ..drop_stats.slice(0,6).flatten() 
  )
  ,caption: [
    Drop Stats
  ]
  ,kind: table
) <table:drop_charges>

As well we plotted the measured charges to observe quantization: which can be seen in @fig:charge_plot.

#figure(
  image("./millikan_files/figure-html/cell-11-output-1.png", width: 100%),
  caption: [This graph depicts the measured charges of the oil droplets. The clustering of charges around integer multiples of a fundamental value supports the quantization of electric charge.]
) <fig:charge_plot>

The mean value of the measured charge is $e = (5.55 plus.minus 2.80) times 10^(-19)$ C. The uncertainty was calculated from the standard deviation of the measurements.

= Discussion

Our measured value for the elementary charge does not agree with the accepted value of $1.602 times 10^{-19}$ C. 

= Conclusion


= Acknowledgements
I'd like to acknowledge Professor Carsten B. Krauss, and T.A. Anna-Sofia Jylhae for their guidance and support during the experiment.

#heading(level: 1, numbering: none)[References]
#bibliography("bib.bib", title:none, style: "ieee", full: true)

#heading(level: 1, numbering: none)[Appendix]

All code and data can be found at #link("https://github.com/Soybean44/PHYS_295") under the `lab06_millikan/millikan.qmd` file with a PDF copy at `lab06_millikan/millikan.pdf`. The raw measurement data can be found under `lab06_millikan/data/` 
