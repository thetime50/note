# QuickStart-XML
[link->](http://www.w3school.com.cn/xml/xml_tree.asp)

XML and XSLT  
(EXtensible Markup Language)  
(eXtensible Stylesheet Language Transformations)  
## XML基础
### 树结构

```
元素 -[属性,属性]{内容}
|
|- 元素 -[属性,属性]{内容}
|  |- 元素 -[属性,属性]{内容}
|  |- 元素 -[属性,属性]{内容}
|
|- 元素 -[属性,属性]{内容}
|- 元素 -[属性,属性]{内容}

```

### 语法规则
XML语法特性
- 元素需要关闭标签  
- XML声明不属于XML元素，不需要关闭标签  
- 标签大小写敏感
- 文档必须有一个唯一的根元素
- 属性值需要引号
- 会保留原始的空格
- 换行为(LF)

用实体引用处理特殊字符
|       |     |
| :--   | :-- |
| &lt   | <   |
| &gt   | >   |
| &amp  | &   |
| &apos | '   |
| &quot | "   |

注释 &lt!-- --&gt

### 元素
元素拥有属性 ，可以同时拥有文本和子元素

- 可以含字母、数字以及其他的字符
- 不能以数字或者标点符号开始
- 不能以字符 “xml”（或者 XML、Xml）开始
- 不能包含空格

习惯上使用_分割单词，或者是数据库的命名规则
- "-"一些操作会使用
- "."表示属性
- ":"命名空间

### 属性
属性值用引号包裹，属性值内包含引号不能和外层相同，或者用引用实体表示。   
推荐用子元素，数据信息使用子元素。属性难以扩展

元数据（有关数据的数据）应当存储为属性，而数据本身应当存储为元素。
```xml
<!-- 这里的ID是一个标识符，用于标识不同的便签。不是便签数据的组成部分 -->
<messages>
  <note id="501">
  </note>
  <note id="502">
  </note> 
</messages>
```

### 验证
文档类型定义 (DTD)  定义文档结构
```xml
<?xml version="1.0" encoding="ISO-8859-1"?>
<!DOCTYPE note SYSTEM "Note.dtd"><!-- 声明DTD文件 -->
<note>
<note>
<to>George</to>
<from>John</from>
<heading>Reminder</heading>
<body>Don't forget the meeting!</body>
</note>  
```

XML DTD
[link DTD->](http://www.w3school.com.cn/dtd/index.asp)

```xml
<!DOCTYPE note [
  <!ELEMENT note (to,from,heading,body)>
  <!ELEMENT to      (#PCDATA)>
  <!ELEMENT from    (#PCDATA)>
  <!ELEMENT heading (#PCDATA)>
  <!ELEMENT body    (#PCDATA)>
]> 
```

XML Schema  
[link->](http://www.w3school.com.cn/schema/index.asp)
```xml
<xs:element name="note">
<xs:complexType>
  <xs:sequence>
    <xs:element name="to"      type="xs:string"/>
    <xs:element name="from"    type="xs:string"/>
    <xs:element name="heading" type="xs:string"/>
    <xs:element name="body"    type="xs:string"/>
  </xs:sequence>
</xs:complexType>
</xs:element> 
```

### 验证器
只有在Internet Explorer 中，可以根据 DTD 来验证 XML
```html
<textarea id="validxml2" rows="17" cols="75" />
<input type="button" value="验证" onClick="validateXML('validxml1')" /></p>
<script type="text/javascript">
function validateXML(txt)
{
  // code for IE
  if (window.ActiveXObject){
      //https://www.google-analytics.com/analytics.js
    var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    xmlDoc.async="false";
    xmlDoc.loadXML(document.all(txt).value);
  
    if(xmlDoc.parseError.errorCode!=0){
      txt="Error Code: " + xmlDoc.parseError.errorCode + "\n";
      txt=txt+"Error Reason: " + xmlDoc.parseError.reason;
      txt=txt+"Error Line: " + xmlDoc.parseError.line;
      alert(txt);
    }else{
      alert("No errors found");
    }
  }
  // code for Mozilla, Firefox, Opera, etc.
  else if (document.implementation.createDocument){
    var parser=new DOMParser();
    var text=document.getElementById(txt).value;
    var xmlDoc=parser.parseFromString(text,"text/xml");
    
    if (xmlDoc.documentElement.nodeName=="parsererror"){
      alert(xmlDoc.documentElement.childNodes[0].nodeValue);
    }else{
      alert("No errors found");
    }
  }else{
    alert('Your browser cannot handle XML validation');
  }
}
</script>
```

### 浏览器支持和查看
...

### css
```xml
<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 引入css文件渲染xml -->
<?xml-stylesheet type="text/css" href="cd_catalog.css"?>
<CATALOG>
</CATALOG>
```

### xslt
[link->](https://www.w3school.com.cn/xsl/index.asp)
```xml
<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 引入xslt文件渲染xml -->
<?xml-stylesheet type="text/xsl" href="simple.xsl"?>
<breakfast_menu>
</breakfast_menu>
```

## XML JavaScript
### XML HTTP Request
[XML DOM 教程 ->](https://www.w3school.com.cn/xmldom/index.asp)  
任何 W3C 推荐标准均未规定 XMLHttpRequest 对象。  
不过，W3C DOM Level 3 的 "Load and Save" 规范包含了一些相似的功能性  
```javascript
var xmlhttp;
function loadXMLDoc(url) {
    xmlhttp = null;
    if (window.XMLHttpRequest) {
        // code for all new browsers
        xmlhttp = new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        // code for IE5 and IE6
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    if (xmlhttp != null) {
        xmlhttp.onreadystatechange = state_Change;
        xmlhttp.open("GET", url, true);
        xmlhttp.send(null);
    } else {
        alert("Your browser does not support XMLHTTP.");
    }
}

function state_Change() {
    if (xmlhttp.readyState == 4) {
        // 4 = "loaded"
        if (xmlhttp.status == 200) {// 200 = OK
            // ...our code here...
            console.log(xmlhttp.responseXML)
        } else {
            alert("Problem retrieving XML data");
        }
    }
}
```

### 解析器
使用XMLHttpRequest/ActiveXObject请求xml数据  
.responseXML属性获取结果  

使用new DOMParser().parseFromString(txt,"text/xml")转换字符串为xml
使用new ActiveXObject("Microsoft.XMLDOM").loadXML(txt)解析文本 .load()解析我加你

```javascript
txt="<bookstore><book>";
txt=txt+"<title>Everyday Italian</title>";
txt=txt+"<author>Giada De Laurentiis</author>";
txt=txt+"<year>2005</year>";
txt=txt+"</book></bookstore>";

if (window.DOMParser)
  {
  parser=new DOMParser();
  xmlDoc=parser.parseFromString(txt,"text/xml");
  }
else // Internet Explorer
  {
  xmlDoc=new ActiveXObject("Microsoft.XMLDOM");
  xmlDoc.async="false";
  xmlDoc.loadXML(txt);
  }
```

### XML DOM
```javascript
// XML DOM
xmlDoc.getElementsByTagName("to")[0].childNodes[0].nodeValue

// HTML DOM
document.getElementById("to").innerHTML
```

### XML to HTML
...

### XML应用程序
...

## XML高级
### 命名空间
```xml
<f:table>
   <f:name>African Coffee Table</f:name>
</f:table>

<!-- xmlns:namespace-prefix="namespaceURI" -->
<f:table xmlns:f="http://www.w3school.com.cn/furniture">
   <f:name>African Coffee Table</f:name>
</f:table>
```
当命名空间被定义在元素的开始标签中时，所有带有相同前缀的子元素都会与同一个命名空间相关联。  
用于标示命名空间的地址不会被解析器用于查找信息。其惟一的作用是赋予命名空间一个惟一的名称。不过，很多公司常常会作为指针来使用命名空间指向实际存在的网页，


**默认的命名空间**
定义xmlns命名空间属性可以省略在所有子元素中使用的前缀
```xml
<table xmlns="http://www.w3school.com.cn/furniture">
   <name>African Coffee Table</name>
</table>
```

### CDATA
**PCDATA**
PCDATA 指的是被解析的字符数据（Parsed Character Data）。  
包含标签和标签内的文字

**转义字符**
非法的 XML 字符必须被替换为实体引用（entity reference）

|  |  |  |
| :-- | :-- | :-- |
| &lt; | < | 小于 |
| &gt; | > | 大于 |
| &amp; | & | 和号 |
| &apos; | ' | 省略号 |
| &quot; | " | 引号 |

**CDATA**
指的是不应由 XML 解析器进行解析的文本数据（Unparsed Character Data）  
CDATA 部分中的所有内容都会被XML的解析器忽略
```xml
<!-- 由 "<![CDATA[" 开始，由 "]]>" 结束 -->

<script>
<![CDATA[
不被语法解析器解析 保留为原始文本
]]>
</script>
```

### 编码
encode属性
```xml
<?xml version="1.0" encoding="windows-1252"?>
<?xml version="1.0" encoding="ISO-8859-1"?>
<?xml version="1.0" encoding="UTF-8"?>
<?xml version="1.0" encoding="UTF-16"?>
```
- 在文本内容中发现非法字符  
XML 文档中的某个字符与编码属性不匹配，如 XML 文件中含有外国字符，且当文件使用类似记事本的单字节编码编辑器保存，以及没有指定编码属性时
- 将当前编码切换为不被支持的指定编码
定义的单双字符编码不匹配，如Unicode、UTF-16  Windows-1252、ISO-8859-1 或者 UTF-8

### XML服务器
...

好像后面都没啥用