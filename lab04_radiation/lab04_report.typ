#import "PHYS_295_template.typ": report

#show: report.with(
  title: "Radiation Counts from a GM Tube",
  author: "Sovereign SHahid",
  partners: ("Konal Shah"),
  
  abstract: [We conduct an experiment to see the probabilistic distribution of radioactive decay events from a Cesium-137 source. We found a value of $21.3623 plus.minus 1.6239$ cps for the source rate with a G-M Tube that has a dead time found experimentally to be $1.5001 times 10^(-3) plus.minus 8.8366 times 10^(-7)$ s.]
)

= Introduction
Radioactive decay is a wondrous physical result of the underlying mechanics of the atom. Radioactive decay has lead us to both massive leaps in energy generation and years of terror from Nuclear Armageddon. At the heart of it is the simple beta decay, described theoretically by Enrico Fermi @Konopinski1955. 

Experimentally we can observe beta decay through the work of Hanz Geiger and Walter M$dot.double(op("u"))$ller as through the Geiger-M$dot.double(op("u"))$ller tube (G-M Tube) @Korff2013. Their work paved the current experimental understanding of radioisotopes as we know and the probabilistic nature of radioactive decay as a whole which we explore through the radioactive counts measured by a G-M Tube.

= Background/Theory
Physically, radioactive decay comes from the unstable equilibrium present in the nuclei of certain atomic isotopes. These are quantum mechanical effects and at a macroscopic scale appear random in nature. This randomness follows a _Poisson Distribution_ over a time period, formulated as shown

$
P(N;overline(N)) = overline(N)^N/N! e^(-overline(N))
$ <eq-poisson>

Where $P(N;overline(N))$ is the probability of observing $N$ events in a time period and $overline(N)$ is the mean number of events observed over a time period. This distribution tends to a Gaussian when $overline(N) >> 1$ with the same mean and a standard deviation of $sigma = sqrt(overline(N))$.

As a G-M tube interacts with an electron, it sends a spike in voltage which is measured by the counter. This spike is not infinitely thin and therefore takes time, which results in the _dead time_ where counts are indistinguishable from one another if they are measured close enough in rapid succession. 

This dead time can be calculated by calculating the ratio from two sources being measured independently and simultaneously, captured in the following equation

$
tau_(op("dead")) = (C_(1) + C_(2) - C_(12))/(2 dot C_(1) dot C_(2))
$

#pagebreak()

= Experimental Details
We had a G-M Tube Set up with a SPECTECH ST 350 (as seen in @fig-counter) counter to process the signal from the tube. The tube was set up on a track pointing at a carriage containing a beta source (in our case we had two Cesium-137 sources at approximately $<185$ kBq). 

#figure(
  rotate(270deg, image("imgs/counter.jpg", height: 40%)),
  caption: [This was the counter used in our experiment. When setting it up we set the voltage of the tube such that we could detect sufficient activity without over-saturating it. It is not changed as to not introduce dielectric breakdown and result in phantom counts. Then we used the time and count features to collect counts over a specific time, or collect a set number of counts and record the time, both of which were used in our experiment, we ignored the CPM and CPS modes as they had a correction factor which hindered our experiment.]
) <fig-counter>

They were first put onto the carriage individually then together, all at a known distance so we could calculate the dead time of the tube. After calculating the dead time we then did statistical analysis of 100 counts over 10 seconds at approximately a rate of 20 counts per second. Once we finished that we took one measurement of 100 counts without any source to measure the background radiation count rate at a 10% uncertainty, so we could figure out the count rate of the source without background radiation

= Results and Analysis

When getting our dead time counts we started with some baseline counts at a low time interval (10s) to get a rough idea of the count rate which gave us 

$
C_(1) =  112.9 op("cps")\ 
C_(1) =  110.9 op("cps")
$

#pagebreak()

All at a distance of $4.0 plus.minus 0.5$ cm. Then scaled up to 100s we got the following data

