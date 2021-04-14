## pm04-类
[类->](https://www.tslang.cn/docs/handbook/classes.html)  
[code->](https://github.com/thetime50/ts-practice/tree/main/pm04-class/pm04-class.js)

### 类
从ECMAScript 2015，也就是ECMAScript 6开始，JavaScript程序员将能够使用基于类的面向对象的方式。

### 继承
派生类通常被称作 子类，基类通常被称作 超类。
```ts
class Animal {
    name: string;
    constructor(theName: string) { this.name = theName; }
    move(distanceInMeters: number = 0) {
        console.log(`${this.name} moved ${distanceInMeters}m.`);
    }
}

class Snake extends Animal {
    constructor(name: string) { super(name); }
    move(distanceInMeters = 5) {
        console.log("Slithering...");
        super.move(distanceInMeters);
    }
}

class Horse extends Animal {
    constructor(name: string) { super(name); }
    move(distanceInMeters = 45) {
        console.log("Galloping...");
        super.move(distanceInMeters);
    }
}

let sam = new Snake("Sammy the Python");
let tom: Animal = new Horse("Tommy the Palomino"); // 前面的Animal只是类型声明 tom依然是Horse实例

sam.move();
tom.move(34);
```

派生类包含了一个构造函数，**在构造函数里访问 this的属性之前，我们 一定要调用 super()。** 这个是TypeScript强制执行的一条重要规则。

### 公共，私有与受保护的修饰符

#### 默认为 public
下面这种写法是等同的
```ts
class Animal {
    public name: string;
    public constructor(theName: string) { this.name = theName; }
    public move(distanceInMeters: number) {
        console.log(`${this.name} moved ${distanceInMeters}m.`);
    }
}
```

#### private
私有的，不可外部访问
private 和 protected 的成员的类型， **必须是来自同一处声明时**，我们才认为这两个类型是兼容的。
```ts
class Animal {
    private name: string;
    constructor(theName: string) { this.name = theName; }
}

class Rhino extends Animal {
    constructor() { super("Rhino"); }
}

class Employee {
    private name: string;
    constructor(theName: string) { this.name = theName; }
}

let animal = new Animal("Goat");
let rhino = new Rhino();
let employee = new Employee("Bob");

animal = rhino;
animal = employee; // 错误: Animal 与 Employee 不兼容.
```

#### protected
受保护成员 不能在派送类中访问

构造函数也可以被标记成 protected。 这意味着这个类不能在包含它的类外被实例化(必须声明子类来实例化？)，但是能被继承.

```ts
class Person {
    protected name: string;
    protected constructor(theName: string) { this.name = theName; }
}

// Employee 能够继承 Person
class Employee extends Person {
    private department: string;

    constructor(name: string, department: string) {
        super(name);
        this.department = department;
    }
}

let howard = new Employee("Howard", "Sales");
let john = new Person("John"); // 错误: 'Person' 的构造函数是被保护的.
```
#### readonly修饰符
使用 readonly关键字将属性设置为只读的。 只读属性必须在*声明时*或*构造函数里*被初始化。
```ts
class Octopus {
    readonly name: string;
    readonly numberOfLegs: number = 8;
    constructor (theName: string) {
        this.name = theName;
    }
}
let dad = new Octopus("Man with the 8 strong legs");
dad.name = "Man with the 3-piece suit"; // 错误! name 是只读的.
```
#### 参数属性
给构造函数参数前面添加一个访问限定符来声明,会声明并初始化一个实例成员
```ts
class Octopus {
    readonly numberOfLegs: number = 8;
    constructor(
        readonly name: string,
        public a:string,
        private b:number,
        protected c:boolean,
    ) {
        // 
    }
}

```

### 存取器
TypeScript支持通过getters/setters来截取对对象成员的访问。  
读写时加工数据和处理逻辑

- 存取器要求你将编译器设置为输出ECMAScript 5或更高。 不支持降级到ECMAScript 3。 
- 只带有 get不带有 set的存取器自动被推断为 readonly。 
- 这在从代码生成 .d.ts文件时是有帮助的，因为利用这个属性的用户会看到不允许够改变它的值。

```ts
let passcode = "secret passcode";

class Employee {
    private _fullName: string;

    get fullName(): string {
        return this._fullName;
    }

    set fullName(newName: string) {
        if (passcode && passcode == "secret passcode") {
            this._fullName = newName;
        }
        else {
            console.log("Error: Unauthorized update of employee!");
        }
    }
}

let employee = new Employee();
employee.fullName = "Bob Smith";
if (employee.fullName) {
    alert(employee.fullName);
}
```

### 静态属性

例成员，那些仅当类被实例化的时候才会被初始化的属性。 
我们也可以创建类的静态成员，这些属性存在于类本身上面而不是类的实例上。

使用 ClassName. 访问静态属性
```ts
class Grid {
    static origin = {x: 0, y: 0};
    calculateDistanceFromOrigin(point: {x: number; y: number;}) {
        let xDist = (point.x - Grid.origin.x);
        let yDist = (point.y - Grid.origin.y);
        return Math.sqrt(xDist * xDist + yDist * yDist) / this.scale;
    }
    constructor (public scale: number) { }
}

let grid1 = new Grid(1.0);  // 1x scale
let grid2 = new Grid(5.0);  // 5x scale

console.log(grid1.calculateDistanceFromOrigin({x: 10, y: 10}));
console.log(grid2.calculateDistanceFromOrigin({x: 10, y: 10}));
```

### 抽象类
- 抽象类做为其它派生类的基类使用。 它们一般不会直接被实例化。 
- 可以包含成员的实现细节。 **abstract**关键字是用于定义抽象类和在抽象类内部定义抽象方法。
- 抽象类中的抽象方法使用abstract关键字修饰，可以包含访问修饰符。抽象方法不包含具体实现并且必须在派生类中实现。(抽象方法只包含数据声明 没有具体实现)
```ts
abstract class Department {

    constructor(public name: string) {
    }

    printName(): void {
        console.log('Department name: ' + this.name);
    }

    abstract printMeeting(): void; // 必须在派生类中实现
}

class AccountingDepartment extends Department {

    constructor() {
        super('Accounting and Auditing'); // 在派生类的构造函数中必须调用 super()
    }

    printMeeting(): void {
        console.log('The Accounting Department meets each Monday at 10am.');
    }

    generateReports(): void {
        console.log('Generating accounting reports...');
    }
}

let department: Department; // 允许创建一个对抽象类型的引用
department = new Department(); // 错误: 不能创建一个抽象类的实例
department = new AccountingDepartment(); // 允许对一个抽象子类进行实例化和赋值
department.printName();
department.printMeeting();
department.generateReports(); // 错误: 方法在声明的抽象类中不存在 (变量的类型声明里不存在)
```

### 高级技巧

#### 构造函数
```ts
class Greeter {
    static standardGreeting = "Hello, there";
    greeting: string;
    greet() {
        if (this.greeting) {
            return "Hello, " + this.greeting;
        }
        else {
            return Greeter.standardGreeting;
        }
    }
}

let greeter1: Greeter; // Greeter 实例类型数据
greeter1 = new Greeter();
console.log(greeter1.greet());

let greeterMaker: typeof Greeter = Greeter; // Greeter 类类型数据（Greeter构造函数类型） 
greeterMaker.standardGreeting = "Hey there!";

let greeter2: Greeter = new greeterMaker();
console.log(greeter2.greet());
```
#### 把类当做接口使用
类定义会创建两个东西：类的实例类型和一个构造函数。 因为类可以创建出类型，所以你能够在允许使用接口的地方使用类。  
(同时定义了一个数据结构和类的实现)
```ts
class Point {
    x: number;
    y: number;
}

interface Point3d extends Point {
    z: number;
}

let point3d: Point3d = {x: 1, y: 2, z: 3};
```
