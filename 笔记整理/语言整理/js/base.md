## 数组
https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Array
### 静态方法
- Array.from()
  - : 从数组类对象或可迭代对象创建一个新的 Array 实例。
  
- Array.fromAsync() 实验性
  - 从异步可迭代、可迭代或类数组对象创建新的 Array 实例。
  
- Array.isArray()
  - : 如果参数是数组则返回 true ，否则返回 false 。
  
- Array.of()
  - : 创建一个新的 Array 实例，具有可变数量的参数，而不管参数的数量或类型。

### 实例属性
- Array.prototype.constructor
  - 创建实例对象的构造函数。对于 Array 实例，初始值是 Array 构造函数。

- Array.prototype[@@unscopables]
  - 包含 ES2015 版本之前 ECMAScript 标准中没有包含的属性名，在使用 with 绑定语句时会被忽略。

以下属性是每个 Array 实例自有的属性。

- Array.prototype.length
  - 反映数组中元素的数量。
  
### 实例方法

- Array.prototype.at()
  - 返回给定索引处的数组元素。接受从最后一项往回计算的负整数。

- Array.prototype.concat()
  - 返回一个新数组，该数组由被调用的数组与其他数组或值连接形成。

- Array.prototype.copyWithin()
  - 在数组内复制数组元素序列。

- Array.prototype.entries()
  - 返回一个新的数组迭代器对象，其中包含数组中每个索引的键/值对。

- Array.prototype.every()
  - 如果调用数组中的每个元素都满足测试函数，则返回 true。

- Array.prototype.fill()
  - 用静态值填充数组中从开始索引到结束索引的所有元素。

- Array.prototype.filter()
  - 返回一个新数组，其中包含调用所提供的筛选函数返回为 true 的所有数组元素。

- Array.prototype.find()
  - 返回数组中满足提供的测试函数的第一个元素的值，如果没有找到合适的元素，则返回 undefined。

- Array.prototype.findIndex()
  - 返回数组中满足提供的测试函数的第一个元素的索引，如果没有找到合适的元素，则返回 -1。

- Array.prototype.findLast()
  - 返回数组中满足提供的测试函数的最后一个元素的值，如果没有找到合适的元素，则返回 undefined。

- Array.prototype.findLastIndex()
  - 返回数组中满足所提供测试函数的最后一个元素的索引，如果没有找到合适的元素，则返回 -1。

- Array.prototype.flat()
  - 返回一个新数组，所有子数组元素递归地连接到其中，直到指定的深度。

- Array.prototype.flatMap()
  - 对调用数组的每个元素调用给定的回调函数，然后将结果展平一层，返回一个新数组。

- Array.prototype.forEach()
  - 对调用数组中的每个元素调用给定的函数。

- Array.prototype.includes()
  - 确定调用数组是否包含一个值，根据情况返回 true 或 false。

- Array.prototype.indexOf()
  - 返回在调用数组中可以找到给定元素的第一个（最小）索引。

- Array.prototype.join()
  - 将数组的所有元素连接为字符串。

- Array.prototype.keys()
  - 返回一个新的数组迭代器，其中包含调用数组中每个索引的键。

- Array.prototype.lastIndexOf()
  - 返回在调用数组中可以找到给定元素的最后一个（最大）索引，如果找不到则返回 -1。

- Array.prototype.map()
  - 返回一个新数组，其中包含对调用数组中的每个元素调用函数的结果。

- Array.prototype.pop()
  - 从数组中移除最后一个元素并返回该元素。

- Array.prototype.push()
  - 在数组末尾添加一个或多个元素，并返回数组新的 length。

- Array.prototype.reduce()
  - 对数组的每个元素（从左到右）执行用户提供的“reducer”回调函数，将其简化为单个值。

- Array.prototype.reduceRight()
  - 对数组的每个元素（从右到左）执行用户提供的“reducer”回调函数，将其简化为单个值。

- Array.prototype.reverse()
  - 就地反转数组中元素的顺序。（前面变成后面，后面变成前面。）

