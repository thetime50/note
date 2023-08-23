## 数组
https://docs.python.org/3/tutorial/datastructures.html#more-on-lists

- list.append(x)
  - 在列表末尾添加一个元素，相当于 a[len(a):] = [x] 。

- list.extend(iterable)
  - 用可迭代对象的元素扩展列表。相当于 a[len(a):] = iterable 。

- list.insert(i, x)
  - 在指定位置插入元素。第一个参数是插入元素的索引，因此，a.insert(0, x) 在列表开头插入元素， a.insert(len(a), x) 等同于 a.append(x) 。

- list.remove(x)
  - 从列表中删除第一个值为 x 的元素。未找到指定元素时，触发 ValueError 异常。

- list.pop([i])
  - 删除列表中指定位置的元素，并返回被删除的元素。未指定位置时，a.pop() 删除并返回列表的最后一个元素。（方法签名中 i 两边的方括号表示该参数是可选的，不是要求输入方括号。这种表示法常见于 Python 参考库）。

- list.clear()
  - 删除列表里的所有元素，相当于 del a[:] 。

- list.index(x[, start[, end]])
  - 返回列表中第一个值为 x 的元素的零基索引。未找到指定元素时，触发 ValueError 异常。  
  可选参数 start 和 end 是切片符号，用于将搜索限制为列表的特定子序列。返回的索引是相对于整个序列的开始计算的，而不是 start 参数。

- list.count(x)
  - 返回列表中元素 x 出现的次数。

- list.sort(*, key=None, reverse=False)
  - 就地排序列表中的元素（要了解自定义排序参数，详见 sorted()）。

- list.reverse()
  - 翻转列表中的元素。

- list.copy()
  - 返回列表的浅拷贝。相当于 a[:] 。

```python
a = [(x, y) for x in [1,2,3] for y in [3,1,4] if x != y]

for i, v in enumerate(['tic', 'tac', 'toe']):
    print(i, v)

questions = ['name', 'quest', 'favorite color']
answers = ['lancelot', 'the holy grail', 'blue']
for q, a in zip(questions, answers):
    print('What is your {0}?  It is {1}.'.format(q, a))

for i in reversed(range(1, 10, 2)):
    print(i)

# 消除重复元素
basket = ['apple', 'orange', 'apple', 'pear', 'orange', 'banana']
for f in sorted(set(basket)):
    print(f)
# sorted方法的key测试用来量化值

```

## 字符串
https://docs.python.org/3/library/string.html

- string.ascii_letters
  - 下文所述 ascii_lowercase 和 ascii_uppercase 常量的拼连。 该值不依赖于语言区域。

- string.ascii_lowercase
  - 小写字母 'abcdefghijklmnopqrstuvwxyz'。 该值不依赖于语言区域，不会发生改变。

- string.ascii_uppercase
  - 大写字母 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'。 该值不依赖于语言区域，不会发生改变。

- string.digits
  - 字符串 '0123456789'。

- string.hexdigits
  - 字符串 '0123456789abcdefABCDEF'。

- string.octdigits
  - 字符串 '01234567'。

- string.punctuation
  - 由在 C 区域设置中被视为标点符号的 ASCII 字符所组成的字符串: !"#$%&'()*+,-./:;<=>?@[\]^_`{|}~.

- string.printable
  - 由被视为可打印符号的 ASCII 字符组成的字符串。 这是 digits, ascii_letters, punctuation 和 whitespace 的总和。

- string.whitespace
  - 由被视为空白符号的 ASCII 字符组成的字符串。 其中包括空格、制表、换行、回车、进纸和纵向制表符。

**format()**
- format(format_string, /, *args, **kwargs)
  - 首要的 API 方法。 它接受一个格式字符串和任意一组位置和关键字参数。 它只是一个调用 vformat() 的包装器。

在 3.7 版更改: 格式字符串参数现在是 仅限位置参数。

- vformat(format_string, args, kwargs)
  - format() 变量参数不用展开的形式



### 格式化字符串
```python
# "{} {0} {ley:f}".format()
# c风格的格式化
print("名字是：{}，年龄是：{}，身高是：{}，性别：{}".format(name,age,height,sex)) # 顺序引用
print("性别：{3}，身高是：{2}，名字是：{0}，年龄是：{1}".format(name,age,height,sex)) # 列表索引引用
print("名字是：{name}，年龄是：{age}，身高是：{heigh:<20f}，性别：{sex}".format(**{"name":name,"age":age,"height":height,"sex":sex})) # 字典引用


# % %()f
# c风格的格式化
print("%-9.3f" % -2.3)
print("我是：%s，年龄: %d，身高是：%.3f" % (name,age,height)) # 顺序引用
print("我是：%(name)s，年龄: %(age)d，身高是：%(height).3f" % {"name":name,"age":age,"height":height}) # 字典引用

# f-string
# 也支持 c风格的格式化
print(f'{name:<20.12s}') 
```

## 正则
https://docs.python.org/3/library/re.html#match-objects

- re.compile(pattern, flags=0)
  - 将正则表达式的样式编译为一个 正则表达式对象 （正则对象）

