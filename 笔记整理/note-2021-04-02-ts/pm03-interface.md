## pm03-接口
[code->](https://github.com/thetime50/ts-practice/tree/main/pm03-interface/pm03-interface.ts)

检查属性存在并且类型匹配，不会检查顺序

```ts
// 接口
interface LabelledValue {
  label: string;
}

function printLabel(labelledObj: LabelledValue) {
  console.log(labelledObj.label);
}

let myObj = {size: 10, label: "Size 10 Object"};
printLabel(myObj);


// 可选属性
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


// 额外的属性检查
//  如果一个对象字面量存在任何“目标类型”不包含的属性时，你会得到一个错误
// error: 'colour' not expected in type 'SquareConfig'
let mySquare = createSquare({ colour: "red", width: 100 });
// 使用类型断言(强制转换)
let mySquare = createSquare({ width: 100, opacity: 0.5 } as SquareConfig);
// 带有其他属性声明
interface SquareConfig {
    color?: string;
    width?: number;
    [propName: string]: any;
}
// 使用变量跳过类型检查
let squareOptions = { colour: "red", width: 100 };
let mySquare = createSquare(squareOptions);

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
mySearch1 = function(src, sub): boolean {
  let result = src.search(sub);
  return result > -1;
}
```

### 可索引的类型
TypeScript支持两种索引签名：字符串和数字  
可以同时使用,但是数字索引的返回值必须是字符串索引返回值类型的子类型。  
数字索引也会被转为字符串  
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

// 范围大的的父类型 (属性少)
interface NumberDictionary {
  [index: string]: number;
  length: number;    // 可以，length是number类型
  name: string       // 错误，`name`的类型与索引类型返回值的类型不匹配
}

// 只读的索引签名
interface ReadonlyStringArray {
    readonly [index: number]: string;
}
let myArray: ReadonlyStringArray = ["Alice", "Bob"];
myArray[2] = "Mallory"; // error!

```

### 类类型
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
    new (hour: number, minute: number);
}

class Clock implements ClockConstructor {
    currentTime: Date;
    constructor(h: number, m: number) { }
}
```
```ts
interface ClockConstructor { // 类构造函数声明 // 这个是不是可以直接修饰 constructor
    new (hour: number, minute: number): ClockInterface; // 生成实例的构造函数
}
interface ClockInterface { // 类实例声明
    tick();
}

function createClock(ctor: ClockConstructor, hour: number, minute: number): ClockInterface {
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