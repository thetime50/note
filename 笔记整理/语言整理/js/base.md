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

## 正则

## for

## 异步

