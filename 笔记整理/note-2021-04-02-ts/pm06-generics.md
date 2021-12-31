## pm05-函数
[泛型->](https://www.tslang.cn/docs/handbook/generics.html)  
[code->](https://github.com/thetime50/ts-practice/tree/main/pm05-generics/pm05-generics.js)

相当与是一个类型变量 的语法糖  
在使用事可以用自动类型推断
```ts
//      声明类型T变量|使用T变量|使用T变量
function identity<T>(arg: T): T {
    return arg;
}
// 明确的传递T 类型用以类型检查
let output = identity<string>("myString");  // type of output will be 'string'

// 使用类型推断
let output = identity("myString");  // type of output will be 'string'

```

### 使用泛型变量

泛型需要匹配任何类型，也就是说没有明确的类型声明泛型没法使用属性(这和 any 是不同的，any 可以随意使用属性)  
*如何使用泛型属性*  
*如果不适用属性，泛型如何使用*

数组标识可以和泛型变量结合使用  
(数组像一个特殊的修饰符结合其他类型使用)
```ts
function loggingIdentity1<T>(arg: T): T {
    console.log(arg.length);  // Error: T doesn't have .length
    return arg;
}
function loggingIdentity2<T>(arg: T[]): T[] {
    console.log(arg.length);  // Array has a .length, so no more error
    return arg;
}
function loggingIdentity3<T>(arg: Array<T>): Array<T> {
    console.log(arg.length);  // Array has a .length, so no more error
    return arg;
}
```

### 泛型类型
泛型变量和参数变量一样，不检查变量名称  
泛型函数定义时和一般函数一样， 只是需要把泛型变量定义&lt;&gt;放在前面

```ts
function identity<T>(arg: T): T {
    return arg;
}

let myIdentity: <U>(arg: U) => U = identity;

// 带有调用签名的对象字面量
let myIdentity1: { <T>(arg: T): T } = identity;

// 抽象为泛型函数接口定义
interface GenericIdentityFn {
    <T>(arg: T): T;
}

function identity1<T>(arg: T): T {
    return arg;
}

let myIdentity2: GenericIdentityFn = identity1;
```

### 泛型类

同样是和函数声明一样， 在最前面用&lt;&gt;声明泛型变量  
在实例化时传递泛型变量的类型 (就像函数在函数调用时传递一样)
泛型类指的是实例部分的类型，所以类的静态属性不能使用这个泛型类型。  
(没法用在静态部分就没法通过 constructor 来传递类型做推断 )

```ts
class GenericNumber<T> {
    zeroValue: T;
    add: (x: T, y: T) => T;
}

let myGenericNumber = new GenericNumber<number>();
myGenericNumber.zeroValue = 0;
myGenericNumber.add = function(x, y) { return x + y; };

let stringNumeric = new GenericNumber<string>();
stringNumeric.zeroValue = "";
stringNumeric.add = function(x, y) { return x + y; };

console.log(stringNumeric.add(stringNumeric.zeroValue, "test"));

```

### 泛型约束

像接口继承那样用 extends 关键字约束泛型 检查指定字段

```ts
interface Lengthwise {
    length: number;
}
// 检查必须是有length字段的对象
function loggingIdentity<T extends Lengthwise>(arg: T): T {
    console.log(arg.length);  // Now we know it has a .length property, so no more error
    return arg;
}
loggingIdentity({length: 10, value: 3});
```

**在泛型约束中使用类型参数**

检查传入的对象包含传入某个参数的属性

```ts
function getProperty<T, K extends keyof T>(obj: T, key: K) {
    return obj[key];
}

let x = { a: 1, b: 2, c: 3, d: 4 };

getProperty(x, "a"); // okay
getProperty(x, "m"); // error
```

**在泛型里使用类类型**  

通过生产函数进行类型推断，检查类(构造函数)和结构
```ts 
// 泛型 加 类型推断 加 构造函数签名
function create<T>(c: {new(): T; }): T {
    return new c();
}
```

可以在加上泛型约束检查类的实例满足指定结构
```ts
class BeeKeeper {
    hasMask: boolean;
}

class ZooKeeper {
    nametag: string;
}

class Animal {
    numLegs: number;
}

class Bee extends Animal {
    keeper: BeeKeeper = new BeeKeeper();
}

class Lion extends Animal {
    keeper: ZooKeeper = new ZooKeeper();
}

// 泛型 加 类型推断 加 构造函数签名 加泛型约束
function createInstance<A extends Animal>(c: new () => A): A {
    return new c();
}

createInstance(Lion).keeper.nametag;  // typechecks!
createInstance(Bee).keeper.hasMask;   // typechecks!

```
