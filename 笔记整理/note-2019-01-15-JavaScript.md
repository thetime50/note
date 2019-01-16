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
相对于在with的变量内部的作用域进行操作
容易造成数据的泄漏
with 或者 eval的代码会不做任何优化，效率低下
