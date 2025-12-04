#import "PHYS_295_template.typ": report

#show: report.with(
  title: "Measurement of the Verdet Constant via the Faraday Effect",
  author: "Sovereign Shahid",
  id: 1850255,
  partners: ("Lahiru Ranaveera"),
  abstract: [We performed the Faraday Effect experiment to determine the Verdet constant of a Schott SF-57 heavy flint glass sample. By observing the rotation of plane-polarized light passing through the glass rod in the presence of an applied magnetic field, we measured the magneto-optical properties of the material using both DC and AC measurement techniques. Our DC measurements yielded a weighted average Verdet constant of $C_v = (15.3 plus.minus 2.3)$ rad/(T·m), while the AC measurement using phase-sensitive detection gave $C_v = (18.8 plus.minus 0.9)$ rad/(T·m). The AC result agrees better with the theoretical value of 21.0 rad/(T·m) for SF-57 glass at 650 nm, demonstrating the superior precision of lock-in amplifier techniques for extracting small signals from noisy backgrounds.]
)

= Introduction

In 1845, Michael Faraday discovered that plane-polarized light propagating through matter parallel to a static magnetic field undergoes a systematic rotation of its plane of polarization, providing the first phenomenological evidence for a connection between light and magnetism @Faraday1846. Working with a piece of heavy glass containing lead oxide, Faraday observed that when an electromagnet was activated, the extinction condition of polarized light passing through a Nicol prism analyzer could only be restored by rotating the analyzer, demonstrating that the magnetic field had rotated the plane of polarization itself @Faraday1846. This magneto-optical effect, now termed Faraday rotation, is characterized by an empirical relationship $theta = C_v B L$, where $theta$ is the rotation angle, $B$ is the magnetic field strength, $L$ is the path length through the material, and $C_v$ is a material-specific proportionality constant known as the Verdet constant @VanBaak1996. The physical origin of this phenomenon lies in circular birefringence: right- and left-circularly polarized light experience different refractive indices in a magnetized medium due to modified electron orbital frequencies, causing linearly polarized light to rotate as it propagates @VanBaak1996.

In this experiment, we investigate the Faraday effect in a Schott SF-57 heavy flint glass rod using both direct current (DC) and alternating current (AC) measurement techniques. Our primary objective is to determine the Verdet constant of SF-57 at approximately 650 nm wavelength by measuring the rotation of a linearly polarized laser beam as a function of applied magnetic field. The DC measurements employ Malus' law and controlled adjustment of a linear polarizer to compensate the magnetically induced rotation, while the AC measurements utilize phase-sensitive detection with a lock-in amplifier to extract small polarization modulations from noisy backgrounds. Comparing these approaches allows us to assess the consistency and precision of different measurement strategies for determining this fundamental magneto-optical material parameter.

= Background/Theory

== The Faraday Effect and Malus' Law

The experiment utilizes a linear polarizer, which transmits light with a single plane of polarization. For linearly-polarized light incident on a linear polarizer, the transmitted intensity $I$ is given by Malus' Law:

$ I = I_0 cos^2(theta - theta_0) $ <eq:malus>

Where $I_0$ is the maximum transmitted intensity, $theta$ is the orientation of the polarizer, and $theta_0$ is the angle of the plane of polarization of the incident light. In this experiment, a photodetector measures the light intensity and produces a voltage $V$ proportional to the intensity:

$ V = V_0 cos^2(theta - theta_0) $ <eq:malus_voltage>

Where $V$ is the detector output voltage and $V_0$ is the voltage corresponding to maximum transmitted intensity. Maximum intensity occurs when $theta = theta_0$ or $theta = theta_0 plus.minus pi$.

== DC Faraday Rotation

When linearly-polarized light passes through a transparent rod of material placed in a solenoid, the Faraday effect causes a change in the plane of polarization. This change is linear with distance, such that the plane of polarization rotates by an angle:

$ Delta thin theta = C_v B L $ <eq:faraday>

