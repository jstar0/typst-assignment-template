#let font = (
  main: "IBM Plex Serif",
  mono: "SF Mono",
  cjk: "Source Han Serif SC",
)

#show raw: set text(font: (font.mono, font.cjk))

#let problem_counter = counter("problem")

#let p(body) = {
  // let current_problem = problem_counter.step()
  // [*#text*]
  block(fill:rgb(250, 255, 250),
   width: 100%,
   inset:8pt,
   radius: 4pt,
   stroke:rgb(31, 199, 31),
   body)
  }

#let pt(text, body) = {
  // let current_problem = problem_counter.step()
  [*#text*]
  block(fill:rgb(250, 255, 250),
   width: 100%,
   inset:8pt,
   radius: 4pt,
   stroke:rgb(31, 199, 31),
   body)
  }

#let prob(body) = {
  // let current_problem = problem_counter.step()
  [== Problem #problem_counter.step() #problem_counter.display()]
  block(fill:rgb(250, 255, 250),
   width: 100%,
   inset:8pt,
   radius: 4pt,
   stroke:rgb(31, 199, 31),
   body)
  }

// Some math operators
#let prox = [#math.op("prox")]
#let proj = [#math.op("proj")]
#let argmin = [#math.arg]+[#math.min]
#set par(justify: true,first-line-indent: 2em)
#show heading: it =>  {
    it
    par()[#text()[#h(0.0em)]]
}

// Initiate the document title, author...
#let assignment_class(size: 10pt, title, author, course_id, professor_name, semester, due_time, id, body) = {
  set text(font: (font.main, font.cjk), size: size, lang: "zh")
  set document(title: title, author: author)
  set page(
    paper:"a4",
    header: locate( 
        loc => if (
            counter(page).at(loc).first()==1) { none } 
        else { 
            align(right, 
              // [*#author* | *#course_id | #title*]
              [*#author* | *#title*]
            ) 
        }
    ), 
    footer: locate(loc => {
      let page_number = counter(page).at(loc).first()
      let total_pages = counter(page).final(loc).last()
      align(center)[#page_number / #total_pages]
    }))
  // block(height:25%,fill:none)
  line(length: 100%)
  align(left, text(17pt)[
    *#course_id | #title*])
  // align(center, text(10pt)[
  //   截止时间：#due_time])
  let right_text = [
        *#professor_name*]+[*老师*,
        *#semester*,
        截止时间：*#due_time*
      ]
  let left_text = [
    #id *#author*  
  ]

  left_text
  h(1fr)
  right_text
  
  
   
  line(length: 100%)
  // align(left, [#professor_name]+[老师, #semester, #due_time])
  
  // // block(height:35%,fill:none)
  // align(left)[*#author* #id]
  
  // pagebreak(weak: false)
  body
  
    // locate(loc => {
    //   let i = counter(page).at(loc).first()
    //   if i == 1 { return }
    //   set text(size: script-size)
    //   grid(
    //     columns: (6em, 1fr, 6em),
    //     if calc.even(i) [#i],
    //     align(center, upper(
    //       if calc.odd(i) { title } else { author-string }
    //     )),
    //     if calc.odd(i) { align(right)[#i] }
    //   )
    // })

//   if student_number != none {
//     align(top + left)[Student number: #student_number]
//   }

//   align(center)[= #title]
}
