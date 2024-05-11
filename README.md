# typst-assignment-template

自用 typst 作业 / 报告模板，加入中文支持和一些排版的优化。

原作者：[gRox167](https://github.com/gRox167/typst-assignment-template)，非常感谢。

## 如何使用？

要开始使用此模板，你可以

+ 下载 `template.typ` 并在你的文档开头中使用
  
  ```typ
  #import "template.typ": *
  ```

  来导入模板。

+ clone 本项目并在 `assignment_example.typ` 中进行编辑。

默认使用的字体是 SF Pro Text、SF Mono 和 Noto Serif SC（思源宋体），如果在电脑上没有这些字体，你可以在 `template.typ` 的

```typ
#let font = (main: "SF Pro Text", mono: "SF Mono", cjk: "Noto Serif SC")
```

中修改字体。

## 一个使用示例和说明

[assignment_example](assignment_example.pdf)
