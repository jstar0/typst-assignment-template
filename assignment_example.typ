#import "template.typ": *
#let title = "标题名"
#let author = "作者名"
#let course_id = "课程名"
#let instructor = "教师名"
#let semester = "学期"
#let due_time = "DDL"
#let id = "123456789"

#show: assignment_class.with(title, author, course_id, instructor, semester, due_time, id)

#set enum(numbering: "1.") // 设置编号格式，可以改成 a.
// ----------------正文----------------

= 一级标题

默认字体：IBM Plex Serif, 思源宋体

代码块字体：`SF Mono`

== 二级标题

这个模板可以用来当作作业的模板，也可以用来写笔记。

加入了中文的段前缩进，以及代码块的字体设置。

=== 三级标题

可以使用 `#p[]`、`#prob[][]`、`#pt[][]` 来创建问题框。

= 示例

#prob[这是一个问题的内容。][

使用 `#prob[问题内容][回答内容]` 命令来创建一个带*编号*的问题区域。

]

#pt[如果需要问题框][

使用 `#pt[][]` 命令来创建一个不带编号、可自定义文本的问题框。

比如，本框使用的命令是 `#pt[如果需要问题框][...]`。
]



而如果你想只想要一个问题框：

#p[

使用 `#p[]` 命令来创建一个空白的问题框。

]

#prob[当然][
  #pt[也可以通过嵌套的形式][
    套娃。
    #p[
      套娃。
      #p[
        套娃。
        #p[
          套娃。
          #p[
            套娃。
            #p[
              套娃。
            ]
          ]
        ]
      ]
    ]
  ]
]

#pagebreak()

然后，你可以在下一页继续写作业。

= 代码块

```python
def f(x):
    return x**2
```

实现了代码块的行号！