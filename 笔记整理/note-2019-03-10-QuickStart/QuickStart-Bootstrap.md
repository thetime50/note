# QuickStart-Bootstrap
[link](http://www.runoob.com/bootstrap/bootstrap-tutorial.html)
## 教程
UI布局交互框架

- Bootstrap 基本结构
- Bootstrap CSS
- Bootstrap 布局组件
- Bootstrap 插件

使用Less样式

## 简介
移动设备优先  
[BootStrap 移动设备优先代码](https://blog.csdn.net/sqymail/article/details/50670788)  
可以设置一些视图和缩放相关的的参数  
[Bootstrap 响应式设计](http://www.runoob.com/bootstrap/bootstrap-v2-responsive-design.html)  
根据指定的设备尺寸显示/隐藏的样式

引用cssbootstrap.min.css样式 ，Html文件末尾引入bootstrap.min.js

## 环境安装
### 下载预编译的Bootstrap
```
//以下全是编译过的文件
CSS
	|- bootstrap.css
	|- bootstrap.min.css //编译压缩的文件
	|- bootstrap.theme.css
	|- bootstrap.theme.min.css //编译压缩的模板文件
js
	|- bootstrap.Js
Fonts //主题的字体
	|- bootstrap.min.js
	|- glyphicons-halflings.regular.eot
	|- glyphicons-halflings.regular.svg
	|- glyphicons-halflings.regular.ttf
	|- glyphicons-halflings.regular.woff
```

### 下载Bootstrap源码
```
less   //BS CSS源码
js     //BS JS源码
fonts  //BS 图标字体源码
dist   //预编译文件 文件夹
	|- css
	|- js
	|-fonts
docs-assets //BS 文档？？
examples    //BS 文档？？
*.html      //BS 文档？？
```

### 模板
```html
<!DOCTYPE html>
<html>
   <head>
      <title>Bootstrap 模板</title>
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <!-- 引入 Bootstrap -->
      <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
 
      <!-- HTML5 Shiv 和 Respond.js 用于让 IE8 支持 HTML5元素和媒体查询 -->
      <!-- 注意： 如果通过 file://  引入 Respond.js 文件，则该文件无法起效果 -->
      <!--[if lt IE 9]>
         <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
         <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
      <![endif]-->
   </head>
   <body>
      <h1>Hello, world!</h1>
 
      <!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
      <script src="https://code.jquery.com/jquery.js"></script>
      <!-- 包括所有已编译的插件 -->
      <script src="js/bootstrap.min.js"></script>
   </body>
</html>
<!-- 
1. meta-viewport width initial-scale 初始化视图设置
2. 引入bootstrap.css
3. 引入html5shiv.js respond.min.js IE8兼容H5元素和媒体
4. 文件末尾 先引入jquery.js 然后bootstrap.js
 -->
```

## Bootstrap CSS 概览

**Bootsprap需要是H5文档 <!DOCUMENT html>**

使用meta-viewport 设置视图
- width 显示宽度
- initial-scale 初始化缩放比例
- maximum-scale 最大比例
- user-scalable 可缩放
- 等

img 标签通过添加 img-responsive 类来添加响应式布局样式  
即通过添加指定class来实现指定的效果

设置body的样式来设置全局显示  
用@font-family-base、 @font-size-base 和 @line-height-base 设置排版样式  
@link-color 设置全局链接的颜色*(在scaffolding.less中定义)*  

normalize.js实现浏览器一致性

[CSS框模型中外边距(margin)折叠图文详解](https://www.cr173.com/html/17041_1.html)  
[盒子模型-w3](https://www.w3.org/TR/CSS21/box.html#collapsing-margins)

**Container**
```CSS
.container {
   padding-right: 15px;/*设置了内边距不能嵌套*/
   padding-left: 15px;
   margin-right: auto;
   margin-left: auto;
}
.container:before,
.container:after {
  display: table;/*清除浮动？？*/
  content: " ";
}

/*conteneditable */
.container:after {
  clear: both;
}

/*通过媒体查询匹配设备尺寸和布局*/
@media (min-width: 768px) {
   .container {
      width: 750px;
}

```

|          | Chrome | Firefox | IE    | Opera | Safari |
| :------- | :----- | :------ | :---- | :---- | :----- |
| Android  | YES    | YES     | NO    | NO    | NO     |
| iOS      | YES    | NO      | NO    | NO    | YES    |
| Mac OS X | YES    | YES     | NO    | YES   | YES    |
| Windows  | YES    | YES     | YES*  | YES   | NO     |