- re.search(pattern, string, flags=0)
  - 扫描整个 字符串 找到匹配样式的第一个位置，并返回一个相应的 [匹配对象](https://docs.python.org/zh-cn/3/library/re.html#match-objects)。如果没有匹配，就返回一个 None ； 注意这和找到一个零长度匹配是不同的。

- re.match(pattern, string, flags=0)
  - 如果 string 开始的0或者多个字符匹配到了正则表达式样式，就返回一个相应的 匹配对象 。 如果没有匹配，就返回 None ；注意它跟零长度匹配是不同的。  
  注意即便是 MULTILINE 多行模式， re.match() 也只匹配字符串的开始位置，而不匹配每行开始。  
  如果你想定位 string 的任何位置，使用 search() 来替代（也可参考 search() vs. match() ）

- re.fullmatch(pattern, string, flags=0)
  - 如果整个 string 匹配到正则表达式样式(相当于 f"^xxxx$")，就返回一个相应的 匹配对象 。 否则就返回一个 None ；注意这跟零长度匹配是不同的。

3.4 新版功能.

- re.split(pattern, string, maxsplit=0, flags=0)
  用 pattern 分开 string 。 如果在 pattern 中捕获到括号，那么所有的组里的文字也会包含在列表里。如果 maxsplit 非零， 最多进行 maxsplit 次分隔， 剩下的字符全部返回到列表的最后一个元素。

- re.findall(pattern, string, flags=0)
  - <u>返回匹配字符串列表</u>
  - 返回 pattern 在 string 中的所有非重叠匹配，以字符串列表或字符串元组列表的形式。对 string 的扫描从左至右，匹配结果按照找到的顺序返回。 空匹配也包括在结果中。  
  返回结果取决于模式中捕获组的数量。如果没有组，返回与整个模式匹配的字符串列表。如果有且仅有一个组，返回与该组匹配的字符串列表。如果有多个组，返回与这些组匹配的字符串元组列表。非捕获组不影响结果。

- re.finditer(pattern, string, flags=0)
  - pattern 在 string 里所有的非重复匹配，返回为一个迭代器 iterator 保存了 匹配对象 。 string 从左到右扫描，匹配按顺序排列。空匹配也包含在结果里。

- re.sub(pattern, repl, string, count=0, flags=0)
  - (正则字符串, 源字符串， 替换文本)
  - 返回通过使用 repl 替换在 string 最左边非重叠出现的 pattern 而获得的字符串。 如果样式没有找到，则不加改变地返回 string。 repl 可以是字符串或函数；如为字符串，则其中任何反斜杠转义序列都会被处理。 也就是说，\n 会被转换为一个换行符，\r 会被转换为一个回车符，依此类推。 未知的 ASCII 字符转义序列保留在未来使用，会被当作错误来处理。 其他未知转义序列例如 \& 会保持原样。 向后引用像是 \6 会用样式中第 6 组所匹配到的子字符串来替换。
  - \1转义为匹配分组(引用获取匹配)

- re.subn(pattern, repl, string, count=0, flags=0)
  - 行为与 sub() 相同，但是返回一个元组 (字符串, 替换次数).

- re.escape(pattern)
  - 转义 pattern 中的特殊字符。如果你想对任意可能包含正则表达式元字符的文本字符串进行匹配，它就是有用的。

- re.purge()
  - 清除正则表达式的缓存。

## for
for in (range zip enumerate)

## json
https://docs.python.org/3/library/json.html

- json.dump(obj, fp, *, skipkeys=False, ensure_ascii=True, check_circular=True, allow_nan=True, cls=None, indent=None, separators=None, default=None, sort_keys=False, **kw)
  - 使用这个 转换表 将 obj 序列化为 JSON 格式化流形式的 fp (支持 .write() 的 file-like object)。

- json.dumps(obj, *, skipkeys=False, ensure_ascii=True, check_circular=True, allow_nan=True, cls=None, indent=None, separators=None, default=None, sort_keys=False, **kw)
  - 使用这个 转换表 将 obj 序列化为 JSON 格式的 str。 其参数的含义与 dump() 中的相同。

- json.load(fp, *, cls=None, object_hook=None, parse_float=None, parse_int=None, parse_constant=None, object_pairs_hook=None, **kw)
  - 使用这个 转换表 将 fp (一个支持 .read() 并包含一个 JSON 文档的 text file 或者 binary file) 反序列化为一个 Python 对象。

- json.loads(s, *, cls=None, object_hook=None, parse_float=None, parse_int=None, parse_constant=None, object_pairs_hook=None, **kw)
  - 使用这个 转换表 将 s (一个包含 JSON 文档的 str, bytes 或 bytearray 实例) 反序列化为 Python 对象。  
  其他参数的含义与 load() 中的相同。

class json.JSONDecoder() ??

## 异步

## 错误
```python
try:
  f = open('myfile.txt')
  s = f.readline()
  i = int(s.strip())
except OSError as err:
  pass
except ValueError as err:
  pass
except Exception as err: # else:
  pass
  # raise
finally:
  pass
```
## when
