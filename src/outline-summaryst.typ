#import "helpers.typ": calc-elem-size

// randomly generated IDs
#let gs = state("VIvouA", ())
#let elemcounter = counter("k1lRPA")

#let supl = [Custom Heading]


#let style-outline(
  doc,
  outline-title: "Table of Contents",
  page-numbering: "1"
) = [
  #set par(
    justify: true,
  )
  
  #show outline.entry: it => {
    if it.element.supplement != supl {
      return v(-2em)
    }
    let lvl = it.element.level
    let loc = it.element.location()
    
    context {
      // Get all the elements that were added to the document
      let idx = calc.rem(elemcounter.get().first(), gs.final().len())
      let (cnt, subcnt) = gs.final().at(idx)

      if lvl == 1 {
        return link(loc)[
          #v(30pt)
          #set align(center)
          #smallcaps[#text(
            size: 18pt
          )[#cnt]]
          
          #set align(left)
          #subcnt
        ]
      } 
      else {
        return link(loc)[
          #let size = calc-elem-size(it.element)
          
          #set align(center)
          #smallcaps[#text(
            size: size
          )[#cnt]]
          
          #set align(left)
          
          #subcnt #box(width: 1fr, repeat[.]) #it.page
        ]
      }
      return ret
    }
    elemcounter.step()
  }
  
  #show outline: it => [
    #set page(numbering: page-numbering)
    #if outline-title != none [
      #text(size: 18pt, weight: 500)[
        #set align(center)
        #outline-title
      ]
    ]
    #it
    // #pagebreak()
    #set page(numbering: page-numbering)
    #counter(page).update(1)
  ]

  #show heading: it => [
    #if it.supplement != supl {
      return none
    }
    #box(width: 100%)[
      #v(2em)
      
      #let (cnt, subcnt) = gs.get().last()
      
      #cnt
      #set align(center)
      #text(size: 11pt, weight: "regular", style: "italic")[
        #box(width: 80%)[#subcnt]
      ]
      
    ]
    #v(1em)
  ]
  
  #doc
]



#let make-heading(cnt, subcnt, level: 1) = [
  #gs.update(x => {
    // Update the state by including the content and summary
    x.push((cnt, subcnt))
    x
  })

  #heading(level: level, supplement: supl)[]
]