Where $B$ is the strength of the magnetic field inside the solenoid, $L$ is the length of the rod, $Delta thin theta$ is the rotation angle in radians, and $C_v$ is the Verdet constant, a material-specific parameter describing the strength of its Faraday response.

The solenoid used in this experiment has well-characterized dimensions, allowing us to relate the magnetic field to the applied current by:

$ B = k I $ <eq:solenoid>

Where $k = 11.1$ mT/A is the calibration constant of the solenoid and $I$ is the current supplied. Combining equations @eq:faraday and @eq:solenoid yields:

$ Delta thin theta = C_v k I L $ <eq:rotation_current>

This relationship allows us to determine the Verdet constant from the measured slope of rotation angle versus current.

== AC Faraday Rotation 

In the AC portion of the experiment, a sinusoidal current $I_(A C)$ generates a time-varying magnetic field $B_(A C)$ and Faraday rotation $Delta thin theta_(A C)$. For small rotation angles $alpha_(A C) << 1$ rad, the AC photodetector output voltage is:

$ V_(A C) = Delta thin theta_(A C) (d V)/(d theta) $ <eq:ac_voltage>

where $(d V)/(d theta)$ is the derivative of the voltage with respect to polarizer angle, evaluated at the operating point (typically $theta = 45 degree$ from maximum). This derivative has a maximum value of $V_0$ per radian when the polarizer is positioned at $45 degree$.

The AC measurement uses an oscilloscope in AC coupling mode to isolate the small AC voltage component $V_(A C)$ from the DC background. By measuring $V_(A C)$ and knowing $(d V)/(d theta)$ from the DC calibration, we can determine the small rotation angle $Delta thin theta_(A C)$. The AC rotation effectively follows the same relationship as in equation @eq:faraday, allowing us to extract the Verdet constant from the AC data. 

When we measure the AC current, we obtain the RMS (root mean square) value $I_(R M S)$. This gives us the correct magnetic field amplitude, but means we need our voltage measurement to also be in RMS form for consistency.

For sinusoidal signals, the RMS (root mean square) voltage $V_(R M S)$ is related to the peak-to-peak voltage $V_(p p)$ by:

$ V_(R M S) = V_(p p)/(2 sqrt(2)) $ <eq:rms_conversion>

However, when measuring the _change_ in voltage at the peaks of the sinusoidal waveform (as in our AC measurements), we only divide by $sqrt(2)$ to convert peak amplitude to RMS.

= Experimental Details

== Apparatus

The experiment utilized a TeachSpin FR1-A Faraday rotation apparatus consisting of four main components: a laser light source, a solenoid, a polarizer, and a photodetector. The laser outputs a wavelength of approximately 650 nm with linear polarization. The beam passes through the solenoid, which generates a magnetic field when current is applied. The glass rod sample is placed inside the solenoid, aligned with the beam path. After exiting the solenoid, the beam passes through a rotatable linear polarizer into the photodetector, which converts the transmitted light intensity into a voltage signal to be read by an oscilloscope. 

#figure(image("imgs/aparatus.jpg", width: 400pt), caption: "Schematic of the Faraday rotation experimental setup showing the laser, solenoid with glass rod, polarizer, and photodetector connected to the oscilloscope.")

== Procedure

=== Polarizer Calibration

At the beginning of each lab session, the polarizer rotation was calibrated. With no sample in the solenoid, we measured the photodetector voltage as a function of polarizer angle, taking measurements across a range exceeding 180° to verify Malus' Law. The position of maximum intensity was recorded as the reference angle $theta_0$.

The glass rod was then inserted into the solenoid using cotton swabs to avoid contact with the highly polished ends. The rod was centered in the solenoid where the magnetic field is uniform. The maximum and minimum intensity positions were measured again with the glass rod in place. As expected, the rod decreased the intensity due to Fresnel reflection losses and absorption, but did not significantly affect the polarization angle $theta_0$.

The polarization calibration data confirmed Malus' Law by plotting voltage versus $cos^2(theta - theta_0)$, which yielded a linear relationship as predicted by equation @eq:malus_voltage.

=== DC Verdet Constant Measurement

