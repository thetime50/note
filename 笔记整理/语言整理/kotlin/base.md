## 数组
https://www.kotlincn.net/docs/reference/collections-overview.html
### list
https://kotlinlang.org/api/latest/jvm/stdlib/kotlin.collections/-list/

**属性**

abstract val size: Int

**方法**

- abstract fun contains(element: E): Boolean
  - 包含 检查指定的元素是否包含在此集合中。

- abstract fun containsAll(elements: Collection<E>): Boolean
  - 包含全部 检查指定集合中的所有元素是否都包含在此集合中。

- abstract operator fun get(index: Int): E
  - get 返回列表中指定索引处的元素。


- abstract fun indexOf(element: E): Int
  - index 返回指定元素在列表中第一次出现的索引，如果指定元素不包含在列表中，则返回 -1。

- abstract fun isEmpty(): Boolean
  - true如果集合为空（不包含元素）则返回，false否则返回。

- abstract fun iterator(): Iterator<E>
  - 返回此对象元素的迭代器。

- abstract fun lastIndexOf(element: E): Int
  - 返回列表中最后一次出现的指定元素的索引，如果列表中不包含指定元素，则返回 -1。


- abstract fun listIterator(): ListIterator<E>
  - 返回此列表中元素的列表迭代器（按正确的顺序）。
- abstract fun listIterator(index: Int): ListIterator<E>
  - 返回列表中元素的列表迭代器（按正确的顺序），从指定的索引开始。


- abstract fun subList(fromIndex: Int, toIndex: Int): List<E>
  - 返回此列表中指定的fromIndex（包括）和toIndex（不包括）之间的部分的视图。返回的列表受此列表支持，因此返回列表中的非结构性更改会反映在此列表中，反之亦然。

**扩展属性**

val Collection<*>.indices: IntRange
返回此集合的有效索引的IntRange 。


val <T> List<T>.lastIndex: Int
返回列表中最后一项的索引，如果列表为空，则返回 -1。

**扩展方法**

<!-- arrayListOf -->
- fun <T> Iterable<T>.all(predicate: (T) -> Boolean): Boolean
  - 全满足

- fun <T> Iterable<T>.any(): Boolean
  - 任意一个

- fun <T> Iterable<T>.asIterable(): Iterable<T>
  - 转为可迭代

- fun <T> List<T>.asReversed(): List<T>
  - 反转

- fun <T> Iterable<T>.asSequence(): Sequence<T>
  - 转为序列

- associateBy
- associateByTo
- associateTo
- associateWith
- associateWithTo

- fun <T : Comparable<T>> List<T?>.binarySearch(
    element: T?,
    fromIndex: Int = 0,
    toIndex: Int = size
): Int
  - 二进制搜索
- fun <T, K : Comparable<K>> List<T>.binarySearchBy(
    key: K?,
    fromIndex: Int = 0,
    toIndex: Int = size,
    selector: (T) -> K?
): Int
  - ??

- fun <T, R> Iterable<T>.chunked(
    size: Int,
    transform: (List<T>) -> R
): List<R>
 - 拆分

- operator fun <T> Iterable<T>.contains(element: T): Boolean
  - 包含

- fun <T> Collection<T>.containsAll(
    elements: Collection<T>
): Boolean
  - 包含所有

- fun <T> Iterable<T>.count(predicate: (T) -> Boolean): Int
  - 计数

- fun <T> Iterable<T>.distinct(): List<T>
  - 不包含列表(差集列表)

- fun <T> Iterable<T>.drop(n: Int): List<T>
  - 排除列表

- fun <T> List<T>.elementAt(index: Int): T
  - 像get 超出范围会报错

- fun <T> Iterable<T>.filter(
    predicate: (T) -> Boolean
): List<T>
  - 过滤

- fun <T> Iterable<T>.filterIndexed(
    predicate: (index: Int, T) -> Boolean
): List<T>

- fun <T> Iterable<T>.find(predicate: (T) -> Boolean): T?
  - 查找

- fun <T> Iterable<Iterable<T>>.flatten(): List<T>
  - 展平

- fun <T, R> Iterable<T>.fold(
    initial: R,
    operation: (acc: R, T) -> R
): R
  - js里的 [].reduce ??

- fun <T> List<T>.indexOf(element: T): Int
  - 获取索引

- infix fun <T> Iterable<T>.intersect(
    other: Iterable<T>
): Set<T>
  - 交集

- fun <T, A : Appendable> Iterable<T>.joinTo(
    buffer: A,
    separator: CharSequence = ", ",
    prefix: CharSequence = "",
    postfix: CharSequence = "",
    limit: Int = -1,
    truncated: CharSequence = "...",
    transform: ((T) -> CharSequence)? = null
): A
  - join

- fun <T, R> Iterable<T>.map(transform: (T) -> R): List<R>
  - [].map

- fun <S, T : S> Iterable<T>.reduce(
    operation: (acc: S, T) -> S
): S
- fun <T> Iterable<T>.reversed(): List<T>

基本上js有的kotlin 都有

.union 不同的集合
.zip
.unzip

### array
https://kotlinlang.org/api/latest/jvm/stdlib/kotlin.collections/-array-list/、

.asList

.add
.addAll
.clear

