#let inkblue = rgb("#15048f")
#let vspacing = v(2mm)
#let abstract-fn(body) = {
  align(center)[
    #box(
      width: 95%,
      radius: 0.4em,
      stroke: inkblue,
      inset: 14pt,
      fill: inkblue.lighten(80%),
    )[
      #align(center, text(11pt, weight: "bold", fill: inkblue.darken(20%))[#smallcaps[abstract]])
      #set text(9pt, font: "Latin Modern Sans", fill: inkblue)
      #set align(left)
      #set par(justify: true, leading: 0.48em)
      #body
    ]
  ]
} 

// yaml members - title, abstract 
#let typ-pdf(
  // The paper's title.
  title: none,
  abstract: none,
  // The paper's content.
  body,
) = {
  set page(paper: "a4", margin: 1in, header: [
    #set text(8pt)
    #h(1fr) #text(font: "Latin Modern Sans")[working preprint]
  ])

align(center)[
  #text(14pt, font: "Latin Modern Sans", weight: "bold", fill: inkblue)[#title]\
  #vspacing
  #text(10pt, font: "New Computer Modern", fill: inkblue)[
    *Raunak Farhaz*\
    Independent Researcher, Berlin, DE\
    #show link: set text(font: "Latin Modern Mono", weight: "bold", fill: maroon)
    #show link: underline
    #link("mailto:farhazraunak@gmail.com")
  ]
]
set math.equation(numbering: "[1]")
set text(11pt, font: "New Computer Modern")
set heading(numbering: "1.a.I.")
set par(justify: true)
show heading: it => {
  set align(center)
  set text(11pt, fill: inkblue)  
  upper(text(font: "Latin Modern Sans")[#it])
  v(2.5mm)
}

vspacing
abstract-fn([#abstract])
vspacing

body

}