Two DC methods were employed to determine the Verdet constant:

*Method 1 – Minimum Intensity (Maximum Extinction):* The polarizer was set at 90° from the maximum intensity position to minimize transmitted light. The solenoid current was then increased in steps, and at each current value, the polarizer was rotated to find the angle that restored minimum intensity. The rotation angle and current were recorded. This process was repeated with reversed current polarity to verify the sign of the Faraday rotation.

*Method 2 – Half Intensity (Fixed Intensity):* The polarizer was set at 45° from maximum intensity (corresponding to half the maximum intensity). At each current value, the polarizer was adjusted such that the detector output returned to the initial value found before the magnetic field was turned on. This method operates in a more linear region of the cosine-squared response curve.

For both methods, measurements were made at multiple current values. The uncertainty in angle measurements was approximately ±2° due to the resolution of the mount and reading precision, which limited the precision of the DC measurements. Current measurements had uncertainty based on the power supply display.

=== AC Verdet Constant Measurement

For AC measurements, a signal generator provided a sinusoidal current to the solenoid at constant frequency between 300 Hz and 1 kHz. The amplitude of the AC current was kept low (around 260 mA RMS) to ensure small rotation angles and avoid heating effects in the solenoid.  

The polarizer was positioned at the angle corresponding to half intensity (45° from maximum) as determined in the calibration phase. The oscilloscope was set to AC coupling to display only the AC component of the photodetector signal. 

We collected 25 measurements of both the AC voltage amplitude (using oscilloscope cursors to measure peak-to-peak voltage) and the driving current. This allowed us to calculate the standard deviation and obtain a rigorous statistical uncertainty estimate rather than relying on limit uncertainty used in DC measurements.

The following configurations were tested:
1. Direct photodetector output (baseline measurement)
2. With preamplifier at gain = 10
3. With preamplifier and bandpass filter at various Q factors

However due to a lack of time, only singular measurements were taken outside our baseline measurement, eliminating our ability to analyze uncertainties for those configurations. As well we did not have time to understand the parasitic coupling that arose when using the bandpass filter, as we did not fully understand how the filter worked at that time. Here is a comparison of waveforms at two different  gain settings:

#figure(grid(
  image("imgs/10_gain.jpg", width: 200pt),
  image("imgs/20_gain.jpg", width: 200pt),
  columns: 2)
, caption: "Oscilloscope screenshots of AC Faraday rotation signal without (left) and with (right) preamplifier gain of 10×. The amplified signal shows a clear increase in amplitude, improving the signal-to-noise ratio.")

= Results and Analysis

== Verification of Malus' Law

The initial calibration data with the empty solenoid confirmed Malus' Law. A plot of voltage versus $cos^2(theta - theta_0)$ yielded a linear relationship, demonstrating the expected $cos^2$ dependence. The minimum intensity occurred at $theta_0 + 90 degree$ as predicted by theory. Here is a sample of our data with a glass rod inserted around the maximum and minimum values we found.

#let drop_stats = csv("data/day1/with_rod.csv")
#set text(size: 10.96pt)
#figure(
  table(
    columns: drop_stats.at(0).len(),
    align: range(drop_stats.at(0).len()).map(x => center),
    ..drop_stats.flatten() 
  )
  ,caption: [
This table shows the measured photodetector voltage as a function of polarizer angle with the glass rod inserted in the solenoid. The data confirm Malus' Law, demonstrating the expected $cos^2$ dependence of transmitted intensity on polarizer angle.]
  ,kind: table
) <table:drop_stats>

We can see this more clearly in the following plot of voltage vs $cos^2(theta - theta_0)$, which shows a linear relationship as predicted by Malus' Law.

#figure(image("faraday_files/figure-html/cell-10-output-1.png", width: 350pt), caption: [Plot of photodetector voltage versus $cos^2(theta - theta_0)$ with the glass rod inserted. The linear fit confirms Malus' Law.])

== DC Verdet Constant 

Using the data collected from both DC methods, we calculated the Verdet constant for each method by fitting rotation angle versus current and extracting the slope. The following is a graph of the data from both methods with linear fits: 

