#set text(font: "Times New Roman")
#let report(title: str, author: str, id: int, partners: array, abstract: content, doc) = {
set page(numbering: "1.")
set align(center)
// #show heading: set block(above: 8 * 1.65em, below: 1.65em)
show heading.where(level: 1): set text(1.5em)
show heading.where(level: 2): set text(1.5em, weight: "regular")

[
= Phys 295 A01-B
== #title
]
line(length: 100%, stroke: 0.5pt)
block(above: 8 * 1.65em, below: 1.65em, context {
let content = [
  #author

  Student ID: #id

  Partners: #if type(partners) == str {partners} else {partners.join(", ")}
  
  Date: #datetime.today().display(
    "[day]-[month repr:short]-[year]"
  )
]
let width = measure(content).width
line(length:  width * 1.1, stroke: 0.5pt)
content
line(length: width * 1.1, stroke: 0.5pt)
})
show heading.where(level: 1): set text(0.5em)
if abstract != none {
  block(below: 1.65em, )[
  = Abstract
  #set align(left)
  #set par(justify: true)
    #h(24pt) #abstract 
  ]
}
pagebreak()


// show heading: it => pad(bottom: 0.5em, text(it, 14pt, weight: "bold"))
set heading(numbering: "1.")
show heading: set text(14pt, weight: "bold")
set par(
  first-line-indent: 1em,
  spacing: 1.5em,
  justify: true
)
set align(left)
set math.equation(numbering: "(1)")
set table(
  fill: (x, y) => if y == 0 {
    gray.lighten(40%)
  },
  align: (x, y) => (
    if y == 0 { left }
    else { center }
  )
)
show link: set text(fill: rgb("#0000FF"))
doc
}

