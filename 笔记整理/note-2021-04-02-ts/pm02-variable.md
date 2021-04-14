## pm02-变量声明
[变量声明->](https://www.tslang.cn/docs/handbook/variable-declarations.html)  
[code->](https://github.com/thetime50/ts-practice/blob/main/pm02-variable/pm02-variable.ts)

### 变量声明
const是对let的一个增强，它能阻止对一个变量再次赋值。


### let 声明
块作用域

不能在被声明之前读或写。 虽然这些变量始终“存在”于它们的作用域里，但在直到声明它的代码之前的区域都属于 暂时性死区。 它只是用来说明我们不能在 let语句之前访问它们，幸运的是TypeScript可以告诉我们这些信息。

下面的代码在ES2015，现代的运行时会抛出一个错误。而现今TypeScript是不会报错的。  
对ts来说，可以在运行前引用但不能在运行前修改

```ts
function foo() {
    // okay to capture 'a'
    return a;
}

// 不能在'a'被声明前调用'foo'
// 运行时应该抛出错误
foo();

let a;
```
### 重定义及屏蔽

```ts
let x = 10;
let x = 20; // 错误，不能在1个作用域里多次声明`x`

function f(x) {
    let x = 100; // error: interferes with parameter declaration
}

function g() {
    let x = 100;
    var x = 100; // error: can't have both declarations of 'x'
}
```

在一个嵌套作用域里引入一个新名字的行为称做屏蔽。它可能会不小心地引入新问题，同时也可能会解决一些错误。
内部作用域let声明覆盖外部作用域的变量声明

### 块级作用域变量的获取

当let声明出现在循环体里时拥有完全不同的行为。 不仅是在循环里引入了一个新的变量环境，而是针对 每次迭代都会创建这样一个新作用域。 这就是我们在使用立即执行的函数表达式时做的事，所以在 setTimeout例子里我们仅使用let声明就可以了。

```ts
for (let i = 0; i < 10 ; i++) {
    setTimeout(function() {console.log(i); }, 100 * i);
}
```

### const 声明

拥有与 let相同的作用域规则，但是不能对它们重新赋值。

```ts
const numLivesForCat = 9;
const kitty = {
    name: "Aurora",
    numLives: numLivesForCat,
}

// Error
kitty = {
    name: "Danielle",
    numLives: numLivesForCat
};

// all "okay"
kitty.name = "Rory";
kitty.name = "Kitty";
kitty.name = "Cat";
kitty.numLives--;
```

ts可以通过接口设置属性只读

使用最小特权原则，所有变量除了你计划去修改的都应该使用const。 基本原则就是如果一个变量不需要对它写入，那么其它使用这些代码的人也不能够写入它们，并且要思考为什么会需要对这些变量重新赋值。 使用 const也可以让我们更容易的推测数据的流动。

### 解构
#### 解构数组
```ts
// 解构数组
let input = [1, 2];
let [first, second] = input;
console.log(first); // outputs 1
console.log(second); // outputs 2

// 解构可以作用于已声明的变量
// swap variables
[first, second] = [second, first];

// 作用于函数参数：
function f([first, second]: [number, number]) {
    console.log(first);
    console.log(second);
}
f(input);

// 可以在数组里使用...语法创建剩余变量
let [first, ...rest] = [1, 2, 3, 4];
console.log(first); // outputs 1
console.log(rest); // outputs [ 2, 3, 4 ]

// 忽略多余的元素
let [first] = [1, 2, 3, 4];
console.log(first); // outputs 1

```
#### 对象解构
```ts
// 对象解构
let o = {
    a: "foo",
    b: 12,
    c: "bar"
};
let { a, b } = o;

({ a, b } = { a: "baz", b: 101 });

// 可以在对象里使用...语法创建剩余变量
let { a, ...passthrough } = o;
let total = passthrough.b + passthrough.c.length;

// 属性重命名
let { a: newName1, b: newName2 } = o;

// 类型指示
// 在变量后面完整的数据结构定义
let {a, b}: {a: string, b: number} = o;


// 默认值
// 在属性为 undefined 时使用缺省值
function keepWholeObject(wholeObject: { a: string, b?: number }) { // 参数类型指示 可选属性
    let { a, b = 1001 } = wholeObject; // 解构默认值
}
```

#### 函数声明
```ts
// 函数声明
type C = { a: string, b?: number }
function f({ a, b }: C): void {
    // ...
}

// 指定默认值
// 需要在默认值之前设置其格式
function f({ a="", b=0 } = {}): void { // 关于类型推断
    // ...
}
f();

// 在解构属性上给予一个默认或可选的属性用来替换主初始化列表。 要知道 C 的定义有一个 b 可选属性：
// 多级的默认属性
function f({ a, b = 0 } = { a: "" }): void {
    // ...
}
f({ a: "yes" }); // ok, default b = 0
f(); // ok, default to {a: ""}, which then defaults b = 0
f({}); // error, 'a' is required if you supply an argument

```
存在深层嵌套解构的时候，堆叠在一起的重命名，默认值和类型注解，会令人难以理解的。 解构表达式要尽量保持小而简单

#### 展开

**它仅包含对象 自身的可枚举属性**  
https://developer.mozilla.org/en-US/docs/Web/JavaScript/Enumerability_and_ownership_of_properties

```ts
// 展开
// 数组
let first = [1, 2];
let second = [3, 4];
let bothPlus = [0, ...first, ...second, 5];

// 对象
let defaults = { food: "spicy", price: "$$", ambiance: "noisy" };
let search = { ...defaults, food: "rich" }; // 后面的会覆盖前面的
let search1 = { food: "rich", ...defaults }; // 会报错

// 它仅包含对象 自身的可枚举属性
class C {
  p = 12;
  m() {
  }
}
let c = new C();
let clone = { ...c };
clone.p; // ok
clone.m(); // error!
```

