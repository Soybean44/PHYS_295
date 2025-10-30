#import "PHYS_295_template.typ": report

#show: report.with(
  title: "Lab Report Template",
  author: "Rohith Vedhthaanth Sekar",
  partners: ("Quinn Malin", "Diego Martinez"),
  
  abstract: [This LaTeX document sets out the basic structure of a report.  We will post the full sample report file after allowing time for the editing exercise.  The full file includes examples of equation typesetting, figure placement, and sub-sectioning.]
)

= Introduction
Here are some citations to previous work @Dyson1920 and other
work @Abbot2016.

= Background/Theory
A simple equation to calculate mean is given by:

$ overline(x) = frac(sum_(i = i)^n x_i, n) $ <eq:mean>


When introducing an equation, it is important to define the variables used. For example, it is unclear what $n$ stands for in @eq:mean[Eq.] (note: a reference to the above equation is made here).

= Experimental Details
#figure(image("BikeRidePlot.png"),
  caption: [
    Measured time vs. distance for Lindsay’s bike ride home one evening.
    Red points indicate measured times, with error bars indicating the
    estimated measurement uncertainty of each point (some error bars are
    smaller than marker size).
  ]
)
<fig:setup>

The apparatus used in the CVGT experiment is the remnant of a mercury
manometer equipped with an air-filled glass bulb placed inside a copper
canister (see @fig:setup).

= Results and Analysis
Data is included in @table:data-table provided in the
Appendix section.

#pagebreak()

= Discussion
= Conclusion
= Acknowledgements
#heading(level: 1, numbering: none)[References]

#bibliography("bib.bib", title:none, style: "ieee", full: true)

#heading(level: 1, numbering: none)[Appendix]
#align(center,[#figure(
  table(
    columns: 3,
    align: (center,center,center),
    table.header([Voltage ($V$)], [Current ($A$)], [Resistance
    ($Omega$)]),
    table.hline(),
    [V1], [A1], [R1], 
    [V2], [A2], [R2], 
    [V3], [A3], [R3] 
  )
  , caption: [Data table]
  , kind: table
) <table:data-table>])
For more help with Equations, Figures, and Tables, see:

- #link("https://www.overleaf.com/learn/latex/Mathematical_expressions")
  (accessed 04 Sept 2023)

- #link("https://www.overleaf.com/learn/latex/Inserting_Images");(accessed
  04 Sept 2023)

- #link("https://www.overleaf.com/learn/latex/Tables") (accessed 04 Sept
  2023).