- Array.prototype.shift()
  - 从数组中移除第一个元素并返回该元素。

- Array.prototype.slice()
  - 提取调用数组的一部分并返回一个新数组。

- Array.prototype.some()
  - 如果调用数组中至少有一个元素满足提供的测试函数，则返回 true。

- Array.prototype.sort()
  - 对数组的元素进行排序并返回该数组。

- Array.prototype.splice()
  - 从数组中添加和/或删除元素。

- Array.prototype.toLocaleString()
  - 返回一个表示调用数组及其元素的本地化字符串。重写 Object.prototype.toLocaleString() 方法。

- Array.prototype.toReversed()
  - 返回一个新数组，该数组的元素顺序被反转，但不改变原始数组。

- Array.prototype.toSorted()
  - 返回一个新数组，其中元素按升序排序，而不改变原始数组。

- Array.prototype.toSpliced()
  - 返回一个新数组，在给定索引处删除和/或替换了一些元素，而不改变原始数组。

- Array.prototype.toString()
  - 返回一个表示调用数组及其元素的字符串。重写 Object.prototype.toString() 方法。

- Array.prototype.unshift()
  - 在数组的前面添加一个或多个元素，并返回数组新的 length。

- Array.prototype.values()
  - 返回一个新的数组迭代器对象，该对象包含数组中每个索引的值。

- Array.prototype.with()
  - 返回一个新数组，其中给定索引处的元素替换为给定值，而不改变原始数组。

- Array.prototype[@@iterator]()
  - 默认情况下，该方法为 values() 方法的别名。

## 字符串
https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/String
### 静态方法
- String.fromCharCode()
  - 返回使用指定的 Unicode 值序列创建的字符串。

- String.fromCodePoint()
  - 返回使用指定的码位序列创建的字符串。

- String.raw()
  - 返回从原始模板字符串创建的字符串。
### 实例属性
- String.prototype.constructor
  - 创建实例对象的构造函数。对于 String 实例，初始值是 String 构造函数。
- 
  - 这些属性是每个 String 实例的自有属性。

- String.prototype.length
  - 反映字符串的 length。只读。
### 实例方法
- String.prototype.at()
  - 返回指定索引处的字符（正好是一个 UTF-16 码元）。接受负整数，从最后一个字符串字符开始倒数。

- String.prototype.charAt()
  - 返回指定 index 处的字符（正好是一个 UTF-16 码元）。

- String.prototype.charCodeAt()
  - 返回一个数字，它是给定 index 处的 UTF-16 码元值。

- String.prototype.codePointAt()
  - 返回一个非负整数值，它是从指定位置（pos）开始的 UTF-16 编码码位的码位值。

- String.prototype.concat()
  - 合并两个（或更多）字符串的文本并返回一个新字符串。

- String.prototype.endsWith()
  - 确定字符串是否以字符串 searchString 的字符结尾。

- String.prototype.includes()
  - 确定调用字符串是否包含 searchString。

- String.prototype.indexOf()
  - 返回在调用 String 对象中第一次出现的 searchValue 的索引，如果未找到则返回 -1。

- String.prototype.isWellFormed()
  - 返回一个布尔值，指示此字符串是否包含任何单独代理项。

- String.prototype.lastIndexOf()
  - 返回在调用 String 对象中最后一次出现的 searchValue 的索引，如果未找到则返回 -1。

- String.prototype.localeCompare()
  - 返回一个数字，用于指示一个参考字符串 compareString 是否在排序顺序前面或之后或与给定字符串相同。

- String.prototype.match()
  - 用于将**正则**表达式 regexp 与字符串匹配。

- String.prototype.matchAll()
  - 返回所有 **regexp** 的匹配项的迭代器。

- String.prototype.normalize()
  - 返回调用字符串值的 Unicode 规范化形式。

- String.prototype.padEnd()
  - 用给定字符串从末尾填充当前字符串并返回长度为 targetLength 的新字符串。

- String.prototype.padStart()
  - 用给定字符串从开头填充当前字符串并返回长度为 targetLength 的新字符串。