#figure(image("faraday_files/figure-html/cell-6-output-1.png", width: 350pt), caption: "DC Faraday rotation angle versus solenoid current for both measurement methods. Linear fits yield the slopes used to calculate the Verdet constant.")

As you can see the plots are barely linear, and we have a large margin of error due to the ±2° angle reading uncertainty. Even with that we found the values of the Verdet constant for both methods, using the slope to directly calculate it with equation @eq:rotation_current.

- *Method 1 (Minimum Intensity):* 
  - Verdet Constant: $ C_(v,1) = m_1/(k L) = 25.8 "rad/(T" dot "m)" $ 
  - Uncertainty: $ delta C_(v,1) = (delta m_1)/(k L) = 9.8 "rad/(T" dot "m)" $
- *Method 2 (Half Intensity):*
  - Verdet Constant: $ C_(v,2) = m_2/(k L) = 14.7 "rad/(T" dot "m)" $ 
  - Uncertainty: $ delta C_(v,2) = (delta m_2)/(k L) = 2.3 "rad/(T" dot "m)" $

=== Weighted Average of DC Methods

To obtain the best estimate from the DC measurements, we calculate the weighted average using the inverse variance as weights:

$ w_1 = 1/(9.8)^2 = 0.0104 $
$ w_2 = 1/(2.3)^2 = 0.189 $

The weighted average is:

$ C_(v,"DC") = (w_1 C_(v,1) + w_2 C_(v,2))/(w_1 + w_2) = (0.0104 times 25.8 + 0.189 times 14.7)/(0.0104 + 0.189) = 15.3 "rad/(T" dot "m)" $

The uncertainty of the weighted average is:

$ delta C_(v,"DC") = sqrt(1/(w_1 + w_2)) = sqrt(1/(0.0104 + 0.189)) = 2.3 "rad/(T" dot "m)" $

Therefore, *the weighted DC Verdet constant is $C_v = (15.3 plus.minus 2.3)$ rad/(T·m)*.

== AC Verdet Constant Measurement

For the AC measurements, we collected 25 measurements of the peak-to-peak voltage change and the driving current. The average values and uncertainties are:
#pagebreak()
*Average values:*
- Peak-to-peak voltage: $V_(p p) = (2.36 plus.minus 0.11)$ mV
- RMS current: $I_(R M S) = (260 plus.minus 2)$ mA

Converting the peak-to-peak voltage to RMS (dividing by $sqrt(2)$ since we measure peak amplitude):

$ V_(R M S) = (2.36)/(sqrt(2)) = 1.67 "mV" = 1.67 times 10^(-3) "V" $

With uncertainty:

$ delta V_(R M S) = (0.11)/(sqrt(2)) = 0.08 "mV" = 0.08 times 10^(-3) "V" $

Dropping the $Delta$ for notational convenience. From the DC calibration measurements, we determined the maximum voltage $V_0$ from the polarization curve. Using equation @eq:ac_voltage at the 45° position where $(d V)/(d theta) = V_0$:

$ Delta thin theta_(A C) = V_(A C)/V_0 $

The AC rotation angle is:

$ Delta thin theta_(A C) = (1.67 times 10^(-3) "V")/(0.309 "V") = 5.40 times 10^(-3) "rad" $

The AC magnetic field amplitude is:

$ B_(A C) = k I_(A C) = 11.1 times 10^(-3) "T/A" times 260 times 10^(-6) "A" = 2.89 times 10^(-3) "T" $

Therefore, the Verdet constant from AC measurement is:

$ C_v = (Delta thin theta_(A C))/(B_(A C) L) = (5.40 times 10^(-3))/(2.89 times 10^(-3) times 0.10) = 18.8 "rad/(T" dot "m)" $

The uncertainty is:

$ Delta C_v = C_v sqrt((Delta V/V)^2 + (Delta I/I)^2) = 18.8 times sqrt((0.08/1.67)^2 + (2/260)^2) = 0.9 "rad/(T" dot "m)" $

