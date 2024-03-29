## pm03-接口
[接口->](https://www.tslang.cn/docs/handbook/interfaces.html)  
[code->](https://github.com/thetime50/ts-practice/tree/main/pm03-interface/pm03-interface.ts)

鸭式辩型： 如果它走起路来像鸭子，叫起来也是鸭子，那么它就是鸭子

检查属性存在并且类型匹配，不会检查顺序

// todo option bag??

```ts
// 接口
interface LabelledValue {
  label: string;
}

function printLabel(labelledObj: LabelledValue) {
  console.log(labelledObj.label);
}
// 也可以直接在函数参数后面使用用匿名接口
function printLabel(labelledObj: { label: string }) {
  console.log(labelledObj.label);
}

let myObj = {size: 10, label: "Size 10 Object"};
printLabel(myObj);


// 可选属性 (可以缺少属性但是不能多出是属性)
interface SquareConfig {
  color?: string;
  width?: number;
}
// 拼写检查 引用不存在的属性会报错
// 加了可选标识会失去属性必要检查

// 只读属性
interface Point {
    readonly x: number;
    readonly y: number;
}
let p1: Point = { x: 10, y: 20 };
p1.x = 5; // error!
// 数组只读
let a: number[] = [1, 2, 3, 4];
let ro: ReadonlyArray<number> = a;
ro[0] = 12; // error!
ro.push(5); // error!
ro.length = 100; // error!
a = ro; // error!
// 可变数组可以赋值给只读数组 
// 只读数组赋值给可变数组需要声明转换
a = or as number[];
// 做为变量使用的话用 const，若做为属性则使用readonly。


// 额外的属性检查 (检查额外的属性)
// 在变量赋值或者传递函数参数时，如果一个对象字面量存在任何“目标类型”不包含的属性时，会得到一个错误
// error: 'colour' not expected in type 'SquareConfig'
let mySquare = createSquare({ colour: "red", width: 100 });
// 使用类型断言(强制转换) 去除报错
let mySquare = createSquare({ width: 100, opacity: 0.5 } as SquareConfig);
// 带有其他属性声明
interface SquareConfig {
    color?: string;
    width?: number;
    [propName: string]: any;
}
// 使用变量跳过类型检查 // todo 这里是为什么
let squareOptions = { colour: "red", width: 100 };
let mySquare = createSquare(squareOptions);

```

```ts
// 变量可以赋值给满足条件的接口
// 但是字面量在变量赋值或者传递函数参数时时会被检查多余的属性
interface Inf3 {
    color?: string;
    width?: number;
    like?:string,
}

interface Inf1{
    name:string;
    age:number;
    like:string;
}
interface Inf2{
    name:string;
    age:number;
}

const a = {
    name:'666',
    age:3,
    like:'hekaf'
}
const b = {}


const u1:Inf1={
    name:'string',
    age:23,
    like:'string',
}
const u2:Inf1 = u1
// 对于可选的字段
const u31:Inf3 = u1 //有类型的变量需要至少一个匹配的属性
const u32:Inf3 = {} // 可以接受空的字面量
const u33:Inf3 = b // 可以接受空的变量
```

### 函数类型
接口也可以描述函数类型，接口定义一个调用签名  
自定义参数位置和类型  
不检查参数名称

```ts

interface SearchFunc {
  (source: string, subString: string): boolean;
}

// 函数变量赋值
let mySearch: SearchFunc;
mySearch = function(source: string, subString: string) {
  let result = source.search(subString);
  return result > -1;
}
let mySearch1: SearchFunc;
// 就像给变量分配一个没有类型说明的值 ts会尝试检查匹配对应的参数和返回值类型
mySearch1 = function(src, sub) { 
  let result = src.search(sub);
  return result > -1;
}
```

### 可索引的类型
TypeScript支持两种索引签名：字符串和数字  
可以同时使用,但是数字索引的返回值必须是字符串索引返回值类型的子类型。(字符串索引的范围更大)  
数字索引也会被转为字符串  
*ps和 Map 字典对象不同，字典对象可以区分数据类型 如 ('1' 和 1)*
字符串索引签名能描述dictionary模式
```ts
interface StringArray {
  [index: number]: string;
}

let myArray: StringArray;
myArray = ["Bob", "Fred"];

let myStr: string = myArray[0];


class Animal {
    name: string;
}
class Dog extends Animal {
    breed: string;
}

// 错误：使用数值型的字符串索引，有时会得到完全不同的Animal!
// 字符串索引的数据类型要能够包含数值索引的数据类型
interface NotOkay {
    [x: number]: Animal;
    [x: string]: Dog;
}

class AD {
    name: string;
    breed: string;
}
interface More {
    [x: number]: Animal;
    [x: string]: AD;
}

// 范围大的的父类型 (属性少) dictionary模式
interface NumberDictionary {
  [index: string]: number; // !! 使用索引类型会对对象的所有key-value类型约束
  length: number;    // 可以，length是number类型
  name: string       // 错误，`name`的类型与索引类型返回值的类型不匹配
}

// 只读的索引签名 (即固定了初始化时的属性索引， 不能增减少索引)
interface ReadonlyStringArray {
    readonly [index: number]: string;
}
let myArray: ReadonlyStringArray = ["Alice", "Bob"];
myArray[2] = "Mallory"; // error!

```

### 类类型

类静态属性/方法 直接通过类名引用 在类内部加static声明 货类声明后用类名加索引赋值  
原型方法 类内直接声明的方法是原型方法
原型属性 可以在实例中引用 类声明后用类名间原型赋值 ClassName.prototype.attr = value
共有字段声明(实例属性) 直接在类内部声明 class ClassName { height; width=0; }
私有字段声明 属性内部在字段前以#好开始

接口描述了类的公共部分
```ts
interface ClockInterface {
    currentTime: Date;
}

class Clock implements ClockInterface { // 描述实例的数据类型
    currentTime: Date;
    constructor(h: number, m: number) { } // 静态部分
}


interface ClockInterface {
    currentTime: Date;
    setTime(d: Date);
}

class Clock implements ClockInterface {
    currentTime: Date;
    setTime(d: Date) {
        this.currentTime = d;
    }
    constructor(h: number, m: number) { }
}

```


类静态部分与实例部分的区别  
类是具有两个类型的：静态部分的类型和实例的类型  
constructor存在于类的静态部分，所以不在检查的范围内。
```ts
interface ClockConstructor {
    new (hour: number, minute: number); // 构造函数签名 构造类型函数签名
}

class Clock implements ClockConstructor {
    currentTime: Date;
    constructor(h: number, m: number) { }
}
```

ClockConstructor 构造函数检查 生产函数检查 class 类，  
ClockInterface 实例检查， 类声明、构造函数、实例引用时使用

```ts
// 构造器签名 用来检查 class
// 这个接口不能直接对类声明使用 implements 来检查构造函数
// 但是是对类变量有效的
interface ClockConstructor { // 类构造函数声明 // 这个是不是可以直接修饰 constructor
    new (hour: number, minute: number): ClockInterface; //生成实例的构造函数 检查类和初始化函数结构
}
interface ClockInterface { // 类实例声明 检查数据实例数据结构
    tick();
}

function createClock(ctor: ClockConstructor, hour: number, minute: number): ClockInterface { //类实例化函数 类参数检查 实例化参数检查
    return new ctor(hour, minute);
}

class DigitalClock implements ClockInterface {
    constructor(h: number, m: number) { }
    tick() {
        console.log("beep beep");
    }
}
class AnalogClock implements ClockInterface {
    constructor(h: number, m: number) { }
    tick() {
        console.log("tick tock");
    }
}

let digital = createClock(DigitalClock, 12, 17);
let analog = createClock(AnalogClock, 7, 32);
```

### 继承接口

```ts
interface Shape {
    color: string;
}

interface Square extends Shape {
    sideLength: number;
}

let square = <Square>{};
square.color = "blue";
square.sideLength = 10;

// 继承多个

interface PenStroke {
    penWidth: number;
}

interface Square extends Shape, PenStroke {
    sideLength: number;
}

let square = <Square>{};
square.color = "blue";
square.sideLength = 10;
square.penWidth = 5.0;
```

### 混合类型
一个对象可以同时做为函数和对象使用，并带有额外的属性。
```ts
interface Counter {
    (start: number): string;
    interval: number;
    reset(): void;
}

function getCounter(): Counter {
    let counter = <Counter>function (start: number) { };
    counter.interval = 123;
    counter.reset = function () { };
    return counter;
}

let c = getCounter();
c(10);
c.reset();
c.interval = 5.0;
```

### 接口继承类

接口同样会继承到类的private和protected成员

接口继承类时即也声明了数据的继承关系，继承类的接口会检查数据的继承关系

```ts
class Control {
    private state: any;
}

interface SelectableControl extends Control { // 接口继承类
    select(): void; // 这个
}

class Button extends Control implements SelectableControl { // 继承父类 并应用继承接口的定义
    // 通过继承产生state属性
    select() { }
}

class TextBox extends Control {
    select() { }
}

// 错误：“Image”类型缺少“state”属性。
class Image implements SelectableControl {
    // private state: any; // 这里的state必须是由Control 继承而来的 Control->state 类型
    select() { }
}

```
 因为 state是私有成员，所以只能够是Control的子类们才能实现SelectableControl接口。 ？？

