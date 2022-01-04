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
function f(x: number, y?: number) {
    return x + (y || 0);
}
f(1, 2);
f(1);
f(1, undefined);
f(1, null); // error, 'null' is not assignable to 'number | undefined'

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


