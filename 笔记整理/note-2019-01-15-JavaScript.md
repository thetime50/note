# JavaScript

[TOC]

## JS简介
### JS实例
[link](http://www.w3school.com.cn/js/js_intro.asp)
-  能够直接写入 HTML 输出流

您只能在 HTML 输出流中使用**document.write**。如果在文档已加载后使用它（比如在函数中），会覆盖整个文档

```html
<body>
<script>
document.write("<h1>This is a heading</h1>");
document.write("<p>This is a paragraph.</p>");
</script>
</body>
```

- 响应事件
```html
<body>
<button type="button" onclick="alert('Hello')">点击这里</button>
</body>
```

- 改变HTML内容

```html
<body>
<script>
//获取DOM元素
ele=document.getElementById("demo")
ele.innerHTML="hello"
</script>
</body>
```

- 改变HTML图片

```html
<body>
<script>
function changeImage(){
  ele=document.getElementById("chImg")
  if (ele.src.match("bulbon")){
    ele.src="/i/eg_bulboff.gif"
  }else{
    ele.src="/i/eg_bulbon.gif"
  }
}
</script>
<img id="chImg" onclick="changeImage()" src="/i/eg_bulboff.gif">
</body>
```

- 改变HTML样式

```html
<body>
<script>
ele=document.getElementById("chStyle")
ele.style.cocor="##ff2020"
</script>
</body>
```

- 验证输入

```html
<body>
<script>
function chackIntFun(){
x=document.getElementById("chackInt")
if (x.value==""||isNaN(x.value)) {//判断不是数值
  alert("not numberic:\""+x.value+"\"")
}
}
</script>
<input id="chackInt" type="text">
<button type="button" onclick="chackIntFun()">chack input</button>
</body>
```

## JS使用
[link](http://www.w3school.com.cn/js/js_howto.asp)

### 内部的JS

\<script\>标签可以在\<head\>或\<body\>中

```html
<!DOCTYPE html>
<html>
<body>
.
.
<script>
document.write("<h1>This is a heading</h1>");
document.write("<p>This is a paragraph</p>");
</script>
.
.
</body>
</html>
```

\<body\>中的JS在页面加载时

一般吧脚本统一放在\<head\>或者页面的顶部、底部

要在元素创建之后才能在JS里引用元素
```html
<head>
<script>
document.getElementById("demo0").innerHTML="demo0 change";
</script>
</head>
<body>

<script>
document.getElementById("demo1").innerHTML="demo1 change";
</script>

<p id="demo0">demo0.</p><!-- 这里不会被修改稿 -->
<p id="demo1">demo1.</p><!-- 这里不会被修改稿 -->
<p id="demo2">demo2.</p><!-- 这里被修改稿 -->

<script>
document.getElementById("demo2").innerHTML="demo2 change";
</script>
</body>
```

### 外部的JS

```html
<script src="script.js"></script>
```

## JS输出
[link](http://www.w3school.com.cn/js/js_shuchu.asp)

### 获取元素
略 就是decument.getElementById()

### write
docment.write()只能在文档加载过程中执行，如果加载完成后执行会覆盖整个文档

```html
<body>
<script>
document.write("<p>JS document.write()</p>")

function yabaiFun(){
  document.write("<p>yabai<p>")
}
</script>
<h1>这些是原本的网页</h1>
<p>这些是原本的网页</p>
<button type="button" onclick="yabaiFun()">点我完蛋</button>
<p>这些是原本的网页</p>
</body>
```

## JS语句
[link](http://www.w3school.com.cn/js/js_statements.asp)

由浏览器执行，获取浏览器显示的元素或打印在页面上
- 语句可由;分隔(同python)
- 代码块用花括号{}
- 大小写敏感
- **字符串内**可用\\折行(只有字符串内可以用)

## JS注释
[link](http://www.w3school.com.cn/js/js_comments.asp)

用//和/* */注释

## JS变量
[ilnk](http://www.w3school.com.cn/js/js_variables.asp)

- 变量必须以字母开头
- 变量也能以 $ 和 _ 符号开头（不推荐）
- 变量名称对大小写敏感

### 数据类型
字符串用"" 或 ''

### 声明变量
```html
<script>
var carname //里面是undefined
var a=3
var name="Gates", age=56, job="CEO"
var name="Gates",
age=56,
job="CEO"

var a//a的值还是3
</script>
```
习惯在开头声明变量比较好。
声明用,分开变量名和初始化值。
可以分为多行。
未初始化的变量值为undefined。
重复声明不会覆盖变量的值

## JS数据类型
[link](http://www.w3school.com.cn/js/js_datatypes.asp)

js是动态类型

### 字符串
''或“”

### 数字

### 布尔
true 或 false

### 数组
```html
<script>
var cars=new Array()
cars[0]="abc"
cars[1]="def"
cars[2]="ghi"

//condensed array??
var arr=new Array("abc","def","ghi")

//literal array??
var cars=["Audi","BMW","Volvo"]
</script>
```

### 对象
由花括号分隔。在括号内部，对象的属性以名称和值对的形式 (name : value) 来定义。属性由逗号分隔
```html
<script>
var person1={firstname:"Bill", lastname:"Gates", id:5566}

var person2={
firstname : "Bill",
lastname  : "Gates",
id        :  5566
}
</script>
```

### Undefined和Null
Undefined 这个值表示变量不含有值。

将变量的值设置为 null 来清空变量。

### 声明对象类型
用new关键字
```html

<script>
var carname=new String;
var x=      new Number;
var y=      new Boolean;
var cars=   new Array;
var person= new Object;
</script>
```
JavaScript 变量均为对象。声明一个变量时，就创建了一个新的对象。

> 明天直接切高级教程，先概览一遍，只记重点