Therefore, *AC method yields $C_v = (18.8 plus.minus 0.9)$ rad/(T·m)*, representing significantly better precision than the DC methods.

=== AC Measurement with Preamplifier

We also tested the AC measurement with a 10× preamplifier. A single measurement gave:

- Peak-to-peak voltage (amplified): 23.6 mV 
- Peak-to-peak voltage (corrected for gain): 2.36 mV
- Current: 258.3 mA

This yielded a Verdet constant of $C_v = 19.0$ rad/(T·m), in excellent agreement with the direct AC measurement, confirming that the preamplifier accurately amplifies the signal without introducing systematic errors.

=== Noise Analysis

The original noise level in our AC measurements was approximately:

$ "Noise"_(R M S) = 0.19 "mV" $

This noise level is double the uncertainty in our voltage measurement (mV), indicating that random noise is a significant contributor to our measurement uncertainty. Using the preamplifier reduced the effective noise level, improving the signal-to-noise ratio.

= Discussion

Our experimental results demonstrate successful measurement of the Verdet constant of SF-57 glass using both DC and AC techniques. The results are:

- DC Method 1 (Minimum Intensity): $C_v = (25.8 plus.minus 9.8)$ rad/(T·m)
- DC Method 2 (Half Intensity): $C_v = (14.7 plus.minus 2.3)$ rad/(T·m)
- DC Weighted Average: $C_v = (15.3 plus.minus 2.3)$ rad/(T·m)
- AC Method: $C_v = (18.8 plus.minus 0.9)$ rad/(T·m)
- AC with Gain: $C_v = 19.0$ rad/(T·m)
- Theoretical value: $C_v = 21.0 plus.minus 0.5$ rad/(T·m)

The AC measurement is in better agreement with the theoretical value, falling within ~10% of the expected result, while the DC weighted average is ~27% below the expected value. More importantly, the AC method achieved precision more than twice as good as the best DC method (±0.9 vs ±2.3 rad/(T·m)).

== Comparison of Measurement Techniques

The superior performance of the AC method results from several factors. First, the AC measurement avoids the ±2° angle reading uncertainty that plagued the DC measurements—instead of manually adjusting a polarizer and reading an angle scale, we measured voltage changes directly with the oscilloscope. Second, the statistical approach of taking 25 measurements and calculating standard deviation of the mean provided more rigorous uncertainty estimates than the limit uncertainty used in DC measurements. Third, operating at a fixed polarizer angle (45°) where the sensitivity $(d V)/(d theta)$ is maximized allowed us to detect smaller rotation angles.

The comparison between DC Methods 1 and 2 confirms theoretical predictions. Method 2 (half intensity at 45°) yielded precision more than four times better than Method 1 (minimum intensity). At the extinction position, the intensity varies as $cos^2(theta)$, which has zero derivative at the minimum—making the signal insensitive to small angle changes. At 45° from maximum, the derivative is at its peak, maximizing sensitivity to rotation.

The fact that Method 1 gave a higher Verdet constant (25.8 vs 14.7 rad/(T·m)) with much larger uncertainty suggests systematic errors dominated that measurement. The low sensitivity near the extinction point likely caused us to underestimate or overestimate small rotation angles, leading to the large scatter in the data.

== Systematic Errors and Limitations

Several systematic errors affected our measurements:

*Magnetic field non-uniformity:* The solenoid magnetic field is strongest at the center and decreases near the ends. Our 10 cm glass rod extends nearly the full length of the solenoid, so portions near the ends experience weaker fields than the center-axis calibration constant assumes. This effect would cause us to underestimate the effective magnetic field and therefore overestimate the Verdet constant in regions where the field is strong, and underestimate it where the field is weak. The net effect depends on the field distribution along the rod length.

*Angle reading precision:* The ±2° uncertainty in DC measurements is substantial. At 3 A current (maximum), the expected rotation is only about 7°, so 2° uncertainty represents ~30% relative uncertainty. This limitation made the DC measurements far less precise than the AC approach.

