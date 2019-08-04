# QuickStart-Scss

# 快速入门
[link](https://www.sasscss.com/getting-started/)

- [SCSS 与 Sass 异同](http://sass.bootcss.com/docs/scss-for-sass-users/)  
  - SCSS 是 Sass 3 引入新的语法，其语法完全兼容 CSS3  
  - SCSS 需要使用分号和花括号而不是换行和缩进
  - SCSS 对空白符号不敏感
  - SCSS 支持嵌套属性
  - SCSS @mixin混入 @include引用混入 (对比SCSS的+ =)
  - SCSS @import需要引号

## 变量声明
使用$标识变量 {}限制作用域  
可以在其他变量的声明中引用

变量命名：  
scss里的**变量**是不区分'-'和'_'的  
css的属性名等依然是css的语法

## CSSq嵌套
{}嵌套
### 父选择器的标识符
&引用父对象
```scss
.a .b{
  :hover{	// .a .b hover
    ...
  }
  &:hover{	// .a .b:hover
    ...
  }
  .c &{		// .c .a .b
    ...
  }
}
```
### 群组选择器的嵌套
```
//css
//,优先级最低 群组选择器内各选择器容器需要被完整写出
.container h1, .container h2, .container h3 {
  margin-bottom: .8em
}
//scss
//展开每个群组选择器自动添加父选择器
//father(item1) father(item2) father(item3)
.container {
  h1, h2, h3 {margin-bottom: .8em}
}
```
### 组合选择器
\>、+和~
```scss
article {
  ~ article { }
  > section { }
  dl > {
    dt {  }
    dd {  }
  }
  nav + & { }
}
```
### 嵌套属性
使用 属性:{子属性: ;} 嵌套结构-连接子属性
```scss
nav {
  border: {
    style: solid;
    width: 1px;
    color: #ccc;
  }
}
nav {
  border: 1px solid #ccc {
    left: 0px;
    right: 0px;
  }
}
```
## 导入SASS文件
@import导入.sass .scss文件  
可省略文件名开头的'_'h和后缀

### SASS局部文件
@import导入局部文件，导入的文件插入在当前的文件中，不会编译生成独立的css

### 默认变量值
在被导入的文件内，变量后面添加!default声明变量默认值  
在导入文件前默认的变量没有被定义则使用默认变量
```scss
$fancybox-width: 400px !default;
.fancybox {
width: $fancybox-width;
}
```

### 嵌套导入
```scss
.blue-theme {
  @import "blue-theme"// 整理导入的变量 混合器只在局部作用域有效
}
```

### 原生的css导入
- 被导入文件的名字以**.css结尾**；
- 被导入文件的名字**是一个URL地址**（比如http://www.sass.hk/css/css.css）
- 被导入文件的名字是CSS的**url()**值。

*-.css只能以原生的形式导入-*

## 静默注释
//注释的内容不会出现在生成的文件中  
如果/**/在css不允许的地方也不会出现在生成的文件中
```scss
body {
  color: #333; // 这种注释内容不会出现在生成的css文件中
  padding: 0; /* 这种注释内容会出现在生成的css文件中 */
  color /* 这块注释内容不会出现在生成的css中 */: #333;
  padding: 1; /* 这块注释内容也不会出现在生成的css中 */ 0;
}
```

## 混合器
@mixin混入 @include引用混入

```scss
@mixin rounded-corners {
  -moz-border-radius: 5px;
  -webkit-border-radius: 5px;
  border-radius: 5px;
}

notice {
  border: 2px solid #00aa00;
  @include rounded-corners;
}
```

### 何时使用混合器
一般类名是语义的(功能)，选择器命名描述展示(显示)特征

### 混合器中的CSS规则
混合器中可以包含属性、选择器  
混合器内可以使用&

### 混合器传参
```scss
@mixin link-colors($normal, $hover, $visited) {
  color: $normal;
  &:hover { color: $hover; }
  &:visited { color: $visited; }
}
a {
  @include link-colors(blue, red, green);
}

```

### 默认参数值
$name: value
```scss
@mixin link-colors(
    $normal,
    $hover: #8ff,
    $visited: $normal
  )
{
  color: $normal;
  &:hover { color: $hover; }
  &:visited { color: $visited; }
}
```

## 选择器继承来精简CSS
@extend 混入其他选择器  
把@extend的父选择器和所有包含父选择器的项目替换为 ... (.parent, .child) ...  
1. .child 包含自己的属性 还包含.parent的属性 *属性继承*
2. .child 含有本身的选择器 还继承了.parent体样结构的选择器 *结构继承*
3. 最后一项的后代选择器会被拆分 在语义上的替换排列组合

```scss
.error {
}
.seriousError {
  @extend .error;
  border-width: 3px;
}
```

### 何时使用选择器
混合器主要用于展示性样式的重用，而类名和基于类名的选择器用于语义化样式的重用

### 继承的高级用法
继承html。(继承用户配置的样式，不会继承浏览器的默认样式)
- @extend标识的父选择器需要完全匹配
- 子选择器需要完全匹配
```scss
.a{
  height:3px;
  width:4px;
}

.b{
  color: #123;
  @extend .a;
}

#main .c{
  border:3px;
  @extend .b;
}
//匹配#main .c的才会继承 #main .b是不会继承的
//-> 子选择器需要完全匹配
```

### 继承的工作细节
@extend 对继承的父属性进行替换  
继承比较混合不会产生大量的重复css属性

### 继承的实践
```scss
.c .d { @extend .b; }
.a .b { color: #123; }
```

上面的样式在语义上是匹配.a和.c的后代.d对象  
( *.a (.c .d) 匹配.c .d的元素也匹配.a *的元素*)  
于是包含.a .c .d 和.c .a .d

**所以不要在后代选择器里用@extend**

//嵌套加继承的情况是如何处理的  
- 跨不同的嵌套使用@extend会产生拆分组合的情况  
(先编译双方嵌套的语法 再处理继承的语法)  
- 在同一嵌套结构内使用继承，在同一个外层选择器下包含被继承选择器和继承的选择器  
(在当前嵌套结构内处理继承，再处理嵌套结构)

```scss
.a .b { color: #123; }
.c .d { 
  @extend .b; 
}

.g {
  .e .f { color: #456; }
  .h { 
    @extend .f; 
  }
}

// >>out
.a .b, .a .c .d, .c .a .d {
  color: #123;
}

.g .e .f, .g .e .h {
  color: #456;
}
```