- String.prototype.repeat()
  - 返回由对象的元素重复 count 次组成的字符串。

- String.prototype.replace()
  - 用于使用 replaceWith 替换出现的 searchFor。searchFor 可以是字符串或**正则**表达式，replaceWith 可以是字符串或函数。

- String.prototype.replaceAll()
  - 用于使用 replaceWith 替换所有出现的 searchFor。searchFor 可以是字符串或**正则**表达式，replaceWith 可以是字符串或函数。

- String.prototype.search()
  - 搜索**正则**表达式 regexp 和调用字符串之间的匹配项。

- String.prototype.slice()
  - 提取字符串的一部分并返回一个新字符串。

- String.prototype.split()
  - 返回一个由在出现子字符串 sep 时拆分调用的字符串然后填充的字符串数组。

- String.prototype.startsWith()
  - 确定调用字符串是否以字符串 searchString 的字符开头。

- String.prototype.substring()
  - 返回一个新字符串，其中包含来自（或之间）指定索引（或多个索引）的调用字符串的字符。

- String.prototype.toLocaleLowerCase()
  - 字符串中的字符将转换为小写，同时尊重当前语言环境。
  - 对于大多数语言，这将返回与 toLowerCase() 相同的结果。

- String.prototype.toLocaleUpperCase( [locale, ...locales])
  - 字符串中的字符将转换为大写，同时尊重当前语言环境。

- 对于大多数语言，这将返回与 toUpperCase() 相同的结果。

- String.prototype.toLowerCase()
  - 返回转换为小写的调用字符串值。

- String.prototype.toString()
  - 返回表示指定对象的字符串。重写 Object.prototype.toString() 方法。

- String.prototype.toUpperCase()
  - 返回转换为大写的调用字符串值。

- String.prototype.toWellFormed()
  - 返回一个字符串，其中包含的所有单独代理项都替换为 Unicode 替换字符 U+FFFD。

- String.prototype.trim()
  - 修剪字符串开头和结尾的空格。

- String.prototype.trimEnd()
  - 修剪字符串结尾的空格。

- String.prototype.trimStart()
  - 修剪字符串开头的空格。

- String.prototype.valueOf()
  - 返回指定对象的原始值。重写 Object.prototype.valueOf() 方法。

- String.prototype[@@iterator]()
  - 返回一个新的迭代器对象，该对象迭代 String 值的码位，将每个码位作为 String 值返回。
## 正则

String.prototype.replace 使用$1引用获取匹配

### 静态属性
- get RegExp[@@species]
  - 该构造函数用于创建派生对象。

- RegExp.lastIndex
  - 该索引表示从哪里开始下一个匹配

### 实例属性
- RegExp.prototype.flags
  - 含有 RegExp 对象 flags 的字符串。

- RegExp.prototype.dotAll
  - . 是否要匹配新行（newlines）。

- RegExp.prototype.global
  - 针对字符串中所有可能的匹配项测试正则表达式，还是仅针对第一个匹配项。

- RegExp.prototype.ignoreCase
  - 匹配文本的时候是否忽略大小写。

- RegExp.prototype.multiline
  - 是否进行多行搜索。

- RegExp.prototype.source
  - 正则表达式的文本。

- RegExp.prototype.sticky
  - 搜索是否是 sticky。

- RegExp.prototype.unicode
  - Unicode 功能是否开启。

实例方法
- <s>RegExp.prototype.compile()</s>
  - 运行脚本的期间（重新）编译正则表达式。

- RegExp.prototype.exec()
  - 在该字符串中执行匹配项的搜索。

- RegExp.prototype.test()
  - 该正则在字符串里是否有匹配。

- RegExp.prototype[@@match]()
  - 对给定字符串执行匹配并返回匹配结果。

- RegExp.prototype[@@matchAll]()
  - 对给定字符串执行匹配，返回所有匹配结果。

- RegExp.prototype[@@replace]()
  - 给定新的子串，替换所有匹配结果。

