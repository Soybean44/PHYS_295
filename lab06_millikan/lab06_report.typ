#import "PHYS_295_template.typ": report

#show: report.with(
  title: "Measurement of the Elementary Charge via the Millikan Oil Drop Experiment",
  author: "Sovereign Shahid",
  id: 1850255,
  partners: ("No Partner"),
  
  abstract: [We performed the Millikan Oil Drop experiment to determine the value of the elementary electric charge. By observing the motion of charged oil droplets in an electric field and analyzing their terminal velocities, we calculated the charge on individual droplets. Our measured value for the elementary charge is $e = (1.33 plus.minus 0.673) times 10^(-19)$ C, which does agree with our expected value.]
)

= Introduction
The quantization of electric charge is a fundamental concept in physics. The Millikan Oil Drop experiment, first performed by Robert Millikan in 1909, provided direct evidence for the existence and value of the elementary charge @Millikan1913On. Much of his work is condensed in his 1917 book all about the electron @Millikan1917, arriving at a value of $e = (4.774 plus.minus 0.009) times 10^(-10)$ statC, or $e = (1.593 plus.minus 0.003) times 10^(-19)$ C in modern units. In this experiment, we aim to replicate Millikan's findings by measuring the charge on oil droplets suspended in an electric field.

= Background/Theory
The experiment relies on balancing the gravitational force and the electric force acting on a charged oil droplet. The gravitational force is $F_g = m g$, where $m$ is the mass of the droplet and $g$ is the acceleration due to gravity. The electric force is $F_e = q E$, where $q$ is the charge on the droplet and $E$ is the electric field between the plates.

By measuring the terminal velocity of the droplet when the field is off ($v_(op("fall"))$) and when the field is on ($v_(op("rise"))$), we can determine the radius of the droplet using Stokes' drag and the viscosity of air. 

$
k = (6 pi r eta)/(1+ (b/(P r)))
$

Where $eta$ is the air's viscosity, $P$ is the pressure, $b$ is a constant (roughly $8.23 times 10^(-3)$ Pa$dot$m. Then using terminal velocity when falling (not depicted as the derivation is fairly involved) and stokes' law, we can solve for the radius:

$
r = -b/(2P) + sqrt(b^2/(4P^2) + (9 eta v_(op("fall")))/(2 rho g))
$<eq:radius>

Where $rho$ is the density of oil. Finally we solve the entire system to get the charge on the droplet:
$
q = ((v_(op("fall")) + v_(op("rise")))/(v_(op("fall"))))(4 pi rho g r^3)/(3 E) 
$ <eq:charge>


= Experimental Details
The apparatus consists of a chamber with two parallel plates connected to a variable high-voltage supply, a light source, and a telescope for observing the droplets. Oil is atomized into the chamber, and droplets are allowed to enter the region between the plates. The voltage's polarity is adjusted to control the motion of a droplet between the reticles of the telescope.

#figure(
  image("images/experimental_setup.png", height: 30%),
  caption: [The Millikan Oil Drop apparatus, as shown in the lab manual. The telescope allows precise measurement of droplet motion, and the voltage across the plates is controlled to adjust the electric field.]
)

During the experiment, we measured the time it took for individual oil droplets to traverse between two reticles in the telescope, both with the electric field on and off. Originally this consisted of using the provided timers, marking events manually as the droplet passed each reticle. 

However, the timers, had a very small resolution of 9 events max, which lead to us switching to a smartphone-based timer (Samsung Z-Flip 5) which allowed us to record lap times of individual droplets, avoiding the need to manually calculate the time taken between reticles as well as improving our timing resolution significantly.

We did this for a total of 25 droplets over the course of two days, recording the rise and fall times for each droplet. The first day was mainly used the first method of timekeeping whereas the 2nd day used the smartphone timer exclusively, as well as focused on getting slower rising droplets to improve accuracy.

As well we are supposed to record the distance between the reticles in the telescope, however I failed to do this properly during the experiment, as a substitute value of 0.5 mm was used based on @deanza_millikan_oil_drop. 

I also did not have a lab partner for this experiment, so all measurements and calculations were done individually. As the lab manual was not designed for solo work, this likely led to some inefficiencies and potential errors in data collection, which we will discuss later on.

= Results and Analysis

The measured rise and fall times for 5 sample droplets (Note all samples should have the same drop number and therefore correspond to the same drops) were recorded and are summarized below:
#let drop_stats = csv("data/drop_stats.csv")
#set text(size: 10.96pt)
#figure(
  table(
    columns: drop_stats.at(0).len(),
    align: range(drop_stats.at(0).len()).map(x => center),
    ..drop_stats.slice(0,6).flatten() 
  )
  ,caption: [
    This table summarizes the measured rise and fall times for five oil droplets, taking the averages of raw data and their uncertainties. As well the day recorded is included to account for environmental changes such as pressure and temperature that may have affected the results.]
  ,kind: table
) <table:drop_stats>

