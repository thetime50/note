# QuickStart-XML
[link->](http://www.w3school.com.cn/xml/xml_tree.asp)

XML and XSLT  
(EXtensible Markup Language)  
(eXtensible Stylesheet Language Transformations)  
## 树结构

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

## 语法规则
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

## 元素
元素拥有属性 ，可以同时拥有文本和子元素

- 可以含字母、数字以及其他的字符
- 不能以数字或者标点符号开始
- 不能以字符 “xml”（或者 XML、Xml）开始
- 不能包含空格

习惯上使用_分割单词，或者是数据库的命名规则
- "-"一些操作会使用
- "."表示属性
- ":"命名空间

## 属性
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

## 验证
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

