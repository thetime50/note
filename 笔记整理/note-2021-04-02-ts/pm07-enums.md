## pm07-枚举
[枚举->](https://www.tslang.cn/docs/handbook/enums.html)  
[code->](https://github.com/thetime50/ts-practice/tree/main/pm05-enums/pm05-enums.js)

和c一样 默认从0开始，设置的首值后面的就逐一递增  

可以使用常量枚举表达形式初始化第一个枚举  
能够在编译阶段得到值 不能是NaN或 Infinity

```ts
enum Direction {
    Up = 1,// 使用常量枚举表达形式初始化第一个枚举
    Down,
    Left,
    Right
}

enum Direction1 {
    Up , // 0
    Down,
    Left,
    Right
}
```

### 字符串枚举
没有自增行为
```ts
enum Direction {
    Up = "UP",
    Down = "DOWN",
    Left = "LEFT",
    Right = "RIGHT",
}
```

### 异构枚举（Heterogeneous enums）

可以混合使用字符串枚举值和异构枚举值 但是不建议这么使用
```ts
enum BooleanLikeHeterogeneousEnum {
    No = 0,
    Yes = "YES",
}
```

### 计算的和常量成员

```ts
//枚举的第一个成员 没有初始器(值) 默认为0
enum E { X }
// 数组枚举会自增
enum E1 { X, Y, Z }

enum E2 {
    A = 1, B, C
}

enum FileAccess {
    // constant members
    None,
    Read    = 1 << 1,
    Write   = 1 << 2,
    ReadWrite  = Read | Write,
    // computed member
    G = "123".length
}
```

### 联合枚举与枚举成员的类型

字面量枚举成员 什么意思

枚举的成员也是类型，可以限制数据只能是这枚举值

```ts
enum ShapeKind {
    Circle,
    Square,
}

interface Circle {
    kind: ShapeKind.Circle;
    radius: number;
}

interface Square {
    kind: ShapeKind.Square;
    sideLength: number;
}

let c: Circle = {
    kind: ShapeKind.Square,
    //    ~~~~~~~~~~~~~~~~ Error!
    radius: 100,
}
let sq:ShapeKind.Square = ShapeKind.Square
```
枚举类型本身变成了每个枚举成员的 [联合]( https://www.tslang.cn/docs/handbook/advanced-types.html#union-types)

这个例子和联合有什么关系
```ts
enum E {
    Foo, Bar,
}

function f(x: E) {
    if (x !== E.Foo || x !== E.Bar) {
        // Error! Operator '!==' cannot be applied to types 'E.Foo' and 'E.Bar'.
    }
}
```

### 运行时的枚举

枚举是在运行时真正存在的对象。(可以作为对象使用)

```ts
enum E {
    X, Y, Z
}

function f(obj: { X: number }) {
    return obj.X;
}

// Works, since 'E' has a property named 'X' which is a number.
f(E);
```

**反向映射**  
不会为字符串枚举成员生成反向映射  
ts里枚举和key必须是标识符不能是表达式，所以反响映射不会引起错误  
引用枚举成员总会生成为对属性访问并且永远也不会内联代码
```ts
enum Enum {
    A
}
let a = Enum.A;
let nameOfA = Enum[a]; // "A"
```

**const枚举**
避免在额外生成的代码上的开销和额外的非直接的对枚举成员的访问，可以使用 const枚举
在编译阶段会被删除。 常量枚举成员在使用的地方会被内联进来。 常量枚举不允许包含计算成员。  
常量枚举没有反响映射
```ts
const enum Enum {
    A = 1,
    B = A * 2
}
const enum Directions {
    Up,
    Down,
    Left,
    Right
}

let directions = [Directions.Up, Directions.Down, Directions.Left, Directions.Right]
```

**外部枚举**

外部枚举用来描述已经存在的枚举类型。(在编译环境或者代码运行环境里的枚举，不会生成实际的枚举列表)
[TS Enums](https://zhuanlan.zhihu.com/p/125889229)
[How do the different enum variants work in TypeScript?](https://stackoverflow.com/questions/28818849/how-do-the-different-enum-variants-work-in-typescript)
```ts

declare enum AmbiEnum {
    A = 1,
    B,
    C = 2,
}
```
