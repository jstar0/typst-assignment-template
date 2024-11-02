#import "@preview/numbly:0.1.0": numbly

#let default_font = (
  main: "IBM Plex Sans",
  mono: "IBM Plex Mono",
  cjk: "Noto Serif SC",
  math: "IBM Plex Math",
  math-cjk: "Noto Serif SC",
)

#let problem_counter = counter("problem")
#let prob-solution_counter = counter("prob-solution")

#let prob_block(body) = {
  // v(-0.5em)
  block(
    fill: rgb(253, 255, 253),
    width: 100%,
    inset: 8pt,
    radius: 8pt,
    stroke: (paint: rgb(51, 199, 51)),
    body,
  )
}

#let speci_block(title, body, breakable: false) = block(
  breakable: breakable,
  (
    context {
      // v(-0.5em)
      block(
        fill: rgb("#1f84c7"),
        width: 100%,
        inset: (left: 8pt, top: 4pt, bottom: 4pt),
        radius: (top: 8pt, bottom: 0pt),
        stroke: rgb("#1f84c7"),
      )[
        #set heading(numbering: none)

        #set text(fill: white)
        // #v(0.3em)
        ==== #title
        // #v(-0.3em)
      ]
      v(-12pt)
      block(fill: rgb("#fcfdff"), width: 100%, inset: 8pt, radius: (top: 0pt, bottom: 8pt), stroke: rgb("#1f84c7"))[
        // #v(0.5em)
        #body
      ]
    }
  ),
)

#let prob(text, body) = {
  v(0.25em)
  [
    #set heading(numbering: none)
    === #text
  ]
  // v(0.5em)
  if body == [] {
    v(0.5em)
  } else {
    v(-0.5em)
    prob_block(body)
  }
}

#let cprob(text, body) = {
  v(0.25em)
  [
    #set heading(numbering: none)
    #problem_counter.step()
    === 问题 #context{problem_counter.display()}：#text
  ]
  // v(0em)
  if body == [] {
    v(0.5em)
  } else {
    v(-0.5em)
    prob_block(body)
  }
}

#let cqa(title, body) = {
  v(0.25em)
  [
    #set heading(numbering: none)
    #prob-solution_counter.step()
    === 问题 #context{prob-solution_counter.display()}：#title
  ]
  // v(0.5em)
  if body == [] {
    v(0.5em)
  } else {
    v(-0.5em)
    speci_block([解决方式], body)
  }
}

// Some math operators
#let prox = [#math.op("prox")]
#let proj = [#math.op("proj")]
#let argmin = [#math.arg] + [#math.min]

#let assignment_class(
  size: 10.5pt,
  title,
  author,
  course_id,
  professor_name,
  semester,
  due_time,
  id,
  font: default_font,
  lang: "zh",
  region: "cn",
  body,
) = {

  set text(font: (font.main, font.cjk), size: size, lang: lang, region: region)




  show heading: it => {
    show h.where(amount: 0.3em): none
    it
  }

  show heading: set block(spacing: 1.3em)



  set raw(tab-size: 4)
  show link: it => {
    set text(fill: blue)
    underline(it)
  }

  set list(indent: 6pt)
  set enum(indent: 6pt)
  // set enum(numbering: numblex(numberings: ("1.", "a)", circle_numbers)), full: true)
  set enum(
    numbering: numbly(
      "{1:1}.", // use {level:format} to specify the format
      "{2:1})", // if format is not specified, arabic numbers will be used
      "{3:a}.", // here, we only want the 3rd level
    ),
    full: true,
  )

  set bibliography(title: [参考], style: "ieee")

  set document(title: title, author: author)
  set page(
    paper: "a4",
    header: context {
      if counter(page).get().first() == 1 {
        none
      } else {
        [
          #course_id
          #h(1fr)
          #author | #title
        ]
      }
    },
    footer: context {
      let page_number = counter(page).get().first()
      let total_pages = counter(page).final().last()
      align(center)[
        #set text(size: 8pt)
        #page_number / #total_pages
      ]
    },
  )

  // Title and Header

  let make_header(name, width: 453.5pt, max: 17pt, step: 0.1pt) = {
    context {
      if max == none {
        max = text.size
      }
      let textsize = max
      let size = measure(align(left, text(textsize)[#name]))
      while size.width > width {
        textsize = textsize - step
        size = measure(align(left, text(textsize)[#name]))
      }
      return align(left, text(textsize)[#name])
    }
  }

  let left_text = [
    #author #id
  ]
  let comma = ","
  if lang == "zh" {
    comma = "，"
  }
  let right_text = [#professor_name] + comma + [#semester] + [ | *截止时间：*#due_time.display("[year]年[month padding:none]月[day padding:none]日")]

  if due_time == none or due_time == "" {
    right_text = [*#professor_name*] + [#comma*#semester* ]
  }

  line(length: 100%)
  make_header[*#course_id* | *#title*]
  left_text
  h(1fr)
  right_text
  line(length: 100%)

  set raw(tab-size: 4)

  show raw: set text(font: (font.mono, font.cjk))
  // Display inline code in a small box
  // that retains the correct baseline.
  show raw.where(block: false): box.with(fill: luma(240), inset: (x: 3pt, y: 0pt), outset: (y: 3pt), radius: 2pt)

  let cjk-markers = regex("[“”‘’．，。、？！：；（）｛｝［］〔〕〖〗《》〈〉「」【】『』─—＿·…\u{30FC}]+")
  show cjk-markers: set text(font: font.cjk)
  show raw: it => {
    show cjk-markers: set text(font: font.cjk)
    it
  }
  show math.equation: it => {
    set text(font: font.math)
    show regex("\p{script=Han}"): set text(font: font.math-cjk)
    show cjk-markers: set text(font: font.math-cjk)
    it
  }

  // Display block code in a larger block
  // with more padding.
  // and with line numbers.
  // Thank you @Andrew15-5 for the idea and the code!
  // https://github.com/typst/typst/issues/344#issuecomment-2041231063
  let style-number(number) = text(gray)[#number]
  show raw.where(block: true): it => block(
    fill: luma(240),
    inset: 10pt,
    radius: 4pt,
    width: 100%,
  )[#grid(columns: (1em, 1fr), align: (
        right,
        left,
      ), column-gutter: 0.7em, row-gutter: 0.6em, ..it.lines.enumerate().map(((i, line)) => (
        style-number(i + 1),
        line,
      )).flatten())]



  body
}