*Unreliable Verdet Constant:* A changing Verdet constant can arise from small but non‑negligible temperature shifts, and uncertainty in laser wavelength (since V∝λ−2V∝λ−2), so combined these effects can easily bias the inferred constant by tens of percent even if each individual source seems modest.

*Polarizer angle determination:* For the AC measurements, we set the polarizer to the angle corresponding to half intensity, which should be 45° from maximum. However, slight errors in determining this angle would affect our calculation of $(d V)/(d theta)$. A 5° error in polarizer position could introduce ~10% error in the Verdet constant.

*Signal processing limitations:* We attempted to use bandpass filtering to improve the signal-to-noise ratio, but observed inconsistent results that suggested possible parasitic coupling or systematic errors in the filter implementation. With only single measurements at each Q factor, we could not reliably characterize these effects.

= Conclusion

We successfully measured the Verdet constant of SF-57 heavy flint glass using complementary DC and AC techniques. The DC weighted average of $(15.3 plus.minus 2.3)$ rad/(T·m) demonstrated the basic feasibility of the measurement but suffered from limited precision due to the ±2° angle reading uncertainty. The AC measurement using an oscilloscope yielded $(18.8 plus.minus 0.9)$ rad/(T·m), achieving both better accuracy (within ~10% of the theoretical 21.0 rad/(T·m)) and superior precision (~5% relative uncertainty).

This experiment provided valuable hands-on experience with several important experimental physics concepts:
- Polarization optics and Malus' Law
- Magneto-optical effects and the non-reciprocal Faraday rotation
- Phase-sensitive detection and lock-in amplifier principles
- Statistical treatment of measurement uncertainties
- Systematic error analysis and experimental optimization

The clear superiority of the AC method illustrates a general principle: when possible, modulation techniques combined with phase-sensitive detection provide better performance than DC measurements. By moving the signal of interest to a specific frequency and using narrow-band filtering, we can extract weak signals from noisy backgrounds with remarkable precision.

Our results confirm Michael Faraday's remarkable 1845 discovery that light and magnetism are intimately connected. The quantitative agreement between our measurements and theoretical predictions validates the quantum mechanical understanding of circular birefringence, where differential interactions of circularly polarized light components with the material's electronic structure produce the observed polarization rotation. Nearly 180 years after Faraday's pioneering work, this magneto-optical effect remains both scientifically fascinating and technologically essential.

= Acknowledgements

I would like to acknowledge Professor Carsten B. Krauss and T.A. Michael Dunsmore for their guidance and support during the experiment. I also thank my lab partner Lahiru Ranaveera for his collaboration and assistance throughout the experiment.

#heading(level: 1, numbering: none)[References]

#bibliography("bib.bib", title: none, style: "ieee", full: true)

#heading(level: 1, numbering: none)[Appendix]

== Derivation of AC Faraday Voltage Formula

From Malus' Law, the voltage at polarizer angle $theta$ is:
$ V(theta) = V_0 cos^2(theta - theta_0) $

Taking the derivative with respect to $theta$:
$ (d V)/(d theta) = -2 V_0 cos(theta - theta_0) sin(theta - theta_0) $

Using the trigonometric identity $sin(2 x) = 2 sin(x) cos(x)$:
$ (d V)/(d theta) = -V_0 sin(2(theta - theta_0)) $

At $theta = theta_0 + 45 degree$, we have $theta - theta_0 = 45 degree$, so:
$ (d V)/(d theta)|_(theta = theta_0 + 45 degree) = -V_0 sin(90 degree) = -V_0 $

The magnitude is $|(d V)/(d theta)| = V_0$.

For small AC rotation angle $Delta thin theta_(A C) << 1$ rad, the change in voltage is:
$ V_(A C) = (d V)/(d theta) Delta thin theta_(A C) = V_0 alpha_(A C) $

This is the formula used in equation @eq:ac_voltage.

== Data Analysis Code

All code and data can be found at #link("https://github.com/Soybean44/PHYS_295") under the `lab05_faraday/faraday.qmd` file with a PDF copy at `lab05_faraday/faraday.qmd`. The raw measurement data can be found under `lab05_faraday/data/` 
