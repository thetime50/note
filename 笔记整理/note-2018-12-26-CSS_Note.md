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
      - [多重样式优先级深入概念](#多重样式优先级深入概念)
      - [CSS 样式优先级](#CSS-样式优先级)
    - [CSS背景](#CSS背景)
      - [background-color](#background-color)
        - [CSS颜色](#CSS颜色)
      - [background-image](#background-image)
      - [background-repeat](#background-repeat)
      - [background-attachment](#background-attachment)
      - [background-position](#background-position)
      - [CSS简写](#CSS简写)
    - [CSS文本](#CSS文本)
      - [color](#color)
      - [direction](#direction)
      - [letter-spacing](#letter-spacing)
      - [line-height](#line-height)
      - [text-alight](#text-alight)
      - [text-decoration](#text-decoration)
      - [text-indent](#text-indent)
      - [text-shadow](#text-shadow)
      - [text-transform](#text-transform)
      - [unicode-bidi](#unicode-bidi)
      - [vertical-align](#vertical-align)
      - [white-space](#white-space)
      - [word-spacing](#word-spacing)
    - [CSS字体](#CSS字体)
      - [字体命名问题](#字体命名问题)
      - [通用字体系列](#通用字体系列)
      - [font-family](#font-family)
      - [font-size](#font-size)
      - [font-style](#font-style)
      - [font-variant](#font-variant)
      - [font-weight](#font-weight)
    - [CSS链接](#CSS链接)
    - [CSS列表](#CSS列表)
      - [图像作为列表标记](#图像作为列表标记)
      - [list-style-type](#list-style-type)
      - [list-style-position](#list-style-position)
      - [list-style-image](#list-style-image)
    - [CSS表格](#CSS表格)
      - [border](#border)
      - [border-width](#border-width)
      - [border-style](#border-style)
      - [border-color](#border-color)
      - [border-collapse](#border-collapse)
      - [border-speacing](#border-speacing)
      - [caption-side](#caption-side)
      - [empty-cells](#empty-cells)
      - [table-layout](#table-layout)
    - [CSSbox模型](#CSSbox模型)
    - [CSS边框](#CSS边框)
    - [CSS轮廓](#CSS轮廓)
    - [margin 外边距](#margin-外边距)
    - [padding 填充](#padding-填充)
    - [css分组和嵌套](#css分组和嵌套)
      - [分组选择器](#分组选择器)
      - [嵌套选择器](#嵌套选择器)
    - [CSS尺寸 Dimension](#CSS尺寸-Dimension)
    - [Display 显示 与 Visibility 可见性](#Display-显示-与-Visibility-可见性)
      - [display](#display)
    - [Position 定位](#Position-定位)
      - [position](#position)
      - [top](#top)
      - [right](#right)
      - [bottom](#bottom)
      - [left](#left)
      - [overflow](#overflow)
      - [clip](#clip)
      - [vertical-align](#vertical-align-1)
      - [z-index](#z-index)
      - [cursor](#cursor)
    - [Overflow](#Overflow)
    - [Float](#Float)
      - [float](#float)
      - [clear](#clear)
    - [对齐](#对齐)
      - [居中对齐](#居中对齐)
      - [文本居中](#文本居中)
      - [图片居中](#图片居中)
      - [左右对齐-使用定位方式](#左右对齐-使用定位方式)
      - [左右对齐-使用float方式](#左右对齐-使用float方式)
      - [垂直居中对齐-使用padding](#垂直居中对齐-使用padding)
      - [垂直居中-使用line-height](#垂直居中-使用line-height)
      - [垂直居中-使用position和transform](#垂直居中-使用position和transform)
    - [组合选择符](#组合选择符)
      - [后代选择器](#后代选择器)
      - [子元素选择器](#子元素选择器)
      - [相邻兄弟选择器](#相邻兄弟选择器)
      - [后续兄弟选择器](#后续兄弟选择器)
    - [CSS选择器](#CSS选择器)
      - [元素选择器](#元素选择器)
      - [选择器分组](#选择器分组)
      - [通配符选择器](#通配符选择器)
      - [声明分组](#声明分组)
      - [类选择器](#类选择器)
        - [多类选择器](#多类选择器)
      - [ID选择器](#ID选择器-1)
      - [属性选择器](#属性选择器)
        - [部分属性值选择器](#部分属性值选择器)
        - [子串多类选择器](#子串多类选择器)
        - [特定属性选择器](#特定属性选择器)
      - [后代选择器](#后代选择器-1)

[TOCEND]


## 回顾
html页面head里的style元素，或者标签里的style属性
1. 内联样式 使用起始标签里的style属性 >style="属性:值;"
2. 内部样式 写在head里的style元素中 每一行>元素 {属性:值;}
3. 外部引用 用head里的link链接 不区分换行>元素 {属性:值;}

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

使用 \<style\> 元素在文档头部定义内部样式表
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

## CSS背景
[link](http://www.runoob.com/css/css-background.html)
定义HTML元素的背景
- [background-color 颜色][bg-color]
- [background-image 图片][bg-image]
- [background-repeat 重复][bg-repeat]
- [background-attachment 依附（滚动关系）][bg-attachment]
- [background-position 位置][bg-position]

[bg-color]:http://www.runoob.com/cssref/pr-background-color.html
[bg-image]:http://www.runoob.com/cssref/pr-background-image.html
[bg-repeat]:http://www.runoob.com/cssref/pr-background-repeat.html
[bg-attachment]:http://www.runoob.com/cssref/pr-background-attachment.html
[bg-position]:http://www.runoob.com/cssref/pr-background-position.html

### background-color
取值：
| 值          | 描述               |
|:----------- |:------------------ |
| color       | CSS颜色            |
| transparent | 透明(默认)         |
| inherit     | 指定应继承的父对象 |

#### CSS颜色
1. 十六进制颜色 #RRGGBB
2. RGB颜色rgb(r,b,g) grb(255,0,0) rgb(%100,0%,0%)
3. GRBA颜色 A即透明度alpha 0.0~1.0 rgba(255,0,0,0.5)
4. HSL颜色 色调360 饱和度% 明度% hsl(240,100%,0%)
5. HSLA颜色 加透明度通道 hsl(240,100%,0%,0.5)
6.[预定义颜色名称](http://www.runoob.com/cssref/css-colornames.html)

### background-image
| 值         | 描述         |
|:---------- |:------------ |
| url('URL') | 图像的URL    |
| none       | 无背景(默认) |
| inherit    | 指定继承     |

### background-repeat
| 值        | 描述                   |
|:--------- |:---------------------- |
| repeat    | 垂直水平方向重复(默认) |
| repeat-x  | 水平方向重复           |
| repeat-y  | 垂直方向重复           |
| no-repeat | 不重复                 |
| inherit   | 指定继承               |

### background-attachment
| 值      | 描述           |
|:------- |:-------------- |
| scroll  | 跟随滚动(默认) |
| fixed   | 固定           |
| inherit | 指定继承       |

### background-position
| 值            | 描述 |
|:------------- |:---- |
| left top</br> left center</br>left bottom</br>right top </br>right center</br>right bottom</br>center top</br>center center</br>center bottom</br> |   如果仅指定一个关键字，其他值将会是"center"   |

| 值        | 描述                                   |
|:--------- |:-------------------------------------- |
| x%y%      | 水平位置 垂直位置 只定义x则y为50%      |
| xpos ypos | 水平位置 垂直位置       (0 0) (0px0px) |
| inherit   | 指定继承                               |

### CSS简写
将属性值按指定默认顺序合并在一起写
```css
body {background:#ffffff url('img_tree.png') no-repeat right top;}
```

## CSS文本

### color
定义文本颜色

| 值          | 描述             |
|:----------- |:---------------- |
| color       | CSS颜色          |
| transparent | 透明(默认)       |
| inherit     | 指定应继承父对象 |

### direction
定义显示方向

| 值      | 描述           |
|:------- |:-------------- |
| ltr     | 从左到右(默认) |
| rtl     | 从右到左       |
| inherit | 继承           |

### letter-spacing
定义字母间距

| 值      | 描述               |
|:------- |:------------------ |
| normal  | 无间距(默认)       |
| length  | 指定间距(可为负数) |
| inherit | 继承               |

### line-height
定义行高

| 值      | 描述                               |
|:------- |:---------------------------------- |
| normal  | 默认间距                           |
| number  | 行间距为number与当前字体尺寸的倍数 |
| lenght  | 固定行间距 px??                    |
| %       | 当前字体尺寸的百分比               |
| inherit | 继承                               |

### text-alight
元素对齐
默认值: left if direction is ltr, and right if direction is rtl

| 值      | 描述     |
|:------- |:-------- |
| left    | 左对齐   |
| right   | 右对齐   |
| center  | 居中     |
| justify | 两端对齐 |
| inherit | 继承     |

### text-decoration
装饰 文本修饰

| 值           | 描述           |
|:------------ |:-------------- |
| none         | 标准文本(默认) |
| underline    | 下划线         |
| overline     | 上划线         |
| line-through | 删除线         |
| blink        | 闪烁文本       |
| inherit      | 继承           |

### text-indent
首行缩进

| 值      | 描述                                     |
|:------- |:---------------------------------------- |
| lenght  | 指定缩进 px?? 默认0                      |
| %       | 父元素text-indent的百分比 (试了效果不对) |
| inherit | 继承                                     |

### text-shadow
显示阴影
```css
div {text-shadow:h-shadow v-shadow blur color;}
```
| 值       | 描述                  |
|:-------- |:--------------------- |
| h-shadow | 必需，水平偏移 可正负 |
| v-shadow | 必需，查找偏移 可正负 |
| blur     | 可选，模糊的距离      |
| color    | 可选，CSS颜色         |

### text-transform
大小写控制

| 值         | 描述               |
|:---------- |:------------------ |
| none       | 不改变大小写(默认) |
| capitalize | 单词大写字母开头   |
| uppercase  | 全大写             |
| lowercase  | 全小写             |
| inherit    | 继承               |

### unicode-bidi
```html
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>unicode-bidi test</title>
<style>
div.ltr {direction:ltr;}
div.rtl {direction:rtl;}

p.normal {unicode-bidi: normal}
p.embed {unicode-bidi: embed}
p.bidi-override	{unicode-bidi: bidi-override}
p.initial {unicode-bidi: initial}

</style>
</head>
<body>

<div>一些文本。默认的书写方向。</div>

<div class="ltr">
	<p class='normal'>abc defg ijkl,</p>
	<p class='embed'>abc defg ijkl,</p>
	<p class='bidi-override'>abc defg ijkl,</p>
	<p class='initial'>abc defg ijkl,</p>
	</div>

<div class="rtl">
	<p class='normal'>abc defg ijkl,</p>
	<p class='embed'>abc defg ijkl,</p>
	<p class='bidi-override'>abc defg ijkl,</p>
	<p class='initial'>abc defg ijkl,</p>
	</div>
</body>
</html>
```


| 值            | 描述                                        |
|:------------- |:------------------------------------------- |
| normal        | 默认。不使用附加的嵌入层面                  |
| embed         | 创建附加的嵌入层面(隔离?)                   |
| bidi-override | 创建附加的嵌入层面。重新排序取决于direction |
| initial       | 设置该属性为它的默认值。请参阅 initial      |
| inherit       | 从父元素继承该属性。请参阅 inherit          |

### vertical-align
垂直对齐(垂直方向上移动)

| 值          | 描述                                   |
|:----------- |:-------------------------------------- |
| baseline    | 元素在父元素的基线上(默认)             |
| sub         | 元素的顶端对齐文本的下标的顶端         |
| super       | 元素的底端对齐文本的上标底端           |
| top         | 元素的顶端与行中最高元素的顶端对齐     |
| text-top    | 元素的顶端与父元素字体的顶端对齐       |
| middle      | 此元素放置在父元素的中部。             |
| bottom      | 元素的底端与行中最低的元素的顶端对齐。 |
| text-bottom | 元素的底端与父元素字体的底端对齐。     |
| length      |                                        |
| %           | 用 "line-height" 百分比,允许负值。     |
| inherit     | 继承                                   |

### white-space
元素中空白的处理方式

| 值       | 描述                                 |
|:-------- |:------------------------------------ |
| normal   | 浏览器忽略空白(默认)                 |
| pre      | 空白会被浏览器保留。类似\<pre\> 标签 |
| nowrap   | 文本不自动换行，直到遇到 \<br\> 标签 |
| pre-wrap | 保留空白符序列，但是正常地进行换行   |
| pre-line | 合并空白符序列，但是保留换行符       |
| inherit  | 继承                                 |


### word-spacing
单词间隔

| 值      | 描述         |
|:------- |:------------ |
| normal  | (默认)       |
| length  | 定义单词间隔 |
| inherit | 继承         |

## CSS字体
[菜鸟](http://www.runoob.com/css/css-font.html)
[W3C](http://www.w3school.com.cn/css/css_font-family.asp)

### 字体命名问题
在不同系统中Times字体的名字可能是Times、Times New Roman 和 TimesNR。
Slanted斜体可能被描述为oblique、incline(或inclined)、cursive、kursiv、italic等
黑体可能描述为 bold black heavy

### 通用字体系列
字体可能包含粗体、斜体字等体变形。如Times包含TimeaRegular、TImesBold、TimesItalic、TimesOblique、TimesBoldItalic、TimesBoldOblique等。

1. Serif 字体：不定宽，笔画末端有断线装饰。包含Times、Georgia 和 New Century Schoolbook。
2. Sans-Serif 字体：不定宽，没末端断线装饰。包含Helvetica、Geneva、Verdana、Arial 或 Univers
3. Monospace 字体：等宽字体，可能包含短线装饰。包含Courier、Courier New 和 Andale Mono。
4. Cursive 字体：手写字体，由曲线和末端装饰或者花体部分和装饰组成。包括 Zapf Chancery、Author 和 Comic Sans
5. Fantasy 字体：不好按上面归类的字体。包含Zapf Chancery、Author 和 Comic Sans。

> *特定字体系列*和*通用字体系列*应该不是两种类别， *特定的字体系列*一般会分类到某一*通用字体类别*下面。

### font-family
设定字体系列
可设置多个字体'后备'，含有空格的字体名称需加引号，多个字体间用逗号分隔
```css
p {font-family:"Times New Roman",Times,serif}
```
[常用后备字体组合](http://www.runoob.com/cssref/css-websafe-fonts.html)

| 值                             | 描述                                                |
|:------------------------------ |:--------------------------------------------------- |
| family-name</br>generic-family | 字体族名称 或/及 类族名称列表 </br>默认取决于浏览器 |
| inherit                        | 继承                                                |

### font-size
元素字体大小

<table>
<thead><td>值</td><td>描述</td></thead>
<tr>
 <td>
 <ul>
  <li>xx-small</li>
  <li>x-small</li>
  <li>small</li>
  <li>medium</li>
  <li>large</li>
  <li>x-large</li>
  <li>xx-large</li>
 </ul>
 </td>
 <td>字体的尺寸</td>
</tr>
<tr><td>smaller</td><td>设为比父对象更小的尺寸</td></tr>
<tr><td>larger</td><td>设为比父对象更大的尺寸</td></tr>
<tr><td>length</td><td>固定尺寸</td></tr>
<tr><td>%</td><td>基于父对象的百分比</td></tr>
<tr><td>inherit</td><td>继承</td></tr>
</table>

### font-style
文本样式

| 值      | 描述            |
|:------- |:--------------- |
| normal  | 标准样式 (默认) |
| italic  | 使用倾斜字体    |
| oblique | 倾斜效果        |
| inherit | 继承            |

### font-variant
设为小型大写字母
所有小写字母变成尺寸小一点的大写字母

| 值         | 描述            |
|:---------- |:--------------- |
| normal     | 标准样式 (默认) |
| small-caps | 小型大写字母    |
| inherit    | 继承            |

### font-weight
文本粗细

| 值      | 描述                |
|:------- |:------------------- |
| normal  | 标准样式 400 (默认) |
| bold    | 粗体 700            |
| bolder  | 更粗                |
| lighter | 更细的              |
| 100-900 | 指定粗细            |
| inherit | 继承                |

## CSS链接
链接的状态
- a:link 正常状态，未访问过
- a:vidited 已访问过
- a:hover 鼠标悬停 必须在a:link a:vidited后面
- a:active 鼠标按下 必须在a:hover后面

```css
a:link,a:visited
{
	/*display:block;*/
	display:block;
	font-weight:bold;
	background-color:#98bf21;
	width:120px;
	text-align:center;
	padding:4px;
	text-decoration:none;
}
a:hover,a:active
{
	background-color:#7A991A;
}
```

## CSS列表
[link](http://www.runoob.com/css/css-list.html)

- 无序列表 ul-li
- 有序列表 ol-li

### 图像作为列表标记
```css
ul {list-style-image: url('xxxx.jpg')}
```
不同浏览器显示位置会有所差异
兼容的方案为
```css
ul {
  list-style-type: none;/*去除列表标记*/
  padding: 0px;/*填充边距为0*/
  margin: 0px;/*填充边距为0*/
}
ul li {/*为什么这里是空格分割的*/
  background-image: url(xxx.png);/*用背景作为标记*/
  background-repeat: no-repeat;/*不重复*/
  background-position: 0px 5px;/*背景位置*/
  padding-left: 14px;/*内边距*/
}
```

### list-style-type
列表项标记类型

| 值                   | 描述                                    |
|:-------------------- |:--------------------------------------- |
| none                 | 无标记                                  |
| disc                 | 标记是实心圆(默认)                      |
| circle               | 标记是空心圆                            |
| square               | 标记是实心方块                          |
| decimal              | 标记是数字                              |
| decimal-leading-zero | 0开头的数字标记(01,02,03,等)            |
| lower-roman          | 小写罗马数字(i,ii,iii,iv,v,等)          |
| upper-roman          | 大写罗马数字(I,II,III,IV,V,等)          |
| lower-alpha          | 小写英文字母 (a,b,c,d,e,等)             |
| upper-alpha          | 大写英文字母 (A,B,C,D,E,等)             |
| lower-greek          | 小写希腊字母(alpha,beta,gamma,等)       |
| lower-latin          | 小写拉丁字母(a, b, c, d, e, 等)         |
| upper-latin          | 大写拉丁字母(A, B, C, D, E, 等)         |
| hebrew               | 传统的希伯来编号方式                    |
| armenian             | 传统的亚美尼亚编号方式                  |
| georgian             | 传统的乔治亚编号方式(an,ban,gan,等)     |
| cjk-ideographic      | 简单的表意数字                          |
| hiragana             | 标记是a,i,u,e,o,ka,ki,等（日文片假名）  |
| katakana             | 标记是A,I,U,E,O,KA,KI,等（日文片假名）  |
| hiragana-iroha       | 标记是i,ro,ha,ni,ho,he,等（日文片假名） |
| katakana-iroha       | 标记是I,RO,HA,NI,HO,HE,等（日文片假名） |

### list-style-position
标记位置

| 值      | 描述                                         |
|:------- |:-------------------------------------------- |
| nside   | 标记在文本以内，且环绕文本根据标记对齐       |
| outside | (默认)标记在文本以外，环绕文本不根据标记对齐 |
| inherit | 继承                                         |

### list-style-image
用图像替换列表标记

| 值      | 描述         |
|:------- |:------------ |
| URL     | 图像的路径   |
| none    | 无图形(默认) |
| inherit | 继承         |

## CSS表格
[link](http://www.runoob.com/css/css-table.html)

### border
依次设置 border-width,border-style,border-color

### border-width
边框宽度，边框样式不是none时有效
```css
/*依次设置上、右、下、左边框*/
p {border-width:thin thin thin thin;}
p {border-width:thin thin thin;}

/*分别设置上下边框、左右边框*/
p {border-width:thin thin;}

/*设置所有边框*/
p {border-width:thin;}
```

| 值      | 描述                              |
|:------- |:--------------------------------- |
| thin    | 细边框                            |
| medium  | 中等边框(默认)                    |
| thick   | 粗边框                            |
| length  | 定义宽度 定位可以为px, pt, cm, em |
| inherit | 继承                              |

- px 魔法单位 所有打印结果上为96分之1英寸
- pt point 一般不用
- cm
- em 以当前字体为标准

[CSS长度单位](https://www.w3.org/Style/Examples/007/units.zh_CN.html)

### border-style
设置4个边框的样式 同上

| 值      | 描述                         |
|:------- |:---------------------------- |
| none    | 无边框                       |
| hiddent | 与none相同 解决表的边框冲突  |
| dotted  | 点(多数浏览器显示为实线)     |
| dashed  | 虚线(多数浏览器显示为实线)   |
| solid   | 实线                         |
| double  | 双线                         |
| groove  | 3D凹槽 与border-color有关    |
| ridge   | 3D垄状 与border-color有关    |
| inset   | 3D inset 与border-color有关  |
| outset  | 3D outset 与border-color有关 |
| inherit | 继承                         |

### border-color
设置4个边框颜色 同上

### border-collapse
合并边框

| 值       | 描述                                    |
|:-------- |:--------------------------------------- |
| separate | 边框分开(默认)                          |
| collapse | 合并边框 忽略border-spacing empty-cells |
| inherit  | 继承                                    |

### border-speacing
设置相邻对单元格边框间距

| 值            | 描述                                                    |
|:------------- |:------------------------------------------------------- |
| length length | 一个length定义所有间距 两个length分别定义水平和垂直间距 |
| inherit       | 继承                                                    |

### caption-side
设置标题位置

| 值      | 描述                 |
|:------- |:-------------------- |
| top     | 标题在表格上方(默认) |
| bottom  | 标题在表格下方       |
| inherit | 继承                 |

### empty-cells
设置空单元格是否显示边框和背景

| 值      | 描述           |
|:------- |:-------------- |
| hide    | 不显示边框     |
| show    | 显示边框(默认) |
| inherit | 继承           |

### table-layout
设置表格布局算法

| 值        | 描述                   |
|:--------- |:---------------------- |
| automatic | 自动根据内容布局(默认) |
| fixed     | 根据表格设置布局       |
| inherit   | 继承                   |

## CSSbox模型
![link](img/note-2018-12-26-CSS_Note/BoxModel.gif)
- Margin 边缘 外边距
- Border 边框
- Padding 填充 内边距
- Content 内容

width height设置的是content的尺寸

## CSS边框
[link](http://www.runoob.com/css/css-border.html)

- [border](#border)
- [border-width](#border-width)
- [border-style](#border-style)
- [border-color](#border-color)


- border-bottom
- border-left
- border-right
- border-top


- border-bottom-width
- border-bottom-style

## CSS轮廓
[link](http://www.runoob.com/css/css-outline.html)

outline
```css
p {outline:green dotted thick;}
```
包围在边框的外边缘，类似border
与margin区域重合，不计入尺寸计算

## margin 外边距
[link](http://www.runoob.com/css/css-margin.html)
margin 清除（外边框）周围的元素区域，没有背景颜色
同border，只定义尺寸

## padding 填充
[link](http://www.runoob.com/css/css-padding.html)
 padding（填充）清除内边距，会填充背景颜色
 同border，只定义尺寸

## css分组和嵌套
[link](http://www.runoob.com/css/css-grouping-nesting.html)

### 分组选择器
相同样式的元素一起定义样式
分组选择器：用逗号分隔
```css
h1,h2,p {color:black;}
```

### 嵌套选择器
```css
.marked p/*所以空格是选择器嵌套*/
{
    color:white;
}
p.marked{
    text-decoration:underline;
}
ul li/*作用所有ul元素内的li元素*/
{
    color:white;
}
```

## CSS尺寸 Dimension
[link](http://www.runoob.com/css/css-dimension.html)
- height	设置元素的高度。
- width	设置元素的宽度。
- line-height	设置行高。
- max-height	设置元素的最大高度。
- max-width	设置元素的最大宽度。
- min-height	设置元素的最小高度。
- min-width	设置元素的最小宽度。

## Display 显示 与 Visibility 可见性
[link](http://www.runoob.com/css/css-display-visibility.html)

### display
[link](http://www.w3school.com.cn/cssref/pr_class_display.asp)
定义元素显示方式

块级元素占用全部宽度，前后自动换行
内联元素只有内容的宽度，前后无换行

| 值                 | 描述                                             |
|:------------------ |:------------------------------------------------ |
| none               | 不显示 不占位置                                  |
| block              | 显示为块级元素 前后带换行符                      |
| inline             | 显示为内联元素 前后无换行符(默认)                |
| inline-block       | 行内块元素（CSS2.1 新增的值）                    |
| list-item          | 作为列表显示                                     |
| run-in             | 根据上下文作为块级或内联元素显示                 |
| compact            | 缺乏支持 CSS2.1 已删除                           |
| marker             | 缺乏支持 CSS2.1 已删除                           |
| table              | 作为块级表格显示（类似\<table\>）前后带换行符    |
| inline-table       | 作为内联表格显示（类似\<table\>）前后没换行符    |
| table-row-group    | 作为一个或多个行的分组来显示（类似\<tbody\>）    |
| table-header-group | 作为一个或多个行的分组来显示（类似\<thead\>）    |
| table-footer-group | 作为一个或多个行的分组来显示（类似\<tfoot\>）    |
| table-row          | 作为表格行显示（类似\<tr\>）                     |
| table-column-group | 作为一个或多个列的分组来显示（类似\<colgroup\>） |
| table-column       | 作为单元格列显示（类似\<col\>）                  |
| table-cell         | 作为表格单元格显示（类似\<td\>和\<th\>）         |
| table-caption      | 作为表格标题显示（类似\<caption\>）              |
| inherit            | 继承                                             |

**注意：** 变更元素的显示类型改变了该元素如何显示，但不改变它这个元素本身的类型。例如：一个内联元素设置为display:block是不允许有它内部的嵌套块元素。

## Position 定位
[link](http://www.runoob.com/css/css-positioning.html)

### position

1. static 定位
默认值，元素正常显示在流中
不受top, bottom, left, right影响

2. fixed 定位
确定的 相对浏览器窗口定位，不会随页面滚动
不占据空间，与其他元素重叠

3. relative 定位
相对定位 相对于默认（static）位置，占据原本的空间
(占据空间不变，但是所有显示加了offset)
相对定位元素经常被用来作为绝对定位元素的容器块??

4. absolute 定位
相对于用static以外定位的第一个父对象，如果没有则相对于html
不占据空间，与其他元素重叠

5. stick 定位
黏性定位 由bottom,lift,right,top设定阈值，
元素位置在阈值范围内随页面滚动，超出阈值则固定显示

```css
div.sticky {
    position: -webkit-sticky; /* Safari */
    position: sticky;
    top: 0;
    background-color: green;
    border: 2px solid #4CAF50;
}
```

### top
设置元素外边界和其包含块边界的偏移

### right
同上

### bottom
同上

### left
同上

### overflow
内容溢出处理
- overflow-x
- overflow-y

| visidle | 不处理，超出显示(默认) |
| hidden  | 裁剪隐藏               |
| scroll  | 总是出现滚动条         |
| auto    | 内容超出时显示滚动条   |
| inherit | 继承                   |

### clip
元素裁剪，超出区域按overflow处理(在图片上尝试 overflow没有效果)
**仅对定位元素(非static定位)有效**

| 值      | 描述                                           |
|:------- |:---------------------------------------------- |
| shape   | 唯一有效形状{clip:rect(top,tight,bottom,left)} |
| auto    | 不裁剪(默认)                                   |
| interit | 继承                                           |

### vertical-align
[vertical-align](#vertical-align)

### z-index
设置元素堆叠顺序，数字越大的越靠前显示
**仅对定位元素(非static定位)有效**

| 值      | 描述                       |
|:------- |:-------------------------- |
| auto    | 堆叠顺序与父元素相等(默认) |
| number  | 设置元素的堆叠顺序 可正负  |
| interit | 继承                       |

### cursor
鼠标指在元素内时的光标形状

| 值        | 描述                                           |
|:--------- |:---------------------------------------------- |
| url       | 光标的URL **cursor:url(),default;防止URL失效** |
| default   | 默认光标（通常是箭头）                         |
| auto      | 浏览器设置的光标(默认)                         |
| crosshair | 十字线                                         |
| pointer   | 指示链接的指针（手）                           |
| move      | 指示某象可移动。                               |
| e-resize  | 指示边框可向右移动。                           |
| ne-resize | 指示边框可向上右移动                           |
| nw-resize | 指示边框可向上左移动                           |
| n-resize  | 指示边框可向上移动                             |
| se-resize | 指示边框可向下右移动                           |
| sw-resize | 指示边框可向下左移动                           |
| s-resize  | 指示边框可向下移动                             |
| w-resize  | 指示边框可向左移动                             |
| text      | 指示文本                                       |
| wait      | 指示程序正忙                                   |
| help      | 指示可用的帮助（问号或气球）                   |

<p>请把鼠标移动到单词上，可以看到鼠标指针发生变化：</p>
<span style="cursor:auto">auto</span>
<span style="cursor:crosshair">crosshair</span>
<span style="cursor:default">default</span>
<span style="cursor:e-resize">e-resize</span>
<span style="cursor:help">help</span>
<span style="cursor:move">move</span>
<span style="cursor:n-resize">n-resize</span>
<span style="cursor:ne-resize">ne-resize</span>
<span style="cursor:nw-resize">nw-resize</span>
<span style="cursor:pointer">pointer</span>
<span style="cursor:progress">progress</span>
<span style="cursor:s-resize">s-resize</span>
<span style="cursor:se-resize">se-resize</span>
<span style="cursor:sw-resize">sw-resize</span>
<span style="cursor:text">text</span>
<span style="cursor:w-resize">w-resize</span>
<span style="cursor:wait">wait</span>

## Overflow
[overflow](#overflow)

## Float
[link](http://www.runoob.com/css/css-float.html)

### float
窗口发送变化后出现布局方式
浮动元素会生成一个块级框
非替换元素需要指定一个明确的宽度，否则会尽可能地窄。

| 值      | 描述         |
|:------- |:------------ |
| left    | 向左         |
| right   | 向右         |
| none    | 不浮动(默认) |
| inherit | 继承         |

[没有表格的网页](http://www.runoob.com/try/try.php?filename=trycss_float6)

### clear
不需两侧的浮动元素

| 值      | 描述                     |
|:------- |:------------------------ |
| left    | 左侧不允许浮动元素       |
| right   | 右侧不允许浮动元素       |
| both    | 左右两侧均不允许浮动元素 |
| none    | 允许两侧的浮动元素(默认) |
| inherit | 继承                     |

## 对齐
[link](http://www.runoob.com/css/css-align.html)

### 居中对齐
1. 设置元素宽度，防止溢出容器
2. 两边外边距平均
3. margin: auto;
```css
.center {
    margin: auto;
    width: 50%;
    border: 3px solid green;
    padding: 10px;
}
```

### 文本居中
text-align: center;

### 图片居中
margin: auto 在块内居中

### 左右对齐-使用定位方式
position对齐元素时, 通常预定义\<body\>元素*margin*和*padding*避免浏览器差异

```css
body {
    margin: 0;
    padding: 0;
}
.right {
    position: absolute;
    right: 0px;
    width: 300px;
}
```

### 左右对齐-使用float方式
预定义\<body\>元素*margin*和*padding*避免浏览器差异
子元素大于父元素时会溢出，加overflow: auto;处理

```css
.right {
    float: right;
    width: 300px;
    border: 3px solid #73AD21;
    padding: 10px;
}
```
### 垂直居中对齐-使用padding
```css
.center {
    padding: 70px 0;
    border: 3px solid green;
}
```

### 垂直居中-使用line-height
```css
.center {
    line-height: 200px;
    height: 200px;
    border: 3px solid green;
    text-align: center;
}

/* 如果文本有多行，添加以下代码: */
.center p {
    line-height: 1.5;/*这里的行高要小于.center的行高 否则会溢出*/
    display: inline-block;
    vertical-align: middle;
}
```

### 垂直居中-使用position和transform
```css
.center {
    height: 200px;
    position: relative;
    border: 3px solid green;
}

.center p {
    margin: 0;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
}
```

## 组合选择符
[link](http://www.runoob.com/css/css-combinators.html)
筛选符合关系的元素

### 后代选择器
用空格链接，包含元素内的所有层(所有后代)
```css
div p { }/*div元素内的p后代*/
```

### 子元素选择器
用>连接，只有子元素一代
```css
div>p { }
```

### 相邻兄弟选择器
用+号连接，筛选紧接在一元素后面的元素，且二者有相同父元素
```css
div+p { }/*匹配跟在div元素后面的p元素*/
```

### 后续兄弟选择器
用~连接，a~b所有出现在a后面的b元素，必须拥有相同的父元素但是不必连续

## CSS选择器
[link](http://www.w3school.com.cn/css/css_selector_type.asp)

### 元素选择器
通过元素来设置元素的样式，比如使用p、h1、em、a甚至可以是 html
(~~又叫类型选择器 这不重要~~)
(~~也可以为XML文档中的元素设置样式 这也不重要~~)

### 选择器分组
[link](http://www.w3school.com.cn/css/css_selector_grouping.asp)
用,分隔，设置列出所有元素的样式

### 通配符选择器
用*号

### 声明分组
将样式声明通过;封号连接写在一起 要在各个声明的最后使用分号
即
```css
{
  font: 28px Verdana;
  color: white;
  background: black;
}
```
浏览器会忽略样式表中的空白符

### 类选择器
[link](http://www.w3school.com.cn/css/css_selector_class.asp)

类选择器使用.标识
css中.class_name对应html里的class='class_name'属性
*.class_name 和 .class_name 是相同的

结合元素选择器 p.class_name

#### 多类选择器
- 多类的元素
html元素中class属性内类名间用空格分隔 class="class_name1 class_name2"
元素**需要**包含选择器中的所有类名才匹配
元素**只要**包含选择器中的所有类名即可匹配
\<p class='a b'\>可以同时匹配选择器.a/.b/.a.b

- 多类的选择器
匹配需要同时包含多个类的元素可以写作
```css
.class1.class2 {

}
```

### ID选择器
[link](http://www.w3school.com.cn/css/css_selector_id.asp)
ID选择器使用#标识
css中#class_name对应html里的id='id_name'属性
*#id_name 和 #id_name 是相同的

1. 一个html文档中一个ID只会使用一次(唯一的)
2. 一个元素仅能有一个ID,b不允许有多个ID
3. 类选择器和 ID 选择器可能区分大小写。取决于文档的语言。HTML 和 XHTML 将类和 ID 值定义为区分大小写

### 属性选择器
[link](http://www.w3school.com.cn/css/css_selector_attribute.asp)
用[]标识，匹配包含属性的元素
css中[attribute]对应html里的attribute=xxx
*[att] 和 [att] 是相同的
**attribute可以包含attribute和value**
属性选择器可以连着一起
**属性和值必须完全匹配，没有class那样的多类特征**从效果上来看属性值''和""没有影响
```css
[title] {color:red;}
*[title] {color:red;}
a[href] {color:red;}
a[href="http://www.w3school.com.cn/"][title="W3School"] {color: red;}
```

#### 部分属性值选择器
\[attribute~='xxx'\]匹配属性值中的完整单词(有点像多类选择器)
```css
p[class~="important"] {color: red;}
```

#### 子串多类选择器
[link](https://www.cnblogs.com/gugege/p/6340422.html)
| 类型         | 描述                                  |
|:------------ |:------------------------------------- |
| \[abc^="def"\] | 以 "def" 开头的元素                   |
| \[abc$="def"\] | 以 "def" 结尾的元素                   |
| \[abc*="def"\] | 包含子串 "def" 的元素(包含空格标点等) |

#### 特定属性选择器
[att|="val"]匹配val必须是完整且唯一的单词，或者以-分隔开
[lang|=en]     --\>  \<p lang="en"\>  \<p lang="en-us"\>

### 后代选择器
[后代选择器](#后代选择器)

### 子元素选择器
[子元素选择器](#子元素选择器)

### 相邻兄弟选择器
[相邻兄弟选择器](#相邻兄弟选择器)

### 伪类
[link](http://www.w3school.com.cn/css/css_pseudo_classes.asp)
