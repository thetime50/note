# react-start
https://react.docschina.org/docs/react-component.html

## 核心概念

### 1 组合vs继承
[JavaScript 教程](https://developer.mozilla.org/en-US/docs/Web/JavaScript/A_re-introduction_to_JavaScript)  
[JSX 简介](https://react.docschina.org/docs/introducing-jsx.html)

### 2 JSX简介
jsx里面
- 通花括号{}引用表达式
- 建议最外层包裹括号\(\)以避免自动插入分号
- jsx 也是表达式(渲染函数)，可以赋值变量，作为参数
- 标签属性用引号"指定为字符串，用大括号{}指定为表达式
- 避免与js关键字冲突，class属性变为className,tabindex 变为tabIndex
- 使用\<xx />闭合标签
- 自动转义jsx里面的表达式字符串避免[xss](https://en.wikipedia.org/wiki/Cross-site_scripting)。[转义](https://stackoverflow.com/questions/7381974/which-characters-need-to-be-escaped-in-html)  
  \& becomes \&amp;  
  \< becomes \&lt;  
  \> becomes \&gt;  
  \" becomes \&quot;  
  \' becomes \&#39;  
- jsx 会转义为 React.createElement()

```js
const element = (
  <h1 className="greeting">
    Hello, world!
  </h1>
);
```
==>
```js
const element = React.createElement(
  'h1',
  {className: 'greeting'},
  'Hello, world!'
);
```
```js
const element = {
  type: 'h1',
  props: {
    className: 'greeting',
    children: 'Hello, world!'
  }
};
```

### 3 元素渲染
#### 根节点
ReactDOM渲染根节点
```html
<div id="root"></div>
```
```js
const element = <h1>Hello, world</h1>;
ReactDOM.render(element, document.getElementById('root'));
```

react支持多个根组件

#### 更新
React元素是(不可变对象)[https://en.wikipedia.org/wiki/Immutable_object]  
创建后不可更改，通过创建新的元素覆盖

React 会对新元素和旧元素进行比较，只更新必要的部分

### 4 组件 Props

[详细组件 API](https://react.docschina.org/docs/react-component.html)

函数组件：
```js
function Welcome(props) {
  return <h1>Hello, {props.name}</h1>;
}
```

类组件
```js
class Welcome extends React.Component {
  render() {
    return <h1>Hello, {this.props.name}</h1>;
  }
}
```

**组件名称必须以大写字母开头**避免和原生标签冲突
[深入jsx](https://react.docschina.org/docs/jsx-in-depth.html#user-defined-components-must-be-capitalized)

#### Props的只读性
**无论哪种组件都不能修改Props数据**

纯函数 - 不会修改入参的数据

### 5 State 生命周期
- state 是私有的，并且完全受控于当前组件。

函数组件改为class组件
- 继承 class xxx extends React.Component
- render() 方法
- 使用this.props替代props参数

每次组件更新render方法都会被调用，只要在相同的dom节点里渲染组件就仅会实例化一个组件class


- 使用constructor添加state  
- 使用this.state.xxx引用
- 使用 this.setState() 更新
```js
class Clock extends React.Component {
  constructor(props) {
    super(props);//注意要传递props
    this.state = {date: new Date()};
  }
  componentDidMount() { // 组件已经被渲染到 DOM 中后运行
  }

  componentWillUnmount() {
  }
  render() {
    return (
      <div>
        {this.state.date.toLocaleTimeString()}
      </div>
    );
  }
}
```

1. 实例化类组件并添加state
2. 调用render()方法渲染组件
3. 调用ComponentDidMount()勾子
4. setState()触发render()执行
5. 组件从dom中移除时调用ComponentWillUnmount()构子

#### State 的更新可能是异步的

react会把多个setState合并为一次执行

setState通过接受一个函数实现异步更新,传递setState更新执时数据状态：  
setState((state,props)=>{{xxx: state.a+props.b}})  
// todo demo里面的state 和props里面的例子是什么意思

如果有数据依赖其他数据的状态就需要使用异步更新
```js
onclick(){
    this.setState({a:this.state.a+1})
    // this.setState({b:this.state.a+1}) //这样是不对的
    this.setState((state,props)=>{{b:state.a+1}})
}
```

#### State 的更新会被合并
setState使用的是浅合并，仅对传入的属性做替换，其余的保留不变

#### 数据单向流动
state 又称局部/封装，父组件不能操作子组件内的state(直接读写)  
有state的组件-有状态组件

### 6 事件处理
- react事件命名使用小驼峰
- 传入函数处理事件
- 阻止默认行为要在回调函数里调用 e.preventDefault();

```js
// 函数调用时里面的this为undifine
<button onClick={this.fun}> 
  Activate Lasers
</button>

// 实验性的类箭头函数语法
// class Bork {
// fun = () => {
//   return this.instanceProperty;
// };
<button onClick={this.fun}>
  Activate Lasers
</button>

// 使用箭头函数处理
<button onClick={()=> this.fun()}>
  Activate Lasers
</button>
```

#### 向事件处理程序传递参数
- 一般在元素创建时设置监听，不调用addEventListener 

```js
// 使用箭头函数
<button onClick={(e) => this.deleteRow(id, e)}>Delete Row</button>
// 使用bind处理
// e会在隐式的作为第二个参数传入
<button onClick={this.deleteRow.bind(this, id)}>Delete Row</button>
```

### 7 条件渲染
- 判断语句
```js
ReactDOM.render(
  if (true) {
    return <div>TRUE</div>
  }
  return <div>FALSE</div>
);
```

- 元素变量
```js
  render() {
    const isLoggedIn = this.state.isLoggedIn;
    let button;
    if (isLoggedIn) {
      button = <LogoutButton onClick={this.handleLogoutClick} />;
    } else {
      button = <LoginButton onClick={this.handleLoginClick} />;
    }
  }
```

- 与运算符
- 三目运算符
- 阻止组件渲染/隐藏组件
```js
  render() {
      if(hidden){
          return null
      }
      return (
        <div>
            <div>
                {login && <div>{userName}</div>}
            </div>
            <div>
                <b>{isLoggedIn ? 'currently' : 'not'}</b>
            </div>
            <div></div>
            <div></div>
        </div>
      )
  }
```

### 8 列表 key
```js
const numbers = [1, 2, 3, 4, 5];
const listItems = numbers.map((number) =>
  <li  key={number.toString()}>{number}</li>
);

ReactDOM.render(
  <ul>{listItems}</ul>,
  document.getElementById('root')
);
```
- 不建议使用index作为key,key用来识别数据和dom的对应关系，减少不必要的dom更新
- 就近在使用map的地方使用key 而不是一定要挂载在dom上，(map构造的第一层数据)
- key在兄弟节点间必须唯一
- 可以在jsx中嵌入map (map的调用也是表达式)

### 9 表单

\<input type="submit" value="提交" /> 会触发form提交

#### 受控组件

用户输入通过setState更新state - 受控组件

```js
class NameForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {value: ''};
  }

  handleChange(event) {
    this.setState({value: event.target.value});
  }

  handleSubmit(event) {
    alert('提交的名字: ' + this.state.value);
    event.preventDefault();
  }

  render() {
    return (
      <form onSubmit={(e) => this.handleSubmit(e)}>
        <label>
          名字:
          <input type="text" value={this.state.value} onChange={() => this.handleChange(e)} />
        </label>
        <input type="submit" value="提交" />
      </form>
    );
  }
}
```

- textarea 标签
- select 标签
- select 可多选 \<select multiple={true} value=\{\[\'B', 'C']}\>
- 文件 input \<input type="file">

- 使用元素属性标记对应字段信息，在同一个回调函数中处理，通过e.target.xx获取标记


- 受控组件设定value为常量则用户无法更改
- 设置value为undifined或null 用户可编辑

[非受控组件？？](https://react.docschina.org/docs/uncontrolled-components.html)

使用[Formik](https://formik.org/)  //todo

### 10 状态提升

通过props向子组件传递方法，子组件调用方法触发父组件函数更新父组件状态

```js
class MyInput extends React.Component {
  constructor(props) {
    super(props);
  }

  handleChange(e) {
    this.props.handleChange(e.target.value);
  }

  render() {
    const val = this.props.val;
    return (
      <fieldset>
        <input value={val}
               onChange={(e) => this.handleChange(e))} />
      </fieldset>
    );
  }
}


class Calculator extends React.Component {
  constructor(props) {
    super(props);
    this.state = {val:1};
  }

  handleChange(e) {
    this.setState({val:e.val});
  }

  render() {
    const val = this.state.val;
    return (
      <div>
        <myInput
            val={val}
          handleChange={(e) => this.handleChange(e)} />
        <myInput
            val={val}
          handleChange={(e) => this.handleChange(e)} />
        <div>{val}</div>
      </div>
    );
  }
}
```

### 11 组合 继承

推荐使用组合而非继承来实现组件间的代码重用。

- 包含关系 默认slot  ==> props.children

```js
function FancyBorder(props) {
  return (
    <div className={'FancyBorder FancyBorder-' + props.color}>
      {props.children}
    </div>
  );
}
function WelcomeDialog() {
  return (
    <FancyBorder color="blue">
      <h1 className="Dialog-title">
        Welcome
      </h1>
      <p className="Dialog-message">
        Thank you for visiting our spacecraft!
      </p>
    </FancyBorder>
  );
}
```

- 直接通过属性传递
```js
function SplitPane(props) {
  return (
    <div className="SplitPane">
      <div className="SplitPane-left">
        {props.left}
      </div>
      <div className="SplitPane-right">
        {props.right}
      </div>
    </div>
  );
}

function App() {
  return (
    <SplitPane
      left={
        <Contacts />
      }
      right={
        <Chat />
      } />
  );
}
```

- 特例关系
  通用组件和特例，通过设置props进行封装配置


### 12 React 哲学
有ui设计 api数据
1. 将设计好的 UI 划分为组件层级  
  根据[单一功能原则](https://en.wikipedia.org/wiki/Single-responsibility_principle)划分组件  
  如果模型设计得恰当，UI（或者说组件结构）便会与数据模型一一对应
2. 用 React 创建一个静态版本  
  构建应用静态版本时，通过 props 传入所需的数据。state 代表了随时间会产生变化的数据
3. 确定 UI state 的最小（且完整）表示  
  [DRY: Don’t Repeat Yourself](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself)。只保留应用所需的可变 state 的最小集合，其他数据均由它们计算产生
4. 确定 state 放置的位置  
  需要根据这个 state 进行渲染的所有组件，该共同所有者组件或者比它层级更高的组件应该拥有该 state
5. 添加反向数据流



## API REFERENCE
### React.Component
#### 类组件
- 需要继承React.Component
- 必须的render() 方法
- 建议你不要创建自己的组件基类

代码重用的主要方式是组合而不是[继承](#组合vs继承)
- 区分不同模块去调用降低耦合逻辑清晰

