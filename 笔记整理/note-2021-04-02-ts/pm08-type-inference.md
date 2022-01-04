## pm08-类型推论
[类型推论->](https://www.tslang.cn/docs/handbook/type-inference.html)  
[code->](https://github.com/thetime50/ts-practice/tree/main/pm08-type-inference/pm08-type-inference.ts)


类型推论发生在 初始化变量和成员，设置默认参数值和决定函数返回值时。

### 最佳通用类型
对于列表

ts会把列表里所有的数据类型作为候选类型，从所有候选类型中选出兼容所有候选类型的通用类型  
如果列表里没有能够作为通用类型的候选类型，那么需要显示的指定类型。

```ts
let zoo = [new Rhino(), new Elephant(), new Snake()]; // 没有找到最佳通用类型的话，类型推断的结果为联合数组类型，(Rhino | Elephant | Snake)
let zoo: Animal[] = [new Rhino(), new Elephant(), new Snake()]; // 生动指定类型

```

### 上下文类型
https://www.typescriptlang.org/docs/handbook/type-inference.html#contextual-typing

按上下文归类会发生在表达式的类型与所处的位置相关时

```ts
window.onmousedown = function (mouseEvent) {
  console.log(mouseEvent.button);
  console.log(mouseEvent.kangaroo);
  // Property 'kangaroo' does not exist on type 'MouseEvent'.
};

```
```ts
// Declares there is a global variable called 'window'
declare var window: Window & typeof globalThis;
// Which is declared as (simplified):
interface Window extends GlobalEventHandlers {
  // ...
}
// Which defines a lot of known handler events
interface GlobalEventHandlers {
  onmousedown: ((this: GlobalEventHandlers, ev: MouseEvent) => any) | null;
  // ...
}
```
不在上下文类型位置，则函数的参数将隐式具有 type any (除非使用noImplicitAny选项)

```ts
const handler = function (uiEvent) { // (uiEvent: any):viod
  console.log(uiEvent.button);
};
```

有明确的类型注释时上下文类型声明会被忽略
```ts
window.onmousedown = function(mouseEvent: any) {
    console.log(mouseEvent.button);  //<- Now, no error is given
};
```

包含函数的参数，赋值表达式的右边，类型断言，对象成员和数组字面量和返回值语句。 上下文类型也会做为最佳通用类型的候选类型。
```ts
// Animal会被上下文类型规则选为数组的通用类型
function createZoo(): Animal[] {
    return [new Rhino(), new Elephant(), new Snake()];
}
```
