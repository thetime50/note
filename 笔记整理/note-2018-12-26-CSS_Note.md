# CSS Note
[TOC]
  - [CSS Note](#CSS-Note)
    - [回顾](#回顾)

[TOCEND]

## 回顾
html页面head里的style标签，或者标签里的style属性
1. 内联样式 使用起始标签里的style属性 >style="属性:值;"
2. 内部样式 写在head里的style标签中 每一行>标签 {属性:值;}
3. 外部引用 用head里的link链接 不区分换行>标签 {属性:值;}

```html
<!-- 1. 内联样式 使用起始标签里的style属性 >style="属性:值;" -->
<p style="color:blue;background-color:yellow;">color</p>

```
```html
<!-- 2. 内部样表 写在head里的style标签中 每一行>标签 {属性:值;} -->
<head>
<style type="test/css">
h1 {color:read;}
p {color:blue;}
标签 {属性:值;}
标签 {属性:值;属性...}
标签 {...}
</style>
</head>
```
```html
<!-- 3. 外部引用 用head里的link链接 不区分换行>标签 {属性:值;} -->
<head>
<link rel="stylesheet" type="text/css" hreg="style.css">
</head>
```

## 简介
- CSS即层叠样式表 (Cascading Style Sheets)
- 用来定义HTML元素的显示方式
- 染内容和表现分离

## CSS 语法
- CSS实例
CSS 规则由两个主要的部分构成：选择器，以及一条或多条声明
![](img/note-2018-12-26-CSS_Note/实例.jpg)
