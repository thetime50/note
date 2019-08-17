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

## 形状

```html

<!--
   rect 矩形
   width height
   fill 填充颜色
   stroke-width 线框
   dtroke 线色

   x y
   fill-opacity stroke-opacity
   rx ry 圆角
-->

<svg xmlns="http://www.w3.org/2000/svg" version="1.1">
  <rect width="300" height="100"
  style="fill:rgb(0,0,255);stroke-width:1;stroke:rgb(0,0,0)"/>
</svg>

<!--
   circle 圆形
   cx cy 圆心
-->

<!--
   ellipse 椭圆
   cx cy 中心
   rx ry 半径
-->

<!--
   line 直线
   x1 y1 x2 y2
-->

<!--
   polygon 多边形
   points="x1,y1 x2,y2 x3,y3"
   fill-rule[=nonzero | evenodd | inherit] 填充模式
  style="fill:lime;stroke:purple;stroke-width:5;fill-rule:evenodd;" />
  https://www.w3.org/TR/SVG/intro.html#TermShape
-->

<!--
   polyline 折线
   points="x1,y1 x2,y2 x3,y3"
-->

<!--
   path 命令
   d="[command]"
   command:
      M = moveto 移动光标
      L = lineto 连接
      H = horizontal lineto 水平连接
      V = vertical lineto  操作连接
      C = curveto 曲线
      S = smooth curveto 光滑曲线
      Q = quadratic Bézier curve 二阶贝塞尔
      T = smooth quadratic Bézier curveto 三阶贝塞尔
      A = elliptical Arc 椭圆弧
      Z = closepath 闭合
-->
<path d="M150 0 L75 200 L225 200 Z" />

<!--
   text 文本
-->
<!-- 使用textPath标签指定文本路径 -->
<path d="M150 0 L75 200 L225 200 Z" />
<defs>
    <path id="path1" d="M75,20 a1,1 0 0,0 100,0" />
</defs>
<text x="10" y="100" style="fill:red;">
  <textPath xlink:href="#path1">I love SVG I love SVG</textPath>
</text>
<!-- 作为a链接标签的文本 -->
<a xlink:href="http://www.w3schools.com/svg/" target="_blank">
   <text x="0" y="15" fill="red">I love SVG</text>
</a>

<!--
   stroke 属性
   stroke 颜色
   stroke-width 宽度
   stroke-linecap[butt|round|square] 端点样式
   stroke-dasharray="a,b,c..." 逗号分割 自动循环
-->
<path stroke-dasharray="5,10,15">

<!--
   feXxx 滤镜
   feGaussianBlur 模糊
   feOffset 阴影
   feBlend 混合原始图像
   feColorMatrix 矩阵变换 [r g b a c]*[r g b a]
-->
   <!-- 定义 -->
  <defs>
   <!-- 通过filter="url(#f1)"引用 -->
   <filter id="f1" x="0" y="0">
      <feGaussianBlur in="SourceGraphic" stdDeviation="15" />
   </filter>

    <filter id="f2" x="0" y="0" width="200%" height="200%">
      <feOffset result="offOut" in="SourceGraphic" dx="20" dy="20" />
      <feBlend in="SourceGraphic" in2="offOut" mode="normal" />
    </filter>

    <filter id="f3" x="0" y="0" width="200%" height="200%">
      <feOffset result="offOut" in="SourceAlpha" dx="20" dy="20" />
      <feGaussianBlur result="blurOut" in="offOut" stdDeviation="10" />
      <feBlend in="SourceGraphic" in2="blurOut" mode="normal" />
    </filter>

    <filter id="f4" x="0" y="0" width="200%" height="200%">
      <feOffset result="offOut" in="SourceGraphic" dx="20" dy="20" />
      <feColorMatrix result="matrixOut" in="offOut" type="matrix"
      values="0.2 0 0 0 0 0 0.2 0 0 0 0 0 0.2 0 0 0 0 0 1 0" />
      <feGaussianBlur result="blurOut" in="matrixOut" stdDeviation="10" />
      <feBlend in="SourceGraphic" in2="blurOut" mode="normal" />
    </filter>
  </defs>
  <rect width="90" height="90" stroke="green" stroke-width="3"
  fill="yellow" filter="url(#f1)" />

<!--
   linearGradient 线性渐变
-->
  <defs>
    <linearGradient id="grad1" x1="0%" y1="0%" x2="100%" y2="0%">
      <stop offset="0%" style="stop-color:rgb(255,255,0);stop-opacity:1" />
      <stop offset="100%" style="stop-color:rgb(255,0,0);stop-opacity:1" />
    </linearGradient>
  </defs>
  <ellipse cx="200" cy="70" rx="85" ry="55" fill="url(#grad1)" />

<!--
   radialGradient 放射渐变
-->

  <defs>
    <radialGradient id="grad1" cx="20%" cy="30%" r="30%" fx="50%" fy="50%">
      <stop offset="0%" style="stop-color:rgb(255,255,255);
      stop-opacity:0" />
      <stop offset="100%" style="stop-color:rgb(0,0,255);stop-opacity:1" />
    </radialGradient>
  </defs>
  <ellipse cx="200" cy="70" rx="85" ry="55" fill="url(#grad1)" />

```