#figure(
  table(
    columns: (auto, auto, auto, auto),
    table.header([*Trial \#*], [*Counts 1*], [*Counts 2*], [*Counts 1 and 2*]),
    [1], [11179], [11300], [18272],
    [2], [11250], [11270], [18213]
), caption : [This table contains the data we got for our counts over 100s, The order was 1, 1 and 2, then 2 as to minimize the movement between trials to be the most accurate at each step.])
P:
We were suspicious of the counts per second being larger for Counts 2, especially since we moved the distance a bit when measuring Counts 2 accidentally. So we recorded another set of values which we used at a distance of $4.0 plus.minus 0.5$ cm

#figure(
  table(
    columns: (auto, auto),
    table.header([*Trial \#*], [*Counts 2 *]),
    [1], [10502],
    [2], [10681]
), caption : [Redoing counts for Counts 2. From this we see there is just so much statistical variation we could not tell a difference.])

From this we calculated count rate for each source, using our new data for the second source as to make sure the distance did not affect our data. From this we got a dead time of $tau_(op("dead")) = 1.5001 times 10^(-3) plus.minus 8.8366 times 10^(-7)$ s. As for the counted probabilistic data, we got a list of 100 counts like so

#figure(
  table(
    columns: (auto),
    table.header([*Counts*]),
    [213], 
    [217], 
    [233], 
    [226], 
    [202], 
    [232], 
    [207], 
    [206], 
    [214], 
    [221], 
    [203] 
  ), caption : [Sample List of counts over 10 seconds at a high count rate, close to the tube the full data can be found at the link in the appendix])

We plotted this as a histogram which shows the following 

#figure(
  image("geiger_files/figure-html/cell-6-output-1.png", height: 40%)
)

Further analysis from a file supplied by the University of Alberta Physics department named `Poisson fit Read from raw data.ipynb` showed the following.

#figure(
  image("poisson_files/figure-html/cell-2-output-1.png", height: 39%)
)

As well it returned that the Mean Counts over 100s was $216.74$ with an uncertainty $sqrt(216.74) = 14.7221$ and the $chi^2$ goodness of fit test was gave me a test statistic of 71.6 with 74 Degrees of freedom. The ratio was $0.968$ less than 1 which indicates that the fit overlaps well with the distribution. 

From this we got a counting rate of $C_(op("total")) = 21.6740 plus.minus 1.6239$ cps. Most calculations of uncertainty were done through the symbolic math library _Sympy_ which allows us to easily propagate uncertainty through symbolic expressions programatically, mainly for the dead time. Whereas for the statistical analysis most uncertainties were done manually as the number of variables here were small enough to handle, by using formulae for the subtraction and division of error. 

To correct for the background radiation we just subtract the experimentally found background count which we found was $0.31165 plus.minus 1.77 times 10^(-3)$ cps. Then our source cps was found to be
$21.3623 plus.minus 1.6239$ cps.

= Discussion

We found some acceptable values for count rates, with our sources, However our dead time has a lot of uncertainty due to the change in distance, but since that affects the count rate in a nonstandard way, we cannot propagate it easily. In reality we should redo that experiment if an experimental error like that happens. 

Even with our error in the dead time, we can use it to make our accurate theoretically. If the dead time contributes no extra counts then the counts realistically fall over a time interval of $t' = t-N tau_(op("dead"))$, where $t'$ is the actual time interval. This means our counting rate is now 

$
C = N/(t - N tau)
$ 

This means we would count $N$ counts over a longer time $t' + N tau$  making the count rate look lower than it was. We can then compare the two counting rates, asserting that we are less than 1% off 

$
N/(t' + N tau) >  99/100 N/t' => 100 t' > 99(t' + N tau) => t' > 99 N tau => tau < 1/99 N/t'
$

For our dead time of around 1.5ms, we can say then solve for our actual count rate $C$ to get 

$
&1.5001 times 10^(-3) < 1/99 C \
&=> 1.5001 times 10^-1 - 1.5001 times 10^(-3) < C
&=> 0.14999 < C
$

In our case even with our high dead time, we end up having enough resolution to justify that most of our measurements are accurate to 1%, since they are all greater than this value. This definitely does not affect our high count rate data at all.

= Conclusion

We found the dead time of a G-M Tube was $1.5001 times 10^(-3) plus.minus 8.8366 times 10^(-7)$ s. That was used to measure the background radiation which gave us a count rate of $0.31165 plus.minus 1.77 times 10^(-3)$ cps and that our source had a count rate of $21.3623 plus.minus 1.6239$ cps. 

All of these values agree closely with the expected values we were shooting for, outside of the dead time, which was one magnitude off from the expected. Most error in the results can be attributed to systematic error, but even then we don't have to account for that error in our measurement as it barely affects our data and results we achieved

= Acknowledgements
I'd like to acknowledge my professor Carsten B. Krauss and my lab partner Konal Shah, for helping me with the lab as well as our T.A. Michael Dunsmore, who gave us guidance during the lab.

#heading(level: 1, numbering: none)[References]
#bibliography("bib.bib", title:none, style: "ieee", full: true)

#heading(level: 1, numbering: none)[Appendix]

All code and data can be found at #link("https://github.com/Soybean44/PHYS_295") under the `lab04_radiation/geiger.qmd` file with a PDF copy at `lab04_radiation/geiger.pdf`. The counting data is located at `lab04_radiation/geiger.csv`


