# CSS Note
[TOC]
  - [CSS Note](#CSS-Note)
    - [回顾](#回顾)
    - [简介](#简介)
    - [CSS 语法](#CSS-语法)
    - [CSS id和class](#CSS-id和class)
      - [ID选择器](#ID选择器)
      - [class选择器](#class选择器)
    - [CSS创建](#CSS创建)
      - [CSS 样式优先级](#CSS-样式优先级)

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
选择器通常是需要改变样式的 HTML 元素。
每条声明由一个属性和一个值组成，以以分号;结束，属性和值被冒号分开
![实例](img/note-2018-12-26-CSS_Note/实例.jpg)
为了让CSS可读性更强，通常每行只描述一个属性:
CSS注释以 "/*" 开始, 以 "*/" 结束 (类似c)

## CSS id和class

### ID选择器
为标有特定 id 的 HTML 元素指定特定的样式
HTML元素以id属性来设置id选择器,CSS 中 id 选择器以 "#" 来定义。
(\<p id="xxx"\> 对应 CSS 中的 #xxx{;})
**ID属性不要以数字开头，数字开头的ID在 Mozilla/Firefox 浏览器中不起作用**

### class选择器
class选择器描述一组元素的样式，别于id选择器，class可以在多个元素中使用
TML中以class属性表示, 在 CSS 中，类选择器以一个点"."号显示
(\<p class="xxx"\> 对应 CSS 中的 .xxx{;})
- 指定类的样式
```css
/* 指定类的样式 */
.xxx {text-align:center;}
```
- 指定元素和指定类的样式
```css
/* 指定元素和指定类的样式 */
p.xxx {text-align:center;}
```

## CSS创建

1. **外部样式表**

通过在头部的<link>标签链接样式文件
```html
<head>
<link rel="stylesheet" type="text/css" href="mystyle.css">
</head>
```
```css
/* mystyle.css */
hr {color:sienna;}
p {margin-left:20px;}/*数值与单位之间不要空格*/
body {background-image:url("/images/back40.gif");}
```

2. **内部样式表**

使用 \<style\> 标签在文档头部定义内部样式表
```html
<head>
<style>
hr {color:sienna;}
p {margin-left:20px;}
body {background-image:url("images/back40.gif");}
</style>
</head>
```

3. **内联样式表**

在标签内使用样式（style）属性
```html
<p style="color:sienna;margin-left:20px">这是一个段落。</p>
```

4. **多重样式**

如果某些属性在不同的样式表中被同样的选择器定义，那么属性值将从更具体的样式表中被继承过来。

例如，外部样式表拥有针对 h3 选择器的三个属性：
```css
h3
{
    color:red;
    text-align:left;
    font-size:8pt;
}
```
而内部样式表拥有针对 h3 选择器的两个属性：
```css
h3
{
    text-align:right;
    font-size:20pt;
}
```
假如拥有内部样式表的这个页面同时与外部样式表链接，那么 h3 得到的样式是：
```
color:red;
text-align:right;
font-size:20pt;
```
即颜色属性将被继承于外部样式表，而文字排列（text-alignment）和字体尺寸（font-size）会被内部样式表中的规则取代。

5. **多重样式表优先级**

**内联样式）Inline style \> （内部样式）Internal style sheet \>（外部样式）External style sheet \> 浏览器默认样式**

### CSS 样式优先级
优先级由选择器组成的匹配规则决定

[CSS 样式优先级](http://www.runoob.com/w3cnote/css-style-priority.html)