Assuming a reticle spacing of 0.5 mm @deanza_millikan_oil_drop, we calculated the velocities for each droplet. From this, we solved for radius using @eq:radius and then, we calculated the charges for each droplet using @eq:charge. The results for five droplets are summarized below:

#let drop_charges = csv("data/drop_charges.csv")
#set text(size: 10.96pt)
#figure(
  table(
    columns: drop_charges.at(0).len(),
    align: range(drop_charges.at(0).len()).map(x => center),
    ..drop_charges.slice(0,6).flatten() 
  )
  ,caption: [
    This table depicts the calculated charges for each oil droplet based on the measured velocities and other parameters. As you can see the charges seem to be fairly large, which may have been due to the fact I didn't very slow droplets at the start. I started to remedy this later on in the experiment but this could have been improved much further.
  ]
  ,kind: table
) <table:drop_charges>

As well we plotted the measured charges to observe quantization: which can be seen in @fig:charge_plot.

#figure(
  image("./millikan_files/figure-html/cell-11-output-1.png", width: 100%),
  caption: [This graph depicts the measured charges of the oil droplets. Intuitively there looks like there is some quantization in the smaller charges, but the range of drops is too large to make any definitive conclusions.]
) <fig:charge_plot>

From this we then divided all charges by the smallest measured charge to observe quantization more clearly: 

#let drop_ratios = csv("data/ratios.csv")
#set text(size: 10.96pt)
#figure(
  table(
    columns: drop_ratios.at(0).len(),
    align: range(drop_ratios.at(0).len()).map(x => center),
    ..drop_ratios.slice(0,6).flatten() 
  )
  ,caption: [
    This table shows a sample of the ratios of of each drop charge to the smallest measured charge. It was not very nice given our large uncertainties, However by rounding these ratios and taking the weighted average of the resulting elementary charge we get back, we can still get a reasonable estimate for the elementary charge.]
  ,kind: table
) <table:drop_ratios>

Using the processes explained in @table:drop_ratios, we found the mean value of the measured charge is $e = (1.33 plus.minus 0.673) times 10^(-19)$ C. The uncertainty was calculated from the standard deviation of the measurements shown in the lab manual, applying the weighted averages.

= Discussion

Our measured value for the elementary charge agrees well with the accepted value of $1.602 times 10^{-19}$ C. I honestly just see this as lucky given the fairly large uncertainties in our measurements along with the substandard experimental practices I employed. 

For instance, I failed to measure the reticle spacing properly, and I also did not take very slow droplets at the start of the experiment, which likely led to larger errors in velocity measurements. As well due to many factors such as the collision of air molecules with the droplets, Imperfections in the oil droplets, and variations in the electric field, there are inherent uncertainties in the measurements. This leads to significant uncertainties in the calculated charge values. And while the weighted average method helps mitigate some of these errors, the large uncertainties still impact the reliability of the final result.

As well I had emphasized slow rising droplets later on in the experiment to improve accuracy, however I should have emphasized slow falling droplets more, as they contribute less overall uncertainty to the radius, making the experiment more accurate overall. 

Despite all of that we were within under half a standard deviation of the accepted value, which is pretty good. I do not understand why the data ended up fitting so well to the expected value, but the mathematics works out. If I were conducting this experiment without knowing a priori what the expected result was, I would be much more skeptical of my findings.

= Conclusion

We successfully replicated the Millikan Oil Drop experiment and measured the elementary charge to be $e = (1.33 plus.minus 0.673) times 10^(-19)$ C. While our result agrees with the accepted value, the large uncertainties highlight the challenges in accurately measuring such a fundamental constant. Alternative experiments serve to confirm the quantization of charge in a much more precise manner, but this experiment remains a classic demonstration of the discrete nature of electric charge.

= Acknowledgements
I'd like to acknowledge Professor Carsten B. Krauss, and T.A. Anna-Sofia Jylhae for their guidance and support during the experiment.

#heading(level: 1, numbering: none)[References]
#bibliography("bib.bib", title:none, style: "ieee", full: true)

#heading(level: 1, numbering: none)[Appendix]

All code and data can be found at #link("https://github.com/Soybean44/PHYS_295") under the `lab06_millikan/millikan.qmd` file with a PDF copy at `lab06_millikan/millikan.pdf`. The raw measurement data can be found under `lab06_millikan/data/` 
