[高级类型->](https://www.tslang.cn/docs/handbook/advanced-types.html)  
[code->](https://github.com/thetime50/ts-practice/tree/main/advanced-types/advanced-types.js)

### 交叉类型（Intersection Types）

用'&'连接类型 把几个类型的属性混合

```ts
function extend<T, U>(first: T, second: U): T & U {
    let result = <T & U>{};
    for (let id in first) {
        (<any>result)[id] = (<any>first)[id];
    }
    for (let id in second) {
        if (!result.hasOwnProperty(id)) {
            (<any>result)[id] = (<any>second)[id];
        }
    }
    return result;
}

class Person {
    constructor(public name: string) { }
}
interface Loggable {
    log(): void;
}
class ConsoleLogger implements Loggable {
    log() {
        // ...
    }
}
var jim = extend(new Person("Jim"), new ConsoleLogger());
var n = jim.name;
jim.log();
```

### 联合类型（Union Types）

用'|'连接类型 只能访问共有成员

```ts

function padLeft(value: string, padding: string | number) {
    // ...
}

let indentedString = padLeft("Hello world", true); // errors during compilation

interface Bird {
    fly();
    layEggs();
}

interface Fish {
    swim();
    layEggs();
}

function getSmallPet(): Fish | Bird {
    // ...
}

let pet = getSmallPet();
pet.layEggs(); // okay
pet.swim();    // errors
```

### 类型保护与区分类型
JavaScript里常用来区分2个可能值的方法是检查成员是否存在。

```ts
let pet = getSmallPet();

// 每一个成员访问都会报错
if (pet.swim) {
    pet.swim();
}
else if (pet.fly) {
    pet.fly();
}

// 使用类型断言
let pet = getSmallPet();

if ((<Fish>pet).swim) {
    (<Fish>pet).swim();
}
else {
    (<Bird>pet).fly();
}
```

#### 用户自定义的类型保护

类型保护机制在运行时检查以确保在某个作用域里的类型  

使用类型谓词声明返回值类型  
谓词为 parameterName is Type这种形式， **parameterName必须是来自于当前函数签名里的一个参数名**。

```ts

function isFish(pet: Fish | Bird): pet is Fish {
    return (<Fish>pet).swim !== undefined;
}


if (isFish(pet)) {
    pet.swim();
}
else {
    pet.fly();
}
```

#### typeof类型保护

对于原始类型，TypeScript可以将typeof识别为一个类型保护  
TS只有两种形式能被识别： typeof v === "typename"和 typeof v !== "typename"  
"typename"必须是**"number"， "string"， "boolean"或 "symbol"**。 但是TypeScript并不会阻止你与其它字符串比较，语言不会把那些表达式识别为类型保护


#### instanceof类型保护

instanceof类型保护是通过构造函数来细化类型

```ts
interface Padder {
    getPaddingString(): string
}

class SpaceRepeatingPadder implements Padder {
    constructor(private numSpaces: number) { }
    getPaddingString() {
        return Array(this.numSpaces + 1).join(" ");
    }
}

class StringPadder implements Padder {
    constructor(private value: string) { }
    getPaddingString() {
        return this.value;
    }
}

function getRandomPadder() {
    return Math.random() < 0.5 ?
        new SpaceRepeatingPadder(4) :
        new StringPadder("  ");
}

// 类型为SpaceRepeatingPadder | StringPadder
let padder: Padder = getRandomPadder();

if (padder instanceof SpaceRepeatingPadder) {
    padder; // 类型细化为'SpaceRepeatingPadder'
}
if (padder instanceof StringPadder) {
    padder; // 类型细化为'StringPadder'
}
```

instanceof的右侧要求是一个构造函数，TypeScript将细化为：

- 此构造函数的 prototype属性的类型，如果它的类型不为 any的话
- 构造签名所返回的类型的联合 ??

### 可以为null的类型

特殊类型null与 undefined具有值null与 undefined

null与 undefined可以赋值给任何类型，null与 undefined是所有其它类型的一个有效值

--strictNullChecks标记可以禁止 声明一个变量时，自动地包含 null或 undefined

TypeScript会把 null和 undefined区别对待。 string | null， string | undefined和 string | undefined | null是不同的类型。

```ts
// --strictNullChecks
let s = "foo";
s = null; // 错误, 'null'不能赋值给'string'
let sn: string | null = "bar";
sn = null; // 可以

sn = undefined; // error, 'undefined'不能赋值给'string | null'
```

#### 可选参数和可选属性

对 --strictNullChecks 配置 函数可选参数会被自动地加上 | undefined  
可选属性也会自动加上 | undefined  
(ts里面的可选参数就相当于传undifined)
```ts
// --strictNullChecks
function f(x: number, y?: number) {
    return x + (y || 0);
}
f(1, 2);
f(1);
f(1, undefined);
// f(1, null); // error, 'null' is not assignable to 'number | undefined'

class C {
    a: number;
    b?: number;
}
let c = new C();
c.a = 12;
// c.a = undefined; // error, 'undefined' is not assignable to 'number'
c.b = 13;
c.b = undefined; // ok
// c.b = null; // error, 'null' is not assignable to 'number | undefined'
```

#### 类型保护和类型断言
同样是在--strictNullChecks 配置下 如果类型联合了null，那么在内部使用或返回时 使用类型保护来去除 null
```ts
function f(sn: string | null): string {
    if (sn == null) {
        return "default";
    }
    else {
        return sn;
    }
}
```

通过 添加!后缀 使用类型断言手动去除 ([非空断言 告诉编译器不可能是空值](https://www.typescriptlang.org/docs/handbook/release-notes/typescript-2-0.html#non-null-assertion-operator) )  
ts无法跟踪所有对嵌套函数的调用 (无法跟踪函数的闭包变量类型， 无法通过类型推论确定类型)

```ts

function broken(name: string | null): string {
    function postfix(epithet: string) {
        return name.charAt(0) + '.  the ' + epithet; // error, 'name' is possibly null
    }
    name = name || "Bob";
    return postfix("great");
}

function fixed(name: string | null): string {
    function postfix(epithet: string) {
        return name!.charAt(0) + '.  the ' + epithet; // ok
    }
    name = name || "Bob";
    return postfix("great");
}

```

### 类型别名

类型别名给类型起个新名字。 像接口，但是可以作用于原始值，联合类型，元组以及其它任何你需要手写的类型。

型别名也可以是泛型  
可以作为属性值  
可以在属性里引用自己

```ts
// 别名
type Name = string;
type NameResolver = () => string;
type NameOrResolver = Name | NameResolver;
function getName(n: NameOrResolver): Name {
    if (typeof n === 'string') {
        return n;
    }
    else {
        return n();
    }
}

// 作为属性值
type Container<T> = { value: T };

// 可以在属性里引用自己
type Tree<T> = {
    value: T;
    left: Tree<T>;
    right: Tree<T>;
}
```

配合交叉类型使用  
别名不能出现在声明右侧的任何地方  

```ts
// 可以是数据类型或 数据-链表类型
type LinkedList<T> = T & { next: LinkedList<T> };

interface Person {
    name: string;
}

var people: LinkedList<Person>;
var s = people.name;
var s = people.next.name;
var s = people.next.next.name;
var s = people.next.next.next.name;

// 别名不能出现在声明右侧的任何地方
type Yikes = Array<Yikes>; // error
```
#### 接口 vs. 类型别名

接口 类型别名 区别

类型别名不会创建新的类型，错误信息不会使用类型别名。  
类型别名不能被 extends和 implements（自己也不能 extends和 implements其它类型）  
(软件中的对象应该对于扩展是开放的，但是对于修改是封闭的，尽量去使用接口代替类型别名。)
无法通过接口来描述一个类型并且需要使用联合类型或元组类型时会使用类型别名。

// note  
接口可以用来给接口继承 (extends) ,类限制 (class implements)  
类型别名使用 = 赋值，像接口一样定义数据结构和泛型，可以做交叉类型(&) 联合类型运算(|) 

```ts
type Alias = { num: number }
interface Interface {
    num: number;
}
declare function aliased(arg: Alias): Alias;
declare function interfaced(arg: Interface): Interface;
```

### 字符串字面量类型
串字面量类型指定字符串必须的固定值  
可以像类型一样用于函数重载

```ts
// 类似枚举类型的字符串
type Easing = "ease-in" | "ease-out" | "ease-in-out";
class UIElement {
    animate(dx: number, dy: number, easing: Easing) {
        if (easing === "ease-in") {
            // ...
        }
        else if (easing === "ease-out") {
        }
        else if (easing === "ease-in-out") {
        }
        else {
            // error! should not pass null or undefined.
        }
    }
}

let button = new UIElement();
button.animate(0, 0, "ease-in");
button.animate(0, 0, "uneasy"); // error: "uneasy" is not allowed here

// 用与函数重载
function createElement(tagName: "img"): HTMLImageElement;
function createElement(tagName: "input"): HTMLInputElement;
// ... more overloads ...
function createElement(tagName: string): Element {
    // ... code goes here ...
}
```

### 数字字面量类型
很少直接这样使用

```ts
function rollDie(): 1 | 2 | 3 | 4 | 5 | 6 {
    // ...
}

function foo(x: number) {
    if (x !== 1 || x !== 2) {
        //         ~~~~~~~
        // Operator '!==' cannot be applied to types '1' and '2'.
    }
}
```

### 枚举成员类型

当每个枚举成员都是用字面量初始化的时候枚举成员是具有类型的。

- 单例类型 - 枚举成员类型和数字/字符串字面量类型
- 字面量类型 - 数字/字符串字面量类型??
### 可辨识联合（Discriminated Unions）

合并单例类型(字面量)，联合类型，类型保护(类相关的判断语句和类型推论等)和类型别名来创建一个叫做 **可辨识联合**的高级模式，(它也称做 标签联合或 代数数据类型)

特征：
1. 具有普通的<u>单例类型属性</u>— 可辨识的特征。
2. 一个类型别名包含了那些类型的联合— 联合。
3. 此属性上的类型保护。

```ts
interface Square {
    kind: "square"; // 可辨识的特征
    size: number;
}
interface Rectangle {
    kind: "rectangle";
    width: number;
    height: number;
}
interface Circle {
    kind: "circle";
    radius: number;
}

type Shape = Square | Rectangle | Circle; // 联合

function area(s: Shape) {
    switch (s.kind) { // 类型保护
        case "square": return s.size * s.size;
        case "rectangle": return s.height * s.width;
        case "circle": return Math.PI * s.radius ** 2;
    }
}

```

完整性检查

添加了联合类型时，需要在函数处理的地方同时添加相应类型的处理，否则需要能够触发编译器报错

- 方法1 --strictNullChecks配置下 添加处理函数返回值，编译器会检查到没有case到的返回undefined并报错
- 方法2 使用never类型，需要定义一个额外的函数

never类型 用来给编译器检查收窄类型时无法处理的类型有编译器发出错误。 就像 throw new Error("error"); 执行到即报错  
 (在 switch 当中判断 type，TS 是可以收窄类型的 (discriminated union) [TypeScript中的never类型具体有什么用](https://www.zhihu.com/question/354601204))

 ```ts
function area(s: Shape): number { // error: returns number | undefined
    switch (s.kind) {
        case "square": return s.size * s.size;
        case "rectangle": return s.height * s.width;
        case "circle": return Math.PI * s.radius ** 2;
    }
}

function assertNever(x: never): never {
    throw new Error("Unexpected object: " + x);
}
function area(s: Shape) {
    switch (s.kind) {
        case "square": return s.size * s.size;
        case "rectangle": return s.height * s.width;
        case "circle": return Math.PI * s.radius ** 2;
        default: return assertNever(s); // error here if there are missing cases
    }
}
 ```


### 多态的 this类型

多态的 this类型表示的是某个包含类或接口的 子类型，称做 F-bounded多态性，表现连贯接口间的继承

```ts
class BasicCalculator {
    public constructor(protected value: number = 0) { }
    public currentValue(): number {
        return this.value;
    }
    public add(operand: number): this {
        this.value += operand;
        return this;
    }
    public multiply(operand: number): this {
        this.value *= operand;
        return this;
    }
    // ... other operations go here ...
}

let v = new BasicCalculator(2)
            .multiply(5)
            .add(1)
            .currentValue();
```
继承类后可以直接使用之前的方法

```ts
class ScientificCalculator extends BasicCalculator {
    public constructor(value = 0) {
        super(value);
    }
    public sin() {
        this.value = Math.sin(this.value);
        return this;
    }
    // ... other operations go here ...
}

let v = new ScientificCalculator(2)
        .multiply(5)
        .sin()
        .add(1)
        .currentValue();
```

### 索引类型

使用索引类型，编译器就能够检查使用了动态属性名的代码  
- **索引类型查询** *keyof T* 对于任何类型 T， keyof T的结果为 T上已知的公共属性名的联合(算是字符串字面量类型)
- **索引访问操作符**  *T\[K\]* 访问了 T类型里面K属性的类型

编译器会检查 K是否真的是T的属性名
```ts
// 从对象中选取属性的子集
function pluck<T, K extends keyof T>(o: T, names: K[]): T[K][] {
  return names.map(n => o[n]);
}

interface Person {
    name: string;
    age: number;
}
let person: Person = {
    name: 'Jarid',
    age: 35
};
let strings: string[] = pluck(person, ['name']); // ok, string[]

// 索引类型查询操作符
let personProps: keyof Person; // 'name' | 'age'
let personProps: keyof Person = 'a'; // error

// 获取一个属性
let name: Person['name'] = person.name; // string
// 你返回 T[K]的结果，编译器会实例化键的真实类型
function getProperty<T, K extends keyof T>(o: T, name: K): T[K] {
    return o[name]; // o[name] is of type T[K]
}
let name: string = getProperty(person, 'name');
let age: number = getProperty(person, 'age');
let unknown = getProperty(person, 'unknown'); // error, 'unknown' is not in 'name' | 'age'
```

**索引类型和字符串索引签名**
keyof和 T[K]与字符串索引签名进行交互。 如果你有一个带有字符串索引签名的类型，那么 keyof T会是 string。 并且 T[string]为索引签名的类型：

```ts
interface Map<T> {
    [key: string]: T;
}
let keys: keyof Map<number> = 'any string'; // string
let value: Map<number>['foo'] = 3; // number
```

### 映射类型

类型以相同的形式去转换旧类型里每个属性

[同态](https://en.wikipedia.org/wiki/Homomorphism)转换
```ts
interface Person {
    name: string;
    age: number;
}
type Readonly<T> = {
    readonly [P in keyof T]: T[P];
}
type Partial<T> = {
    [P in keyof T]?: T[P];
}

type PersonPartial = Partial<Person>;
type ReadonlyPerson = Readonly<Person>;

// 一个简单的实现
type Keys = 'option1' | 'option2';
type Flags = { [K in Keys]: boolean };

// 通用版本
type Nullable<T> = { [P in keyof T]: T[P] | null }
type Partial<T> = { [P in keyof T]?: T[P] }

```


包装类型
- Proxy&lt;T&gt; // 包装只读类型
- Proxy&lt;T&gt; // 包装代理类型
- Pick&lt;T&gt; // 
- Record&lt;T&gt; // 包装固定类型字典型 不是同态 字段类型不是以输入类型拷贝属性

[How to use ES6 Proxy in Typescript?](https://stackoverflow.com/questions/59390026/how-to-use-es6-proxy-in-typescript)
```ts
type Proxy<T> = {
    get(): T;
    set(value: T): void;
}
type Proxify<T> = {
    [P in keyof T]: Proxy<T[P]>;
}
function proxify<T>(o: T): Proxify<T> {
   // ... wrap proxies ...
}
let proxyProps = proxify(props);

type Pick<T, K extends keyof T> = {
    [P in K]: T[P];
}
type Record<K extends string, T> = {
    [P in K]: T;
}

type ThreeStringProps = Record<'prop1' | 'prop2' | 'prop3', string>

// K extends keyof T 传入的是对象类型
// K extends string 传入的是字面量类型

```

**由映射类型进行推断**

拆包

这个拆包推断只适用于同态的映射类型。 如果映射类型不是同态的，那么需要给拆包函数一个明确的类型参数。

通过类型映射逻辑对函数返回值类型进行推断
```ts
function unproxify<T>(t: Proxify<T>): T {
    let result = {} as T;
    for (const k in t) {
        result[k] = t[k].get();
    }
    return result;
}

let originalProps = unproxify(proxyProps);
```


