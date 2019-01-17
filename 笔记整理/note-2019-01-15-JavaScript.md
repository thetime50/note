# JavaScript

[TOC]
  - [JavaScript](#JavaScript)
    - [JS简介](#JS简介)
      - [JS实例](#JS实例)
    - [JS使用](#JS使用)
      - [内部的JS](#内部的JS)
      - [外部的JS](#外部的JS)
    - [JS输出](#JS输出)
      - [获取元素](#获取元素)
      - [write](#write)
    - [JS语句](#JS语句)
    - [JS注释](#JS注释)
    - [JS变量](#JS变量)
      - [数据类型](#数据类型)
      - [声明变量](#声明变量)
    - [JS数据类型](#JS数据类型)
      - [字符串](#字符串)
      - [数字](#数字)
      - [布尔](#布尔)
      - [数组](#数组)
      - [对象](#对象)
      - [Undefined和Null](#Undefined和Null)
      - [声明对象类型](#声明对象类型)
    - [对象](#对象-1)
    - [JS函数](#JS函数)
    - [运算符](#运算符)
    - [比较运算符和逻辑运算符](#比较运算符和逻辑运算符)
    - [if-else语句](#if-else语句)
    - [switch语句](#switch语句)
    - [for循环](#for循环)
    - [while循环](#while循环)
    - [break和continue语句](#break和continue语句)
      - [JSb标签](#JSb标签)
    - [js错误](#js错误)
      - [try-catch](#try-catch)
      - [throw](#throw)
    - [验证](#验证)
    - [DOM简介](#DOM简介)
    - [DOM HTML](#DOM-HTML)
    - [DOM CSS](#DOM-CSS)
    - [DOM 事件](#DOM-事件)
      - [onload和onunload事件](#onload和onunload事件)
      - [onchange事件](#onchange事件)
      - [onmouseover和onmouseout事件](#onmouseover和onmouseout事件)
      - [onmousedown、onmouseup、onclick事件](#onmousedown、onmouseup、onclick事件)
    - [DOM节点（元素）](#DOM节点（元素）)
      - [添加元素](#添加元素)
      - [删除元素](#删除元素)
    - [JS对象](#JS对象)
      - [直接创建对象实例](#直接创建对象实例)
      - [使用对象构造器](#使用对象构造器)
      - [JS的类](#JS的类)
    - [JS数字](#JS数字)
    - [JS字符串](#JS字符串)
    - [JS日期](#JS日期)
    - [数组](#数组-1)
    - [JS逻辑](#JS逻辑)
    - [JS算数](#JS算数)
    - [JS正则](#JS正则)

[TOCEND]

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

两种寻址方式
```html
<script>
person.lastname
person["lastname"]//类似字典

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

## 对象
[link](http://www.w3school.com.cn/js/js_obj_intro.asp)

```html
<script>
var txt="abc"
txt.length//长度
txt.indexof()//查找字符串
txt.replace()//替换 (正则字段,替换字符串)
txt.search()//查找 返回匹配正则字段的位置

person=new Object() //这里有没有括号有没关系
person.firstname="Bill";
person.lastname="Gates";
person.age=56;
person.eyecolor="blue";
</script>
```

访问对象的属性和方法
```html
<script>
stri="abcd"
stri.length
stri.toUpperCase()
</script>
```

**习惯使用camel-case驼峰拼写**

## JS函数
[link](http://www.w3school.com.cn/js/js_functions.asp)

- 函数参数用,分隔
- 使用return返回结果或退出函数
```js
function fun(argument1,argument2){
  return 1
}
```

- 在函数内使用var声明的是局部变量，函数返回后被释放
- 函数外声明的是全局变量，页面所有脚本都能访问，浏览器关闭释放
- 未用var声明的变量都是全局变量(**所以总是使用var是个好习惯**)
```js
var a="a";

function writeP(stri){
  document.write("<p>"+stri+"</p>")
}

function fun(){
  var b="b"
  c="c"
  writeP(a)
}
fun()
//writeP(b)//未申明，会跳过下面的代码
writeP(c)
```

## 运算符
[link](http://www.w3school.com.cn/js/js_operators.asp)

- 算术运算符

| 运算符 | 描述   |
|:------ |:------ |
| +      | 加     |
| -      | 减     |
| *      | 乘     |
| /      | 除     |
| %      | 求余数 |
| ++     | 累加   |
| --     | 递减   |

- 赋值运算符
=、 +=、 -=、 *=、 /=、 %=、

- 字符串用+号连接，字符串和数字使用+会转换为字符串

## 比较运算符和逻辑运算符

- 比较运算符
[link](http://www.w3school.com.cn/js/js_comparisons.asp)

| 运算符 | 描述             |
|:------ |:---------------- |
| ==     | 等于             |
| ===    | 全等（值和类型） |
| !=     | 不等于           |
| >      | 大于             |
| <      | 小于             |
| >=     | 大于或等于       |
| <=     | 小于或等于       |

- 逻辑运算符
&& || ! (同c)

- 条件运算符
(condition)?value1:value2

## if-else语句
[link](http://www.w3school.com.cn/js/js_if_else.asp)

```js
if (){

}else if{

}else{

}

var time=new Date().getHours()//为什么这里要new

document.write("<p>"+typeof(Date())+"</p>")//string
document.write("<p>"+typeof((new Date()))+"</p>")//object
//new Date().getHours() = (new Date()).getHours()
```

## switch语句
[link](http://www.w3school.com.cn/js/js_switch.asp)

```js
switch(n){
  case 1:
    break;
  case 2:
    break;
  default:
}
```

## for循环
[link](http://www.w3school.com.cn/js/js_loop_for.asp)

- for
for括号内3个语句都可省略，用break退出，同c
```js
for (var i=0; i<5; i++){
  x=x + "The number is " + i + "<br>";
}

for (var i=0,len=cars.length; i<len; i++){//用,分隔
  document.write(cars[i] + "<br>");
}
```

- for-in
```js
var person={fname:"John",lname:"Doe",age:25};

for (x in person){
  txt=txt + person[x];
}
```

## while循环
[link](http://www.w3school.com.cn/js/js_loop_while.asp)

while
do-while

## break和continue语句
[link](http://www.w3school.com.cn/js/js_break.asp)

break
continue

### JSb标签
使用 target:

break可以跳出带有标签的代码块
```js
cars=["BMW","Volvo","Saab","Ford"];
list:
{
document.write(cars[0] + "<br>");
document.write(cars[1] + "<br>");
document.write(cars[2] + "<br>");
list;
document.write(cars[3] + "<br>");
document.write(cars[4] + "<br>");
document.write(cars[5] + "<br>");
}

//配合break跳出多层代码

for (var i=0;i<10;i++) for1:{
 for (var j=0;j<3;j++){
  document.write(String(i)+String(j) + " ");
  break for1
 }
  document.write("<br>")
}//00 10 20 30 40 50 60 70 80 90
```

## js错误
[link](http://www.w3school.com.cn/js/js_errors.asp)

语法错误 拼写错误或缺少的功能(由于浏览器差异) 服务器或用户的错误输出 其他

### try-catch
**try 和 catch 是成对出现的**
```js
try{
  addlert("Hello")
}catch(err){
  alert("错误信息: "+err.message)
}
```

### throw
创建或抛出异常
由浏览器或者catch截取
throw 的对象可以是 字符串、数字、逻辑值或对象
```html
<script>
function myFunction(){
  try{
    var x=document.getElementById("demo").value;
    if(x=="")    throw "值为空";
    if(isNaN(x)) throw "不是数字";
    if(x>10)     throw "太大";
    if(x<5)      throw "太小";
  }catch(err){
    var y=document.getElementById("mess");
    y.innerHTML="错误：" + err + "。";
  }
}
</script>

<h1>我的第一个 JavaScript 程序</h1>
<p>请输入 5 到 10 之间的数字：</p>
<input id="demo" type="text">
<button type="button" onclick="myFunction()">测试输入值</button>
<p id="mess"></p>
```

## 验证
[link](http://www.w3school.com.cn/js/js_form_validation.asp)

```html
<head>
<script type="text/javascript">
function validate_required(field,alerttxt){
  if (field.value==null||field.value==""){
    alert(alerttxt);return false
  } else {
    return true
  }
}

function validate_email(field,alerttxt){
  apos=field.value.indexOf("@")
  dotpos=field.value.lastIndexOf(".")
  if (apos<1||dotpos-apos<2) {
    alert(alerttxt)
    return false
  } else {
    return true
  }
}

function validate_form(thisform)
{
  if (validate_required(thisform.email,"Email must be filled out!")==false){
    thisform.email.focus()
    return false
  }
  if (validate_email(thisform.email,"Not a valid e-mail address!")==false){
    thisform.email.focus()
    return false
  }
}
</script>
</head>

<body>
<form action="submitpage.htm"onsubmit="return validate_form(this);" method="post">
Email: <input type="text" name="email" size="30">
<input type="submit" value="Submit">
</form>
</body>
```
原本例程中有使用with语句，关于with语句的介绍[link](https://blog.csdn.net/zwkkkk1/article/details/79725934)
相当于在with的变量内部的作用域进行操作
容易造成数据的泄漏
with 或者 eval的代码会不做任何优化，效率低下

## DOM简介
[link](http://www.w3school.com.cn/js/js_htmldom.asp)

当网页被加载时，浏览器会创建页面的文档对象模型(Document Object Model)
HTML DOM模型被构造为对象的树

**HTML DOM 树**
![HTML DOM tree](img/note-2019-01-15-JavaScript/HTMLDOMtree.gif)

通过可编程的对象模型，JavaScript 获得了足够的能力来创建动态的 HTML。

- JS能改变所有 HTML 元素
- JS能改变所有 HTML 属性
- JS能改变所有 CSS 样式
- JS能对所有事件做出反应

**获取HTML元素**
- 通过 id 找到元素
- 通过标签名找到元素
- 通过类名找到元素

```js
var ele=document.getElementById("idname")//根据ID获取元素
var eleP=document.getElementsByTagName("p")//获取ele元素内的所有p标签数组
//getElementsByTagName() 在IE5-8无效
```

## DOM HTML
[link](http://www.w3school.com.cn/js/js_htmldom_html.asp)

1. 在**加载HTML文档的过程中**使用document.write()向HTML输出流写内容
2. 使用元素的innerHTML属性修改元素的内容
3. 使用获取元素后用element.attributeName修改属性值

```js
document.write(Date());

document.getElementById("p1").innerHTML="New text!";
var element=document.getElementById("header");
element.innerHTML="New Header";

document.getElementById("id").srt="xxx.jpg"
```

## DOM CSS
[link](http://www.w3school.com.cn/js/js_htmldom_css.asp)

document.getElementById(id).style.property=new style

```js
document.getElementById("p2").style.color="blue"
document.getElementById("id1").style.color="red"
document.getElementById("p1").style.visibility="hidden"
document.getElementById("p1").style.visibility="visible"
```
 [**HTML DOM Style 对象参考手册**](http://www.w3school.com.cn/jsref/dom_obj_style.asp)

## DOM 事件
[link](http://www.w3school.com.cn/js/js_htmldom_events.asp)

可以在HTML元素里使用事件属性分配事件，也可以在JS脚本中对事件属性分配事件

```html
<button onclick="displayDate()">点击这里</button>

<script>
document.getElementById("myBtn").onclick=function(){displayDate()};
</script>
```

使用this传递元素
```html
<script>
function changetext(ele){
  ele.innerHTML="谢谢!";
}
</script>
<h1 onclick="changetext(this)">请点击该文本</h1>
```

### onload和onunload事件

onload和onunload事件会在用户进入或离开页面时被触发。
onload事件可检测浏览器类型和浏览器版本，并基于这些信息来加载网页的正确版本。
onload和onunload可用于处理cookie。

```html
<body onload="checkCookies()">

<script>
if (navigator.cookieEnabled==true){
	alert("已启用 cookie")
}else{
	alert("未启用 cookie")
}
</script>
```

### onchange事件
改变输入内容时触发，验证或者修改输入内容
```html
<input type="text" id="fname" onchange="upperCase()">
<!--为什么这里不用传入参数-->
```

### onmouseover和onmouseout事件
鼠标移入和移除事件
```html
<div onmouseover="mOver(this)" onmouseout="mOut(this)" style="background-color:green;width:120px;height:20px;padding:40px;color:#ffffff;">把鼠标移到上面</div>

<script>
function mOver(obj){
  obj.innerHTML="谢谢"
}

function mOut(obj){
  obj.innerHTML="把鼠标移到上面"
}
</script>
```

### onmousedown、onmouseup、onclick事件
onmousedown 点击鼠标按钮
onmouseup 释放鼠标按钮
onclick 完成鼠标点击

[**HTML DOM Event 对象参考手册**](http://www.w3school.com.cn/jsref/dom_obj_event.asp)

## DOM节点（元素）
[link](http://www.w3school.com.cn/js/js_htmldom_elements.asp)

### 添加元素

```html
<div id="div1">
<p id="p1">段落1</p>
<p id="p2">段落2</p>
</div>

<script>
var ele=document.createElement("p")//创建段落p节点
var node=document.createTextNode("JS添加的段落内容")//创建文本节点，用于添加到段落节点中
ele.appendChild(node)

var eleDiv=document.getElementById("div1")
eleDiv.appendChild(ele)
</script>
```
关于[JavaScript中innerHTML与innerText、createTextNode的区别](https://www.cnblogs.com/miracle-d/p/6323002.html)
innerHTML是将字符串直接输出到文件中
innerText和createTextNode()会对需要转义的字符修饰，让他们原样输出
createTextNode()创建的对象用appendChild()添加到节点的末尾

### 删除元素

DOM 需要清楚需要删除的元素，以及父元素
可以使用parentNode属性获得父元素
```html
<div id="div1">
<p id="p1">这是一个段落。</p>
<p id="p2">这是另一个段落。</p>
</div>

<script>
var parent=document.getElementById("div1");
var child=document.getElementById("p1");
parent.removeChild(child);

child.parentNode.removeChild(child);
</script>
```
[**HTML DOM 教程**](http://www.w3school.com.cn/js/js_htmldom_elements.asp)

## JS对象
[link](http://www.w3school.com.cn/js/js_objects.asp)

对象只是带有属性和方法的特殊数据类型。

### 直接创建对象实例

```js
person=new Object()
person.name="abc"
person.age=12
person.eyecolor="blue"

person={firstname:"John",lastname:"Doe",age:50,eyecolor:"blue"};
```

### 使用对象构造器

```js
function person(firstname,lastname,age,eyecolor)
{
  this.firstname=firstname;
  this.lastname=lastname;
  this.age=age;
  this.eyecolor=eyecolor;

  this.changeName=changeName;
  function changeName(name){
    this.lastname=name;
  }
}

myFather=new person("Bill","Gates",56,"blue");
```
new会创建一个空的对象Obj,
将对象的__proto__成员指针指向构造函数的prototype成员，
构造函数的this指针换成Obj，然后执行构造函数

new创建对象的容器
构造函数在该容器的作用域内执行
通过构造函数的this指针在容器里添加属性

### JS的类
JS不用类来构造对象，而是基于prototype(原型)

使用for-in遍历对象属性的值
```html
for (x in obj){
  document.write(x+<br>)
}
```

## JS数字
[link](http://www.w3school.com.cn/js/js_obj_number.asp)

```html
var pi=3.14;    // 使用小数点
var x=34;       // 不使用小数点
var y=123e5;    // 12300000
var z=123e-5;   // 0.00123
```

**所有 JavaScript 数字均为 64 位**
整数（不使用小数点或指数计数法）最多为 15 位
小数的最大位数是 17 //什么意思

八进制数前缀0
16进制数前缀0x

**Number 对象属性**

| 属性              | 描述                                   |
|:----------------- |:-------------------------------------- |
| constructor       | 返回对创建此对象的 Number 函数的引用。 |
| MAX_VALUE         | 可表示的最大的数。                     |
| MIN_VALUE         | 可表示的最小的数。                     |
| NaN               | 非数字值。                             |
| NEGATIVE_INFINITY | 负无穷大，溢出时返回该值。             |
| POSITIVE_INFINITY | 正无穷大，溢出时返回该值。             |
| prototype         | 使您有能力向对象添加属性和方法。       |

**Number 对象方法**

| 方法           | 描述                                 |
|:-------------- |:------------------------------------ |
| toString       | 转换为字符串，使用指定的基数。       |
| toLocaleString | 转换为字符串，使用本地数字格式顺序。 |
| toFixed        | 转换为字符串，指定小数点后的位数。   |
| toExponential  | 把对象的值转换为指数计数法。         |
| toPrecision    | 把数字格式化为指定的长度。           |
| valueOf        | 返回一个 Number 对象的基本数字值。   |

[**Number 对象参考手册**](http://www.w3school.com.cn/jsref/jsref_obj_number.asp)

## JS字符串
```js
//长度
"".length
//改变文字样式
txt.big() //Big
txt.small() //Small

txt.bold() //Bold
txt.italics() //Italic

txt.blink() //Blink
txt.fixed() //Fixed
txt.strike() //Strike

txt.fontcolor("Red") //Fontcolor
txt.fontsize(16) //Fontsize

txt.toLowerCase() //Lowercase
txt.toUpperCase() //Uppercase

txt.sub() //Subscript
txt.sup() //Superscript

txt.link("http://www.w3school.com.cn") //Link
//indexOf查找返回首次出现位置
"hello".indexOf("ll")
//match查找字符串(正则)，返回规定要检索的字符串值
var str="Hello world!"
str.match("world")//world
str.match("World")//null
//replace替换字符串(正则)
str.replace(/Microsoft/,"W3School")
```

[**JavaScript String 对象参考手册**](http://www.w3school.com.cn/jsref/jsref_obj_string.asp)

## JS日期
[link](http://www.w3school.com.cn/js/js_obj_date.asp)

```js
Date()//String

d=new Date()
d.getTime()//1970年1月1日至今的毫秒数
d.setFullYear(1992,10,3)//设置日期
d.toUTCString()//转换为UTC时间的字符串
d.getDay()//返回星期几0-6对应周日到周六
```

时钟
```html
<head>
<script type="text/javascript">
function startTime(){
  var today=new Date()
  var h=today.getHours()
  var m=today.getMinutes()
  var s=today.getSeconds()
  // add a zero in front of numbers<10
  m=num_2(m)
  s=num_2(s)
  document.getElementById('txt').innerHTML=h+":"+m+":"+s
  t=setTimeout('startTime()',100)
}

function num_2(i){
  if (i<10)
    {i="0" + i}
  return i
}
</script>
</head>

<body onload="startTime()">
<div id="txt"></div>
</body>
```

[**JavaScript Date 对象参考手册**](http://www.w3school.com.cn/js/js_obj_date.asp)

## 数组
[link](http://www.w3school.com.cn/js/js_obj_array.asp)

```js
//c创建数组
var arr=new Array()//长度为0
arr[0]=1

var arr=new Array(3)//长度为3 值为undifined
var arr=new Array(1,2,3)//初始化长度为3的数组
//...

//concat连接数组
arr1.concate(arr1)
//转换为字符串
arr.join()//默认,分隔
arr.join("..")//".."分隔
//short排序
arr.short()
```

## JS逻辑
[link](http://www.w3school.com.cn/js/js_obj_boolean.asp)

```js
new Boolean(0)      //false
new Boolean(1)      //true
new Boolean("")     //false
new Boolean(null)   //false
new Boolean(NaN)    //false //NaN 判断不是数值isNaN()的结果
new Boolean("false")//true
```

[JavaScript Boolean 对象参考手册](http://www.w3school.com.cn/jsref/jsref_obj_boolean.asp)

## JS算数
[link](http://www.w3school.com.cn/js/js_obj_math.asp)

```js
Math.round(2.2)//四舍五入
Math.random()//0 到 1 之间的随机数
Math.max(5,7)
Math.min(5,7)
```
[**JavaScript Math 对象的参考手册**](http://www.w3school.com.cn/jsref/jsref_obj_math.asp)
|              |                       |
|:------------ |:--------------------- |
| Math.E       | 常数                  |
| Math.PI      | 圆周率                |
| Math.SQRT2   | 2 的平方根            |
| Math.SQRT1_2 | 1/2 的平方根          |
| Math.LN2     | 2 的自然对数          |
| Math.LN10    | 10 的自然对数         |
| Math.LOG2E   | 以 2 为底的 e 的对数  |
| Math.LOG10E  | 以 10 为底的 e 的对数 |

## JS正则
[link](http://www.w3school.com.cn/js/js_obj_regexp.asp)

```js
var patt1=new RegExp("e");
patt1.test("The best things in life are free")//返回true false

var patt1=new RegExp("e");
patt1.exec("The best things in life are free")//返回匹配字符

var patt1=new RegExp("e","g");//指定搜索模式"global" 会返回 eeeeeenull

var patt1=new RegExp("e");//改变检索模式
patt1.compile("d");
```
[RegExp 对象参考手册](http://www.w3school.com.cn/jsref/jsref_obj_regexp.asp)
