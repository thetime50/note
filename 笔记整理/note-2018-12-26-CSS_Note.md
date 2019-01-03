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
垂直对齐

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
