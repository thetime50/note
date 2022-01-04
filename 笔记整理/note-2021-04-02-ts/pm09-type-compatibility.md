[类型推论->](https://www.tslang.cn/docs/handbook/type-compatibility.html)  
[code->](https://github.com/thetime50/ts-practice/tree/main/pm09-type-compatibility/pm09-type-compatibility.ts)


TypeScript里的类型兼容性是基于结构子类型的。

- 结构类型 有相同结构即视为同类型
- 名义（nominal）类型 数据类型的兼容性或等价性是通过明确的声明和/或类型的名称来决定

note: [名义化类型](https://jkchao.github.io/typescript-book-chinese/tips/nominalTyping.html)


```ts
interface Named {
    name: string;
}

class Person {
    name: string;
}

let p: Named;
// OK, because of structural typing
p = new Person();
```
如果是基于名义类型的语言会报错，Person类没有明确说明其实现了Named接口。

TypeScript的结构性子类型是根据JavaScript代码的典型写法来设计的。 因为JavaScript里广泛地使用匿名对象，例如函数表达式和对象字面量，所以使用结构类型系统来描述这些类型比使用名义类型系统更好。

//  匿名对象没有明确声明类型，直接使用内部属性外层没有直接使用，往往兼容其他属性

```js
// 函数表达式
let a = function (x) { return x; };
// 对象字面量
({ x: 1, y: 2 }).a;
```

TypeScript的类型系统允许某些在编译阶段无法确认其安全性的操作,这样特性的类型系统被当作不可靠的。
- 什么时候会发生这种情况
- 有利的一面

### 开始

1. 只检查接口定义的属性和类型
2. 递归检查对象每个成员及子成员

不只是 对象字面量对 指定类型的变量， 指定类型对指定类型也是可以兼容的

```ts
interface Named {
    name: string;
}

let x: Named;
// y's inferred type is { name: string; location: string; }
let y = { name: 'Alice', location: 'Seattle' };
x = y;


function greet(n: Named) {
    console.log('Hello, ' + n.name);
}
greet(y); // OK
```

### 比较两个函数
函数赋值时的类型兼容 

#### 函数参数和返回值

- 参数兼容 多参数的类型用少参数的函数赋值，即引用的时候传参多，函数里有参数没用到
- 返回值兼容 同对象兼容

```ts
// 参数
let x = (a: number) => 0;
let y = (b: number, s: string) => 0;

y = x; // OK
x = y; // Error

// 返回值 同对象兼容
let x = () => ({name: 'Alice'});
let y = () => ({name: 'Alice', location: 'Seattle'});

x = y; // OK
y = x; // Error, because x() lacks a location property
```

#### 函数参数双向协变 

函数参数类型兼容  

允许把更精确的参数类型的函数赋值给不精确的函数类型

```ts
enum EventType { Mouse, Keyboard }

interface Event { timestamp: number; }
interface MouseEvent extends Event { x: number; y: number }
interface KeyEvent extends Event { keyCode: number }

function listenEvent(eventType: EventType, handler: (n: Event) => void) {
    /* ... */
}

// Unsound, but useful and common
// 不稳妥的没有显示的声明参数类型的变化
listenEvent(EventType.Mouse, (e: MouseEvent) => console.log(e.x + ',' + e.y));

// Undesirable alternatives in presence of soundness
// 参数上使用相同类型， 参数使用时转换类型
listenEvent(EventType.Mouse, (e: Event) => console.log((<MouseEvent>e).x + ',' + (<MouseEvent>e).y));
// 对函数使用类型转换转换参数类型
listenEvent(EventType.Mouse, <(e: Event) => void>((e: MouseEvent) => console.log(e.x + ',' + e.y)));

// Still disallowed (clear error). Type safety enforced for wholly incompatible types
// 不允许使用完全不兼容的类型
listenEvent(EventType.Mouse, (e: number) => console.log(e));
```

#### 可选参数及剩余参数

可选参数与必须参数是可互换的，源类型或者目标类型上额外的可选参数也不是错误

剩余参数时，它被当做无限个可选参数。

*这对于类型系统来说是不稳定的，但从运行时的角度来看，可选参数一般来说是不强制的，因为对于大多数函数来说相当于传递了一些undefinded。*

常见的函数接收一个回调函数并用对于程序员来说是可预知的参数但对类型系统来说是不确定的参数来调用
```ts

function invokeLater(args: any[], callback: (...args: any[]) => void) {
    /* ... Invoke callback with 'args' ... */
}

// 不合理的 - invokeLater "可能" 提供任何数量的参数
invokeLater([1, 2], (x, y) => console.log(x + ', ' + y));

// 有疑惑的 (实际上需要x和y)但是无法被发现
invokeLater([1, 2], (x?, y?) => console.log(x + ', ' + y));

```

感觉就是为了一定的兼容性不对可选参数与必须参检查

```ts

    let fn: (a?: string, b?: string, c?: string,) => void;
    fn = (a, b, c) => {
        console.log(a, b, c);
    }

    let fn1: (a: string, b: string, c: string,) => void;
    fn1 = (a?: string, b?: string, c?: string) => {
        console.log(a, b, c);
    }
```


#### 函数重载

对于有重载的函数，源函数的每个重载都要在目标函数上找到对应的函数签名。 这确保了目标函数可以在所有源函数可调用的地方调用。


### 枚举

- 数字类型和枚举类型互相兼容
- 不同的枚举类型不兼容

```ts
enum Status { Ready, Waiting };
enum Color { Red, Blue, Green };

let status = Status.Ready;
status = Color.Green;  // Error
```

### 类

类的兼容性类似对象和接口，只是只有实例的成员会被比较。 静态成员和构造函数不在比较的范围内。

```ts
class Animal {
    feet: number;
    constructor(name: string, numFeet: number) { }
}

class Size {
    feet: number;
    constructor(numFeet: number) { }
}

let a: Animal;
let s: Size;

a = s;  // OK
s = a;  // OK
```

**类的私有成员和受保护成员**

- 目标类型包含一个私有成员或者受保护成员，那么源类型必须包含来自同一个类

### 泛型

类型参数只影响使用其做为类型一部分的结果类型 (泛型变量有被用到的地方会被检查)

```ts
interface Empty<T> {
}
let x: Empty<number>;
let y: Empty<string>;

x = y;  // OK, because y matches structure of x

interface NotEmpty1<T> {
    data: T;
}
let x1: NotEmpty1<number>;
let y1: NotEmpty1<string>;

// x1 = y1;  // Error, because x and y are not compatible
```

```ts
let identity = function<T>(x: T): T {
    // ...
}

let reverse = function<U>(y: U): U {
    // ...
}

identity = reverse;
```


### 高级主题

**子类型与赋值**

“兼容性”在语言规范里没有定义
TypeScript里，有两种兼容性：子类型和赋值  
赋值扩展了子类型兼容性，增加了一些规则，允许和any来回赋值，以及enum和对应数字值之间的来回赋值。

类型兼容性是由赋值兼容性来控制的，即使在implements和extends语句也不例外。


[高级主题 en](https://www.typescriptlang.org/docs/handbook/type-compatibility.html#advanced-topics)
"*"表示仅在strictNullChecks关闭时兼容的组合。
|  | any | unknown | object | void | undefined | null | never |
| :--       | :-- | :-- | :-- | :-- | :-- | :-- | :-- |
| any       |   | ✔ | ✔  | ✔  | ✔  | ✔  | ✕ |
| unknown   | ✔ |   | ✕  | ✕  | ✕  | ✕  | ✕ |
| object    | ✔ | ✔ |    | ✕  | ✕  | ✕  | ✕ |
| void      | ✔ | ✔ | ✕  |    | ✕  | ✕  | ✕ |
| undefined | ✔ | ✔ | ✔* | ✔  |    | ✔* | ✕ |
| null      | ✔ | ✔ | ✔* | ✔* | ✔* |    | ✕ |
| never     | ✔ | ✔ | ✔  | ✔  | ✔  | ✔  |   |


