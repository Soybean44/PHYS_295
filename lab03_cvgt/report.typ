#import "PHYS_295_template.typ": report
#import "@local/helpers:1.0.0": code_blk

#show: report.with(
  title: "Constant Volume Gas Thermometer",
  author: "Sovereign Shahid",
  id: 1850255,
  partners: ("Li Hong", "Konal Shah"),
  abstract: none
)

= Results and Analysis

Our data if listed in the appendix, but to process it we simplified the data into @table:data, which you can see below. 

#let processed_data = csv("processed_data.csv")
#set text(size: 10.96pt)
#figure(
  table(
    columns: processed_data.at(0).len(),
    align: range(processed_data.at(0).len()).map(x => center),
    ..processed_data.slice(0,7).flatten() 
  )
  ,caption: [
    #set text(size: 12pt)
    This table contains the average pressure in a given file. Each file name contains the temperature, which is separated into its own column. As you can see, entry number 3 is marked as initial pressure, which we use to shift all the pressures relative to the atmospheric pressure measured in the room. All temperatures have an uncertainty of $plus.minus 0.1 degree$C. All the csv data can be found in the appendix labelled by file path.
  ]
  ,kind: table
) <table:data>
#set text(size: 12pt)

With all this data we then shifted the pressure by the initial pressure (making sure to propagate uncertainty as we did this). Our measured value for atmospheric pressure $70.22 plus.minus 0.01$ cmHg.

The data follows the function
$
P V = n R T
$ <eq:pvnrt>

However there are some caveats to this. $P$ is absolute pressure and $T$ is absolute temperature (measured in Kelvin). To do this, we need to insert the conversion factors we have and linearize it like so

$
P_(op("rel")) + P_(op("atm")) = ((n R)/V) T + ((n R)/V) (-T_0)
$ <eq:linear>

In Celsius, $0 degree$ is the freezing temperature with water but since @eq:pvnrt wants Temperature in Kelvin that means the temperature in the intercept is the corresponding value in Kelvin. Since the distance between any two values in Celsius and Kelvin are the same, we can just subtract that value from the corresponding Celsius temperature to get the absolute value in Kelvin. This ends up being the reason we have $-T_0$ since the absolute value is negative, but the intercept is positive.


#figure(
  image("./lab3_files/figure-html/cell-7-output-1.png", width: 75%),
  caption: [This graph depicts the correlation between absolute temperature and pressure As you can wee we added a line of best fit, which correlates nicely with the data. There are error bars here, but relative to the scale they do not register. As well there are lines indicating the room temperature and atmospheric pressure, which intersect at our initial pressure point.]
) <fig:plot>

The fit of the data matched very nicely with our graph, and we got a slope of $0.321 plus.minus 0.003 op("kPa/")degree$C as well as an intercept of $86.4 plus.minus 0.1 op("kPa")$. From this we can calculate Absolute zero by getting the negative of the intercept like so from @eq:linear

$
T_0 = -b/m
$

Our uncertainty propagates by the equation

$
sigma_t = sqrt((sigma_b/m)^2 + ((b sigma_m)/m^2)^2)
$ <eq:error>

This gets us our final value for absolute zero at $-268.91 plus.minus 2.53 degree$ C

= Discussion
According to NIST @nist, $0 degree$ C is defined to be 273.15 Kelvin. Since 0 Kelvin is defined to be absolute 0, by simple algebra this means that absolute zero in Celsius is $-273.15 degree$ C. We had measured a value of $-268.91 plus.minus 2.53 degree$ C. Calculating a test statistic from this gives us $t^*= 1.68$, which gives us the confidence interval of about 90.7%. This is fairly good agreement, and shows we were on the right track.

To minimize the error further and get a more precise value of absolute zero, we may want to try measuring and propagating the error of temperature, which we currently don't have the knowledge to implement. As well, the error in the atmospheric pressure is much higher due to the fact that we manually measured the atmospheric data as opposed to using a sensor to measure it. This could also be helpful for measuring the temperature as well in the future.

= Conclusion
We used a glass bulb submerged in water holding a constant volume of gas. As the water heated up the bulb the pressure inside fluctuated. This correlation allowed us to find the temperature of absolute zero in 

= Acknowledgements
#heading(level: 1, numbering: none)[References]
I'd like to acknowledge my professor Carsten B. Krauss and my lab partners Li Hong and Konal Shah, for helping me with the lab as well as our T.A. Michael Dunsmore, who helped us understand the measurement of atmospheric pressure and the use of a vernier scale.

As well to note Li Hong typically is not my lab partner, however his lab partner could not make it so he joined our group for the day.

#bibliography("bib.bib", title:none, style: "ieee", full: true) 

#heading(level: 1, numbering: none)[Appendix]

#let pressure_files = (
  "heating_measurement/initial_pressure.csv",
  "heating_measurement/pressure_1.8_Celsius.csv",
  "heating_measurement/pressure_18.0_Celsius.csv",
  "heating_measurement/pressure_28.0_Celsius.csv",
  "heating_measurement/pressure_37.3_Celsius.csv",
  "heating_measurement/pressure_49.9_Celsius.csv",
  "heating_measurement/pressure_60.0_Celsius.csv",
  "heating_measurement/pressure_70.8_Celsius.csv",
  "heating_measurement/pressure_79.1_Celsius.csv",
  "cooling_measurement/pressure_45.2_Celsius.csv",
  "cooling_measurement/pressure_51.0_Celsius.csv",
  "cooling_measurement/pressure_60.0_Celsius.csv",
  "cooling_measurement/pressure_70.6_Celsius.csv",
)

#let tables = pressure_files.map(file => {
  let data = csv(file)
  figure(
    table(
      columns: data.at(0).len(),
      align: range(data.at(0).len()).map(x => center),
      ..data.flatten() 
    )
    ,caption: [#file]
    ,kind: table
  )
})

When doing the data analysis the main issue was summarizing all the csv files returned by the raspberry pi. To do this I made a function which traversed a directory and for every csv file it created @table:data. 

#code_blk[```python
def read_dir(directory_path, records):
  for filename in os.listdir(directory_path):
    if filename.lower().endswith(".csv"):
      file_path = os.path.join(directory_path, filename)
      df = pd.read_csv(file_path)
      avg_pressure = df["Pressure(kPa)"].mean()
      std_pressure = df["Pressure(kPa)"].std()
      # we recorded initial temperature in our book 
      # instead of in the filename 
      temperature = (22.5 if filename == "initial_pressure.csv" 
        else float(filename.split("_")[1]))
      records.append({"file_path": file_path, 
        "temperature": temperature, 
        "avg_pressure": avg_pressure, 
        "std_pressure": std_pressure})
```]

The argument "records" is supposed to be a list of dictionaries, which we can then convert to a pandas data-frame easily. We also use pandas functions such as mean and std to extract the mean pressure and corresponding error for each data-point.

From there the most difficult portion of the analysis was propagating said error, in which passing it into scipy's curve_fit() function 

//#grid(columns: 3,
//  ..tables
//)

