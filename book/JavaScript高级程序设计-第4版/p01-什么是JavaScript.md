# 第1章 什么是JavaScript
本章内容  
❑ JavaScript历史回顾  
❑ JavaScript是什么  
❑ JavaScript与ECMAScript的关系  
❑ JavaScript的不同版本  

1995年，JavaScript问世。代替Perl等服务器端语言处理输入验证  
网景公司在Navigator浏览器中加入JavaScript验证输入有效，避免后端验证耗时

## 1.1 简短的历史回顾

- 1955年 工程师 Brendan Eich，在浏览器 NetscapeNavigator 2 中开发Mocha脚本(后改名LiveScripe)
- 在 NetscapeNavigator 3 中发布 JavaScript1.1
    - 1996 年 8 月 13 日 微软发布 [IE3](https://en.wikipedia.org/wiki/Internet_Explorer_3) 包含 JScript 冲击网景
- 1997年,JavaScript 1.1作为提案被提交给欧洲计算机制造商协会（Ecma）
    - 第39技术委员会（TC39）承担了“标准化一门通用、跨平台、厂商中立的脚本语言的语法和语义”的任务（参见TC39-ECMAScript）
    - 定义ECMA-262标准，也就是ECMAScript（发音为“ek-ma-script”）脚本语言标准。
- 1998年，国际标准化组织（ISO）和国际电工委员会（IEC）也将ECMAScript采纳为标准（ISO/IEC-16262）
    - 各家浏览器按照标准来实现

## 1.2 JavaScript实现

js实现的构成
- JavaScript  
    ❑ 核心（ECMAScript）  
    ❑ 文档对象模型（DOM）  
    ❑ 浏览器对象模型（BOM）

## 1.2.1 ECMAScript

ECMAScript，即ECMA-262定义的语言，不包含输入和输出之类的方法。  
**宿主环境**提供ECMAScript的基准实现和与环境自身交互必需的扩展（比如DOM）。包括
- Web浏览器
- Node.js
- 即将被淘汰的Adobe Flash


ECMASript定义了  
❑ 语法  
❑ 类型  
❑ 语句  
❑ 关键字  
❑ 保留字  
❑ 操作符  
❑ 全局对象  

### 1．ECMAScript版本
ECMAScript不同的版本以“edition”表示(即ECMA-262版本)  
最近的是2019年6月的第10版 [*12th Edition – ECMAScript 2021*](https://en.wikipedia.org/wiki/ECMAScript#12th_Edition_–_ECMAScript_2021)  

**ECMA-262 第一版**
1. 以网景的JavaScript 1.1为基础
2. 删除了所有浏览器特定的代码
3. ECMA-262要求支持Unicode标准
4. 对象要与平台无关 特别是Date (也是JavaScript 1.1和JavaScript 1.2不符合ECMA-262第1版要求的原因。)

**ECMA-262第2版**
1. 编校 以满足ISO/IEC-16262要求

**ECMA-262第3版**
1. * 字符串处理
2. * 错误定义
3. * 数值输出
4. * 正则表达式
5. 新的控制语句??
6. * try/catch异常处理的支持
7. 让标准国际化的少量修改

**ECMA-262第4版** 彻底修订  
第3版基础上完全定义了一门新语言
1. 强类型变量
2. 新语句和数据结构
3. 真正的类和经典的继承
4. 操作数据的新手段

***ECMAScript 3.1***提案  
进行较少的改进 第4版跳跃太大了，ECMA-262第4版在正式发布之前被放弃  
ECMAScript 3.1变成了ECMA-262的第5版

**ECMA-262的第5版** 2009/12/03  
2011/06 修订
1. 厘清第3版存在的歧义
2. 原生的解析和序列化JSON数据的JSON对象
3. 继承和高级属性定义的方法
4. 严格模式 增强ECMAScript引擎解释和执行代码能力

**ECMA-262第6版** ES6、ES2015或ES Harmony（和谐版）
1. 类
2. 模块
3. 迭代器
4. 生成器
5. 箭头函数
6. 期约
7. 反射
8. 代理
9. 众多新的数据类型。

**ECMA-262第7版** 也称为ES7或ES2016
1. 少量语法层面的增强
    - 如Array.prototype.includes和指数操作符

**ECMA-262第8版** 也称为ES8、ES2017，完成于2017年6月
1. 异步函数（async/await）
2. [SharedArrayBuffer][SharedArrayBuffer]: 通用的、固定长度的原始二进制数据缓冲区，类似于该ArrayBuffer对象
3. [Atomics API][Atomics-API]: 该Atomics对象提供原子操作作为静态方法。它们与SharedArrayBuffer和ArrayBuffer对象一起使用。
4. Object.values()/Object.entries()/Object. getOwnPropertyDescriptors()
    1. Object.values()
    2. [Object.entries()][entries]: 给定对象的[key, value]可枚举对象
    3. Object. getOwnPropertyDescriptors():给定对象的所有属性描述符
5. 字符串填充方法  
    [String.prototype.padStart()][padStart]  
    [String.prototype.padEnd()][padEnd]  
6. 明确支持对象字面量最后的逗号

[SharedArrayBuffer]:https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/SharedArrayBuffer
[Atomics-API]:https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Atomics
[entries]:https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/entries
[padStart]:https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/padStart  
[padEnd]:https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/padEnd

**ECMA-262第9版** 也称为ES9、ES2018，发布于2018年6月
1. 异步迭代
2. 剩余和扩展属性
3. 一组新的正则表达式特性
4. Promise finally()
5. 模板字面量修订

**ECMA-262第10版** 也称为ES10、ES2019，发布于2019年6月
1. [Array.prototype.flat()/flatMap()、][[flat]]: 指定深度递归展开多维数组
2. [String.prototype.trimStart()/trimEnd()]: 方法从字符串的开头/结束删除空格。trimLeft()/trimRight() 是此方法的别名
3. [Object.fromEntries()][fromEntries]: 方法把键值对列表转换为一个对象
4. Symbol.prototype.description: 它会返回 Symbol 对象的可选描述的字符串
5. 明确定义了Function.prototype.toString()的返回值
6. 固定了Array.prototype.sort()的顺序
7. 解决与JSON字符串兼容的问题
8. 定义catch子句的可选绑定

[flat]:https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Array/flat
[trimStart]:https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/String/trimStart
[fromEntries]:https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Object/fromEntries