## 字符串
https://kotlinlang.org/docs/strings.html
模板字符串同js "${}"
**属性**

val length: Int

**方法**
- fun compareTo(other: String): Int
  - 字符串比较 

- fun equals(other: Any?): Boolean
  - 字符串相等

- fun get(index: Int): Char
  - 获取字符

- fun hashCode(): Int
  - 哈希

- operator fun plus(other: Any?): String
  - 字符串加

- fun subSequence(startIndex: Int, endIndex: Int): CharSequence
  - 字符子序列

- fun toString(): String
  - to string

format
hexToByte
hexToInt
hexToLong

基本上所有List方法

**扩展属性**

- val String.cstr: CValues<ByteVar>
  - 0结尾的utf8 c风格字符串

- val CharSequence.indices: IntRange
  - 数值范围

- val CharSequence.lastIndex: Int
  - length 1 如果序列为空会-1 

val String.utf16: CValues<UShortVar>
val String.utf32: CValues<IntVar>
val String.utf8: CValues<ByteVar>

- val String.wcstr: CValues<UShortVar>
  - 0结尾的utf16 c风格字符串

- fun CharSequence.all(predicate: (Char) -> Boolean): Boolean
  - 全满足
- fun CharSequence.any(predicate: (Char) -> Boolean): Boolean
  任意



## 正则
https://kotlinlang.org/api/latest/jvm/stdlib/kotlin.text/-regex/


- fun containsMatchIn(input: CharSequence): Boolean
  - 找到至少一个匹配项 (test)

- fun find(
    input: CharSequence,
    startIndex: Int = 0
): MatchResult?
  - 返回匹配项 (js.str.match)

- fun findAll(
    input: CharSequence,
    startIndex: Int = 0
): Sequence<MatchResult>
  - 返回匹配项列表 (js.str.matchAll)

- fun matchAt(input: CharSequence, index: Int): MatchResult?
  - 指定位置匹配 返回匹配项

- fun matchEntire(input: CharSequence): MatchResult?
  - 匹配整个输入 返回匹配项

- infix fun matches(input: CharSequence): Boolean
  - 匹配整个输入

- fun matchesAt(input: CharSequence, index: Int): Boolean
  - 指定位置完全匹配

- fun replace(input: CharSequence, replacement: String): String
  - 替换

- fun replaceFirst(
    input: CharSequence,
    replacement: String
): String
  - 替换第一个

- fun split(input: CharSequence, limit: Int = 0): List<String>
  - 分割

- fun splitToSequence(
    input: CharSequence,
    limit: Int = 0
): Sequence<String>
  - 分割为序列

- fun toPattern(): Pattern
  - 返回 Pattern 实例

**伴生方法**

- fun escape(literal: String): String
  - 返回匹配的字符串判断

- fun escapeReplacement(literal: String): String
  - ??

- fun fromLiteral(literal: String): Regex
  - 字符串转为完全匹配正则

## for
```kotlin
val items = listOf("apple", "banana", "kiwifruit")
for (item in items) {
    println(item)
}

val items = listOf("apple", "banana", "kiwifruit")
for (index in items.indices) {
    println("item at $index is ${items[index]}")
}

val items = listOf("apple", "banana", "kiwifruit")
var index = 0
while (index < items.size) {
    println("item at $index is ${items[index]}")
    index++
}
```

## json
- [kotlin serialization kotlinx-serialization-json](https://kotlinlang.org/docs/serialization.html)

```kotlin
// 不用装饰器注入可以吗
@Serializable
data class Data(val a: Int, val b: String)

fun main() {
   val json = Json.encodeToString(Data(42, "str"))
   val obj = Json.decodeFromString<Data>("""{"a":42, "b": "str"}""")
}

``` 
- [gson](https://github.com/google/gson#documentation)
- [UserGuide](https://github.com/google/gson/blob/main/UserGuide.md)

- [kotlin map](https://kotlinlang.org/api/latest/jvm/stdlib/kotlin.collections/-map/)

```kkotlin
import com.google.gson.Gson

Gson().toJson(Class(xxx))
Gson().fromJson("xxx",Class)


val jsonString = "{'employee.name':'Bob','employee.salary':10000}"
val gson = Gson()
val map = gson.fromJson<Map<*, *>>(
    jsonString,
    MutableMap::class.java
)
android.util.Log.i("test",map.toString()) // {employee.name=Bob, employee.salary=10000.0}
android.util.Log.i("test",gson.toJson(map).toString()) // {"employee.name":"Bob","employee.salary":10000.0}
```

- [JSONObject](https://developer.android.com/reference/org/json/JSONObject)
```kotlin
// jsonString -> JSONObject -> toMap
val jsonObj = JSONObject(jsonString)
val map = jsonObj.toMap()
// 其中 toMap 是：

fun JSONObject.toMap(): Map<String, *> = keys().asSequence().associateWith {
    when (val value = this[it])
    {
        is JSONArray ->
        {
            val map = (0 until value.length()).associate { Pair(it.toString(), value[it]) }
            JSONObject(map).toMap().values.toList()
        }
        is JSONObject -> value.toMap()
        JSONObject.NULL -> null
        else            -> value
    }
}

JSONObject(map).toString()
```

## 异步

## 错误

## when
