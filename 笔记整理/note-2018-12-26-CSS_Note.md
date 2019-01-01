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
[:link](http://www.runoob.com/css/css-howto.html)

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

[**样式表导入**](http://www.runoob.com/w3cnote/html-import-css-method.html)
```html
<style>
    @import url(style.css);
</style>
```
- @import 导入语句应写在 CSS 中，写在样式表的开头才能正确导入
- CSS2.1才支持的
- HTML 文件被加载时，link 引用的文件会同时被加载。@import 引用的文件则要等页面全部下载完毕再被加载；

*尽量使用 \<link\> 标签导入外部 CSS 文件，避免或者少用使用其他三种方式*

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

### 多重样式优先级深入概念

优先级由选择器组成的匹配规则决定
优先级顺序
以下优先级逐级增加：
- 通用选择器（*）
- 元素(类型)选择器
- 类选择器
- 属性选择器
- 伪类
- ID 选择器
- 内联样式

使用**!important**声明覆盖其他任何样式
- 尽量不使用importent
- 只在需要覆盖全站或外部CSS的特定页面使用（影响范围尽量小）
- 绝对不在全站范围的CSS用!important
- 绝不要在插件里用!important

**~~优先级权重计算~~**
**这里使用权重的方法是错误的，CSS是用优先级的方式来处理**
[CSS 利用选择器的权值进行计算比较](https://c.runoob.com/codedemo/3048)

**CSS 优先级法则：**
1. 选择器都有一个权值，权值越大越优先；
2. 当权值相等时，后出现的样式表设置优先；
3. 创作者的规则高于浏览器所设置的样式；
4. 继承的CSS 样式不如后来指定的CSS 样式；
5. 同一组属性设置中标有“!important”规则的优先级最大；
![CSS权重关系](img/note-2018-12-26-CSS_Note/CSS权重关系.png)

### CSS 样式优先级

[CSS 样式优先级](http://www.runoob.com/w3cnote/css-style-priority.html)
 1. **CSS 继承性**

- 最近继承的样式比先前继承样式优先级高
- 内联样式比继承样式优先级高


2. **选择器的优先级**

CSS的选择器：

| 选择器          |                                   |
|:--------------- | --------------------------------- |
| 1. ID 选择器    | 如 #id{}                          |
| 2. 类选择器     | 如 .class{}                       |
| 2. 属性选择器   | 如 a\[href="segmentfault.com"\]{} |
| 2. 伪类选择器   | 如 :hover{}                       |
| 3. 伪元素选择器 | 如 ::before{}                     |
| 3. 标签选择器   | 如 span{}                         |
| 4. 通配选择器   | 如 *{}                            |

选择器的优先级：
内联样式
ID 选择器
类选择器 = 属性选择器 = 伪类选择器
标签选择器 = 伪元素选择器

- 依次按上面各优先级顺序计算优先级内选择器的总和，如果所有优先级里选择器的总和都相等则按就近原则判断

*这里不同的选择器属性和值是不同的，怎么计算个数？*
- !important 的属性拥有最高优先级。若同时插有 !important，则再利用上面规则判断优先级。
