
#let font = (
  main: "IBM Plex Serif",
  mono: "SF Mono",
  cjk: "Source Han Serif SC",
)

#let problem_counter = counter("problem")

// 空白的 problem block
#let p(body) = {
  // let current_problem = problem_counter.step()
  // [*#text*]
  v(-0.5em)
  block(fill:rgb(250, 255, 250),
   width: 100%,
   inset:8pt,
   radius: 4pt,
   stroke:rgb(31, 199, 31),
   body,
   )
  v(-0.5em)
  }
  

// 可自定义文本的 problem block
#let pt(text, body) = {
  // let current_problem = problem_counter.step()
  // v(0.2em)
  [*#text*]
  v(-0.5em)
  block(fill:rgb(250, 255, 250),
   width: 100%,
   inset:8pt,
   radius: 4pt,
   stroke:rgb(31, 199, 31),
   body)
  v(0.5em)
  }

// 自动编号的 problem block
#let prob(text, body) = {
  // let current_problem = problem_counter.step()
  v(0.5em)
  [*问题 #problem_counter.step() #problem_counter.display()：*#text]
  // v(0.5em)
  // block(
  //   // fill:rgb(250, 255, 250),
  //  width: 100%,
  //  inset:(left: 1em),
  // //  radius: 4pt,
  // //  stroke: rgb(31, 199, 31),
  //  body)
   body
  }

// Some math operators
#let prox = [#math.op("prox")]
#let proj = [#math.op("proj")]
#let argmin = [#math.arg]+[#math.min]



// Initiate the document title, author...
#let assignment_class(size: 10pt, title, author, course_id, professor_name, semester, due_time, id, body) = {

  show heading.where(
    level: 1
  ): it => [
    #it
    #v(0.2em)
  ] 

  show heading.where(
    level: 2
  ): it => [
    #v(-0.3em)
    #it
  ]
  
  set text(font: (font.main, font.cjk), size: size, lang: "zh")
  set heading(numbering: (..args) => {
    let nums = args.pos()
    if nums.len() == 1 {
      return numbering("一、", ..nums)
    } else {
      return numbering("1.1", ..nums)
    }
  })
  set raw(tab-size: 4)
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
    *#title*])
  
  let left_text = [
    *#author* #id
  ]
  let mid_text = [*#course_id* | 
        *#professor_name*]+[*老师*,
        *#semester*
      ]
  let right_text = [| *截止时间：*#due_time]

  if due_time == none or due_time == "" {
    right_text = []
  }
  

  left_text
  h(1fr)
  mid_text
  right_text
  
  
   
  line(length: 100%)
  // align(left, [#professor_name]+[老师, #semester, #due_time])
  
  // // block(height:35%,fill:none)
  // align(left)[*#author* #id]
  
  // pagebreak(weak: false)
  set raw(tab-size: 4)
  
  show raw: set text(font: (font.mono, font.cjk))
  // Display inline code in a small box
  // that retains the correct baseline.
  show raw.where(block: false): box.with(
    fill: luma(240),
    inset: (x: 3pt, y: 0pt),
    outset: (y: 3pt),
    radius: 2pt,
  )

  // Display block code in a larger block
  // with more padding.
  let style-number(number) = text(gray)[#number]
  show raw.where(block: true): it => block(
    fill: luma(240),
    inset: 10pt,
    radius: 4pt,
    width: 100%,
  )[#grid(
  columns: (1em, 1fr),
  align: (right, left),
  column-gutter: 0.7em,
  row-gutter: 0.6em,
  ..it.lines
    .enumerate()
    .map(((i, line)) => (style-number(i + 1), line))
    .flatten()
)]
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