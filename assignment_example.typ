#import "./libs/template.typ": *

// ----------------参数----------------
#show: assignment_class.with(
  title: "2024年11月7日",
  subtitle: "DATALAB",
  author: "张三",
  professor_name: "蔡青",
  course: "计算机系统基础",
  semester: "2024 夏",
  due_time: datetime(day: 11, month: 5, year: 2024),
  id: "23000000000",
)

// ----------------正文----------------
= 实验目的

熟悉和掌握计算机中整数和浮点数的二进制编码表示。

= 实验要求

+ *整数：*

  - 只能使用0-255的整型常数
  - 只能使用函数参数与函数内声明的局部变量
  - 只能使用如下单目操作符：! ~
  - 只能使用如下双目操作符：& ^ | + << >>
  - 最多只能使用有限个运算符（等于号、括号不计），可以认为使用的运算符个数越少得分越高
  - 一些函数可能对操作符有更多的限制（在题目前以操作符限制给出）
  - 禁止使用任何控制结构如 if do while for switch等
  - 禁止定义或使用任何宏
  - 禁止定义任何函数
  - 禁止调用任何函数（除了可以使用 printf 输出中间变量，但提交时必须去掉）
  - 禁止使用任何形式的类型转换
  - 禁止使用 int 以外的任何类型（包括结构体、数组、联合体）

+ *浮点数：*

  - 只能使用函数参数与函数内声明的局部变量
  - 最多只能使用有限个运算符（等于号、括号不计），可以认为使用的运算符个数越少得分越高
  - 禁止定义或使用任何宏
  - 禁止定义任何函数
  - 禁止调用任何函数（除了可以使用 printf 输出中间变量，但提交时必须去掉）
  - 禁止使用任何形式的类型转换
  - 禁止使用 int、unsigned 以外的任何类型（包括结构体、数组、联合体）
  - 禁止定义或使用任何浮点常量

= 实验内容

#make_subtitle("第1关：bitAnd")

== 任务要求：

补充函数`bitAnd()`，只用`~`、`|`实现`x&y`，将结果`return`返回。

+ 操作符限制：`~`、`|`
+ 操作符使用数量限制：8

== 实验代码及结果截图：


== 代码思路：



= 实验心得



= 使用<使用>

== 导入和配置

首先先在开头导入模板：

```typ
#import "template.typ": *
```

在文档的开头设置参数：

```typ
#show: assignment_class.with(
  subtitle: "An Example Assignment",
  author: "张三",
  course: "Typst 5.011",
  professor_name: "老师",
  semester: "2024 夏",
  due_time: datetime(day: 11, month: 5, year: 2024),
  id: "17113945",
)
```
接下来即可开始写作。

== 正文

在正文部分，你可以按照格式自由组合问题块、特殊块、问题和解答块。

=== 问题块

#prob[如何使用问题块来创建问题？][
  你可以使用 `prob` 块来创建问题。
]

#prob[如果有连续的问题，如何处理？][
  你可以使用 `cprob` 块来创建问题。例如：

  ```typ
  #cprob[这是一个问题][
    这是问题的内容。
  ]
  ```

  会生成一个带编号的问题块。请看下面的例子。
]

#cprob[这是一个问题][
  这是问题的内容。
]

#cprob[这是另一个问题][
  这是另一个问题的内容。
]

有编号的问题块会自动编号。你可以通过下面这一行代码重置问题计数器，使下一个问题从 1 开始编号。

```typ
#problem_counter.update(0) // 重置问题计数器
```

#problem_counter.update(0) // 重置问题计数器

#cprob[这是一个新的问题][
  这是新问题的内容。编号已经重置为 1。
]

=== 特殊块

特殊块允许你自定义标题、内容和背景色。在我去年的作业中，一般使用特殊块来作为“问题-解答”块以和作业的解答区分开。比如下面的例子。

#speci_block[如何使用特殊块？][
  你可以使用 `speci_block` 块来创建特殊块。
]

#cqa[这是一个问题和解答块][
  这是问题和解答块的内容。
]

同样的，你可以通过下面这一行代码重置问题和解答计数器，使下一个问题从 1 开始编号。

```typ
#prob-solution_counter.update(0) // 重置问题和解答计数器
```

#prob-solution_counter.update(0) // 重置问题和解答计数器

#cqa[这是一个新的问题和解答块][
  这是新问题和解答块的内容。编号已经重置为 1。
]

== 自定义

=== 更多自定义

如果你需要更多的自定义，你可以在 `template.typ` 中自定义 `prob`、`cprob`、`cqa`、`prob_block`、`speci_block` 函数，以满足你的需求。

=== 标题编号

可以在文档设置参数后使用 `numbly` 包设置标题编号样式：

```typ
#set heading(
  numbering: numbly(
    "{1:一}、",
    "{2:1}. ",
    "{2:1}.{3}. ",
  ),
)
```

参数中，`{*:1}` 的 `*` 代表标题的级别，`1` 代表标题的格式。`{1:一}、` 代表一级标题的格式为 `一、`，`{2:1}. ` 代表二级标题的格式为 `1. `，`{2:1}.{3}. ` 代表三级标题的格式为 `1.1. `。

*注意*，本模板默认去除了标题 numbering 后的空格，所以在设置标题编号时请注意空格的使用。如 `"{2:1}. "` 的末尾有一个空格，这样在标题编号后会有一个空格。

=== 字体

先在终端 / 命令行输入 ```bash typst fonts``` 查看当前可用的字体，以在文档开头加入 `font` 参数修改字体设置以及使用的字体：

```typ
#let font = (
  main: "IBM Plex Sans",
  mono: "IBM Plex Mono",
  cjk: "Noto Serif SC",
  math: "IBM Plex Math",
  math-cjk: "Noto Serif SC",
)

#show: assignment_class.with(
  // ... 保持原有的参数
  font: font,
)
```

= 参数说明

#{
  show raw.where(block: true): it => {
    set text(size: 10.5pt)
    grid(..it.lines.enumerate().map(((i, line)) => (line,)).flatten())
  }
  set heading(numbering: none)

  import "@preview/tidy:0.3.0"
  import "./libs/template.typ"

  let docs = tidy.parse-module(
    read("./libs/template.typ"),
    scope: (
      template: template,
    ),
    preamble: "import template: *;",
  )
  tidy.show-module(
    docs,
    first-heading-level: 1,
    show-module-name: true,
    show-outline: false,
    local-names: (parameters: "参数", default: "默认值"),
  )
}