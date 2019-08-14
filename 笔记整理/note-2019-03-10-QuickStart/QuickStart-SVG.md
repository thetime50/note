# QuickStart-SVG
[link->](https://www.runoob.com/svg/svg-intro.html)  

[svg元素 属性](https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute)

## 实例
```xml
<?xml version="1.0" standalone="no"?>
<!-- XML 声明 standalone="no" 引用外部文件(包括dtd) -->

<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" 
"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
<!-- SVG DTD -->

<svg width="100%" height="100%" version="1.1"
xmlns="http://www.w3.org/2000/svg">
<!-- xmlns 定义命名空间 -->

<circle cx="100" cy="50" r="40" stroke="black"
stroke-width="2" fill="red"/>

</svg>
```

## 嵌入html

&lt;embed&gt;  
Adobe SVG Viewer 推荐  
不在html规范中 XHTML不支持
```html
<embed src="rect.svg" width="300" height="100" 
type="image/svg+xml"
pluginspage="http://www.adobe.com/svg/viewer/install/" />
```

&lt;object&gt;  
HTML4 规范 不允许使用脚本
Adobe SVG Viewer在IE中不支持
```html
<object data="rect.svg" width="300" height="100" 
type="image/svg+xml"
codebase="http://www.adobe.com/svg/viewer/install/" />
```

&lt;iframe&gt;  
大部分支持  
建议在HTML5中用
```html
<iframe src="rect.svg" width="300" height="100">
</iframe>
```

&lt;svg&gt;  
大部分支持
```html
<svg xmlns="http://www.w3.org/2000/svg" version="1.1">
   <circle cx="100" cy="50" r="40" stroke="black" stroke-width="2" fill="red" />
</svg>
```

&lt;a&gt;标签跳转到svg文件
```html
<a href="circle1.svg">View SVG file</a>
```