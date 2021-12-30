## pm05-函数
[函数->](https://www.tslang.cn/docs/handbook/functions.html)  
[code->](https://github.com/thetime50/ts-practice/tree/main/pm05-function/pm05-function.js)

函数可以使用函数体外部的变量,这时可以叫做函数‘捕获’了这些变量(闭包)

- 函数类型声明类似 箭头函数语法
- 可以给每个参数声明类型
- 可以给返回值声明类型, 也可以省略返回值的类型 TS 会根据返回值自动推断

函数类型声明中参数只限制类型不检查参数名称  
没有返回值这声明返回值为viod  
捕获变量不会体现在函数类型声明中

```ts
let myAdd: (baseValue: number, increment: number) => number /*函数声明部分*/ =
    function(x: number, y: number): number { return x + y; }; // 函数本体
```

### 推断类型

赋值时可以只在一边声明类型，另一半回自动推断
```ts
// 变量没有声明类型 函数字面量有完整声明类型
// myAdd has the full function type
let myAdd = function(x: number, y: number): number { return x + y; };

// 变量声明了类型 函数字面量没有声明类型
// The parameters `x` and `y` have the type number
let myAdd: (baseValue: number, increment: number) => number =
    function(x, y) { return x + y; };
```

### 可选参数和默认参数

TS会检查声明的参数又有传入值并且没有多余的参数传入

- 函数可选参数用?来标识，默认参数用=来标识  
- 可选参数必须跟在必须参数后面  
- 默认参数可以不用赋值最后

可选参数和公用参数使用同样的数据类型
```ts
(firstName: string, lastName?: string) => string
```

```ts
// 可选参数
function buildName(firstName: string, lastName?: string) {
}

let result1 = buildName("Bob");  // works correctly now
let result2 = buildName("Bob", "Adams", "Sr.");  // error, too many parameters
let result3 = buildName("Bob", "Adams");  // ah, just right

function buildName(firstName: string, lastName = "Smith") {
    return firstName + " " + lastName;
}

let result1 = buildName("Bob");                  // works correctly now, returns "Bob Smith"
let result2 = buildName("Bob", undefined);       // still works, also returns "Bob Smith"
let result3 = buildName("Bob", "Adams", "Sr.");  // error, too many parameters
let result4 = buildName("Bob", "Adams");         // ah, just right

// 默认参数可以不用赋值最后
function buildName(firstName = "Will", lastName: string) {
    return firstName + " " + lastName;
}
let result4 = buildName(undefined, "Adams"); // 传入undiffined使用默认值
```

```ts
// 共用类型

    let fa = function (x: number, y: number) {
        return 'rrr'
    }

    let fb = function (x: number, y?: string) {
        return 'rrr'
    }

    let fc = function (x: number, y = 'a') {
        return 'rrr'
    }

    // let ft1: typeof fa = fb // error
    let ft2: typeof fb = fc
```

### 剩余参数

使用...来表示剩余参数
```ts
function buildName(firstName: string, ...restOfName: string[]) {
  return firstName + " " + restOfName.join(" ");
}

let buildNameFun: (fname: string, ...rest: string[]) => string = buildName;
```

### this
解决对象函数引用this类型问题  
通过声明this参数类型限制只能通过指定对象来引用

```ts
interface AddInterfack {
    a: number;
    b: number;
    fn: (this: AddInterfack) => number;
}
let addObj:AddInterfack = {
    a: 1,
    b: 2,
    fn: function() {
        return this.a + this.b
    }
}
console.log(addObj.fn())
```

原例子
```ts
interface Card {
    suit: string;
    card: number;
}
interface Deck {
    suits: string[];
    cards: number[];
    createCardPicker(this: Deck): () => Card;
}
let deck: Deck = {
    suits: ["hearts", "spades", "clubs", "diamonds"],
    cards: Array(52),
    // NOTE: The function now explicitly specifies that its callee must be of type Deck
    createCardPicker: function(this: Deck) {
        return () => {
            let pickedCard = Math.floor(Math.random() * 52);
            let pickedSuit = Math.floor(pickedCard / 13);

            return {suit: this.suits[pickedSuit], card: pickedCard % 13};
        }
    }
}

let cardPicker = deck.createCardPicker();
let pickedCard = cardPicker();

alert("card: " + pickedCard.card + " of " + pickedCard.suit);
```


解决回调函数的this参数类型声明问题