- RegExp.prototype[@@search]()
  - 在给定字符串中搜索匹配项，并返回在字符串中找到字符索引。

- RegExp.prototype[@@split]()
  - 通过将给定字符串拆分为子字符串，并返回字符串形成的数组。

- RegExp.prototype.toString()
  - 返回表示指定对象的字符串。重写Object.prototype.toString()方法。

## for
https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Statements/for
```js
for await (variable of iterable) { // 遍历生成器对象
  statement
}

for (var prop in obj) { // 直接遍历key
  console.log("obj." + prop + " = " + obj[prop]);
}
for (variable of iterable) { // 遍历值
    //statements
}
```

## json
https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/JSON
- JSON.parse()
  - 解析 JSON 字符串并返回对应的值，可以额外传入一个转换函数，用来将生成的值和其属性，在返回之前进行某些修改。

- JSON.stringify()
  - 返回与指定值对应的 JSON 字符串，可以通过额外的参数，控制仅包含某些属性，或者以自定义方法来替换某些 key 对应的属性值。

## 异步
https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Promise
### 静态方法
- Promise.all()
  - 接受一个 Promise 可迭代对象作为输入，并返回单个 Promise。返回的 Promise 在所有输入的 Promise 都兑现时（包括传入的可迭代对象为空时）被兑现，其值为一个包含所有兑现值的数组。如果输入的任何 Promise 被拒绝，返回的 Promise 也会被拒绝，并返回第一个拒绝的原因。

- Promise.allSettled()
  - 接受一个 Promise 可迭代对象作为输入，并返回单个 Promise。返回的 Promise 在所有输入的 Promise 都敲定时兑现（包括传入的可迭代对象为空时），其值为一个描述每个 Promise 结果的对象数组。

- Promise.any()
  - 接受一个 Promise 可迭代对象作为输入，并返回单个 Promise。返回的 Promise 在任何输入的 Promise 兑现时兑现，其值为第一个兑现的值。如果所有输入的 Promise 都被拒绝（包括传入的可迭代对象为空时），返回的 Promise 将以带有一个包含拒绝原因的数组的 AggregateError 拒绝。

- Promise.race()
  - 接受一个 Promise 可迭代对象作为输入，并返回单个 Promise。返回的 Promise 与第一个敲定的 Promise 的最终状态保持一致。

Promise.reject()
返回一个新的 Promise 对象，该对象以给定的原因拒绝。

- Promise.resolve()
  - 返回一个新的 Promise 对象，该对象以给定的值兑现。如果值是一个 thenable 对象（即具有 then 方法），则返回的 Promise 对象会“跟随”该 thenable 对象，采用其最终的状态；否则，返回的 Promise 对象会以该值兑现。

通常，如果你不知道一个值是否是 Promise，那么最好使用 Promise.resolve(value) 将其转换成 Promise 对象，并将返回值作为 Promise 来处理。

### 实例方法
- Promise.prototype.catch()
  - 将一个拒绝处理回调函数附加到 Promise 上，并返回一个新的 Promise，如果回调被调用，则解决为回调的返回值，如果 Promise 被兑现，解决为其原始兑现值。

- Promise.prototype.finally()
  - 将一个处理器附加到 Promise 上，并返回一个新的 Promise，当原始 Promise 被解决时解决。无论 Promise 是否被兑现还是被拒绝，处理器都会在 Promise 敲定时被调用。

- Promise.prototype.then()
  - 将一个兑现处理器和拒绝处理器附加到 Promise 上，并返回一个新的 Promise，解决为调用处理器得到的返回值，或者如果 Promise 没有被处理（即相关处理器 onFulfilled 或 onRejected 不是函数），则以原始敲定值解决。

## 错误
```js
try {
  myRoutine();
} catch (e) {
  if (e instanceof RangeError) {
    // statements to handle this very common expected error
  } else {
    throw e; // re-throw the error unchanged
  }
} finally {
  console.log("finally");
}
```
## 其他
base64
字符-编码转换
Uint8Array - Buffer 基本方法 / 字符互转
