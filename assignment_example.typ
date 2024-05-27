#import "template.typ": *
#import "@preview/numblex:0.1.1": numblex, circle_numbers

// ----------------参数----------------
#let title = "An Example Assignment"
#let author = "hongjr03"
#let course_id = "Typst 5.011"
#let instructor = "John"
#let semester = "2024 Spring"
#let due_time = "May 11, 2024"
#let id = "17113945"

#show: assignment_class.with(title, author, course_id, instructor, semester, due_time, id)


// ----------------正文----------------

= 开始
#quote(block: true, attribution: [#lorem(1)])[
  你说得对，但《Typst》是一款 #lorem(10)，后面忘了。
]

要开始使用此模板，你需要

+ 安装必须的字体包，包括：

  - #link("https://github.com/IBM/plex")[*IBM Plex*]
  - #link("https://github.com/notofonts/noto-cjk")[*Noto Serif SC*]
   
  或者，你可以下载 `template.typ` 后修改字体设置：
  
  + 在终端 / 命令行输入 ```typ typst fonts``` 查看当前可用的字体；
  + 进入 `template.typ`，第3行处 ```typ #let font = (main: "IBM Plex Serif", mono: "IBM Plex Mono", cjk: "Noto Serif SC")
     ``` 修改字体名称，其中 `main` 为主要字体，`mono` 为等宽字体，`cjk` 为中文字体。

+ 下载 `template.typ` 并在你的文档开头中使用 ```typ
   #import "template.typ": *
   ``` 来导入模板。

+ clone 本项目并在 `assignment_example.typ` 中进行编辑。

= 特性

本模板基于 #link("https://github.com/gRox167/typst-assignment-template")[gRox167 的 typst-assignment-template] 修改，缝合了许多作者喜欢的特性，包括：

+ 自动编号的问题块
+ 自定义标题的特殊块
+ 引入 `numblex` 包，支持中文样式的标题编号
+ 美观整洁的排版

= 使用

首先先在开头导入模板：

```typ
#import "template.typ": *
```

在文档的开头设置参数：

```typ
#let title = "An Example Assignment"
#let author = "hongjr03"
#let course_id = "Typst 5.011"
#let instructor = "John"
#let semester = "2024 Spring"
#let due_time = "May 11, 2024"
#let id = "17113945"
```

然后使用 `assignment_class` 函数生成文档：

```typ
#show: assignment_class.with(title, author, course_id, instructor, semester, due_time, id)
```

这样就创建了本文档的开头部分，以及后面每一页的页眉。

在正文部分，你可以使用以下块来创建问题、特殊块、问题和解答块：

#cprob[如何使用问题块来创建问题？][
你可以使用 `cprob` 块来创建问题。例如：

```typ
  #cprob[这是一个问题][
    这是问题的内容。
  ]
  ```

会生成一个带编号的问题块，如本块所示。
]

#cprob[我有好多个问题，不想依次编号，怎么办？][
使用 `cprob` 块时会自动编号问题，同时在导出的 PDF 文档中会显示问题的索引。

cprob 的 c 代表 counter，即计数器。你可以使用 ```typ #problem_counter.update(0)``` 来重置计数器，使下一个问题从 1 开始编号。
]

```typ
#problem_counter.update(0) // 重置问题计数器
```

#problem_counter.update(0) // 重置问题计数器

#cprob[👈这就是效果。][
  问题计数器已重置为 0，下一个问题将从 1 开始编号。
]

#prob[不想要编号？][
你可以使用 `prob` 块来创建无编号的问题。例如：

```typ
  #prob[这是一个无编号的问题][
    这是问题的内容。
  ]
  ```

会生成一个无编号的问题块，如本块所示。
]

#prob[只想要问题，不需要内容？][
你可以使用 `prob` 块来创建无内容的问题。例如：

```typ
  #prob[这是一个无内容的问题][]
  ```

会生成一个无内容的问题块，如下：

#prob[这是一个无内容的问题][]

或者，使用 `cprob` 块并留空内容：

```typ
  #cprob[这是一个无内容的问题][]
  ```

会生成带编号的无内容问题块，如下：

#cprob[这是一个无内容的问题][]
]

#prob_block[
当然，你也可以使用 `prob_block` 块来创建问题块。例如：

```typ
  #prob_block[
    这是一个问题块的内容。
  ]
  ```

会生成一个只有内容部分的问题块，如本块所示。
]

#speci_block[我想要一个特殊块，怎么办？][
你可以使用 `speci_block` 块来创建特殊块。例如：

```typ
  #speci_block[这是一个特殊块][
    这是特殊块的内容。
  ]
  ```

会生成一个带标题的特殊块，如本块所示。
]

#cqa[我想要一个问题和解答的块，怎么办？][
你可以使用 `cqa` 块来创建问题和解答的块。例如：

```typ
  #cqa[这是一个问题和解答块][
    这是问题和解答块的内容。
  ]
  ```

会生成一个带编号的问题和解答块，如本块所示。
]

#cqa[需要注意的是：][
问题和解答块的计数器和问题块的计数器是分开的，你可以使用 ```typ #prob-solution_counter.update(0)``` 来重置计数器，使下一个问题从 1 开始编号。
]

```typ
#prob-solution_counter.update(0) // 重置问题和解答计数器
```

#prob-solution_counter.update(0) // 重置问题和解答计数器

#cqa[👈这就是效果。][
  问题和解答计数器已重置为 0，下一个问题将从 1 开始编号。
]

#linebreak()
#line(length: 100%)

The end.