# react-高级指引
https://react.docschina.org/docs/accessibility.html

## 1 无障碍

[a11y](https://en.wiktionary.org/wiki/a11y)

### 标准和指南
#### WCAG
[网络内容无障碍指南（Web Content Accessibility Guidelines，WCAG](https://www.w3.org/WAI/standards-guidelines/wcag/)  

无障碍页面开发check list:
- [Wuhcag 提供的 WCAG 检查表（WCAG checklist from Wuhcag）](https://www.wuhcag.com/wcag-checklist/)
- [WebAIM 提供的 WCAG 检查表（WCAG checklist from WebAIM）](https://webaim.org/standards/wcag/checklist)
- [A11Y Project 提供的检查表（Checklist from The A11Y Project）](https://www.a11yproject.com/checklist/)

#### WAI-ARIA
[网络无障碍倡议 - 无障碍互联网应用（Web Accessibility Initiative - Accessible Rich Internet Applications）](https://www.w3.org/WAI/standards-guidelines/aria/),无障碍js技术支持

*JSX 支持所有 aria-* HTML 属性，在react中 aria-\*依然使用连字符命名而不是react习惯的小驼峰*

### 语义化的 HTML
语义化的 HTML 是无障碍辅助功能网络应用的基础。 这样通常可以使您直接获得无障碍辅助功能。

[MDN 的 HTML 元素参照（MDN HTML elements reference）](https://developer.mozilla.org/en-US/docs/Web/HTML/Element)


在 JSX 中使用 <div> 元素,或是在使用列表（<ol>， <ul> 和 <dl>）和 HTML <table> 时语义化的 HTML 会被破坏。这时应该使用 React Fragments 来组合各个组件。


[Fragments 文档](https://react.docschina.org/docs/fragments.html)(作为组件里用来包裹多个子元素的根节点)

### 无障碍表单
#### 标记
- [W3C 向我们展示如何标注元素](https://www.w3.org/WAI/tutorials/forms/labels/)
- [WebAIM 向我们展示如何标注元素](https://webaim.org/techniques/forms/controls)
- [Paciello Group 解释什么是无障碍名称](https://developer.paciellogroup.com/blog/2017/04/what-is-an-accessible-name/)

*for 在 JSX 中应该被写作 htmlFor：*
```js
<label htmlFor="namedInput">Name:</label>
<input id="namedInput" type="text" name="name"/>
```
### 在出错时提醒用户
给屏幕朗读器设置错误信息：

- [W3C 展示用户推送](https://www.w3.org/WAI/tutorials/forms/notifications/)
- [WebAIM 关于表单校验的文章](https://webaim.org/techniques/formvalidation/)

### 控制焦点
确保你的网络应用在即使只拥有键盘的环境下正常运作。

- [WebAIM 讨论使用键盘进行无障碍访问](https://webaim.org/techniques/keyboard/)

### 键盘焦点及焦点轮廓

请不要使用 CSS 移除这个轮廓，比如设置 outline: 0，除非你将使用其他的方法实现焦点轮廓。

### 跳过内容机制
转链接（Skiplinks），或者说跳转导航链接（Skip Navigation Links）是一种隐藏的导航链接，它只会在使用键盘导航时可见。

- [WebAIM - 跳转导航链接（Skip Navigation Links）](https://webaim.org/techniques/skipnav/)

使用地标元素和角色，比如 <main> 和 <aside>，作为辅助来划分网页的区域可以让用户快速导航至这些部分。

- [无障碍地标](https://www.scottohara.me/blog/2018/03/03/landmarks.html)

### 使用程序管理焦点
我们的 React 应用在运行时会持续更改 HTML DOM，有时这将会导致键盘焦点的丢失或者是被设置到了意料之外的元素上。需要通过js设置到准确的地方。

如何搭建[可用键盘导航的 JavaScript 部件](https://developer.mozilla.org/en-US/docs/Web/Accessibility/Keyboard-navigable_JavaScript_widgets)

可以用 DOM 元素的 Refs 在 React 中设置焦点。

// todo

## 2 代码分割
### 打包
import () 语法

使用之前：
```js
import { add } from './math';

console.log(add(16, 26));
```
使用之后：
```js
import("./math").then(math => {
  console.log(math.add(16, 26));
});
```

Create React App 和 next.js 项目支持此特性

[demo](https://create-react-app.dev/docs/code-splitting/)  
在click 事件中调用import().then().catch()方法加载组件，应该还要挂载到state上触发render  

[webpack 代码分割说明](https://webpack.docschina.org/guides/code-splitting/)  
[webpack 代码分割配置](https://gist.github.com/gaearon/ca6e803f5c604d37468b0091d9959269)

Babel 插件 [babel-plugin-syntax-dynamic-import](https://yarnpkg.com/en/package/babel-plugin-syntax-dynamic-import)


### React.lazy
*React.lazy 和 Suspense 技术还不支持服务端渲染。  
如果要在使用服务端渲染的应用中使用，推荐 [Loadable Components](https://github.com/gregberge/loadable-components) 
。  
它有一个很棒的[服务端渲染打包指南](https://loadable-components.com/docs/server-side-rendering/)。*

使用React.lazy
```js
const OtherComponent = React.lazy(() => import('./OtherComponent'));
```

***渐进增强（Progressive Enhancement）**：一开始就针对低版本浏览器进行构建页面，完成基本的功能，然后再针对高级浏览器进行效果、交互、追加功能达到更好的体验。*

***优雅降级（Graceful Degradation）**：一开始就构建站点的完整功能，然后针对浏览器测试和修复。比如一开始使用 CSS3 的特性构建了一个应用，然后逐步针对各大浏览器进行 hack 使其可以在低版本浏览器上正常浏览。*


Suspense 组件在等待加载 lazy 组件时做优雅降 //显示lodig  
fallback 属性用于加载过程中显示的元素  
异步组件可以放在 Suspense 内的任何位置  可以放多个

```js
import React, { Suspense } from 'react';

const OtherComponent = React.lazy(() => import('./OtherComponent'));
const AnotherComponent = React.lazy(() => import('./AnotherComponent'));

function MyComponent() {
  return (
    <div>
      <Suspense fallback={<div>Loading...</div>}>
        <section>
          <OtherComponent />
          <AnotherComponent />
        </section>
      </Suspense>
    </div>
  );
}
```

### 异常捕获边界（Error boundaries）

[错误边界](#错误边界)
```js
import React, { Suspense } from 'react';
import MyErrorBoundary from './MyErrorBoundary';

const OtherComponent = React.lazy(() => import('./OtherComponent'));

const MyComponent = () => (
  <div>
    <MyErrorBoundary>
      <Suspense fallback={<div>Loading...</div>}>
        <OtherComponent />
      </Suspense>
    </MyErrorBoundary>
  </div>
);
```

### 基于路由的代码分割

[React Router](https://react-router.docschina.org/)
```js
import React, { Suspense, lazy } from 'react';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';

const Home = lazy(() => import('./routes/Home'));
const About = lazy(() => import('./routes/About'));

const App = () => (
  <Router>
    <Suspense fallback={<div>Loading...</div>}>
      <Switch>
        <Route exact path="/" component={Home}/>
        <Route path="/about" component={About}/>
      </Switch>
    </Suspense>
  </Router>
);
```

### 命名导出（Named Exports）
React.lazy 目前只支持默认导出（default exports）。如果你想被引入的模块使用命名导出（named exports），你可以创建一个中间模块，来重新导出为默认模块。这能保证 tree shaking 不会出错，并且不必引入不需要的组件。

```js
// MyComponent.js
export { MyComponent as default } from "./ManyComponents.js";//需要先转换为export default的模块
// MyApp.js
import React, { lazy } from 'react';
const MyComponent = lazy(() => import("./MyComponent.js"));
```

## 3 context
组件跨层自动传递props
共享那些对于一个组件树而言是“全局”的数据

- [何时使用 Context](#何时使用_Context)
- [使用 Context 之前的考虑](#使用_Context_之前的考虑)
- [API](#API)
    - [React.createContext](#React_createContext)
    - [Context.Provider](#Context_Provider)
    - [Class.contextType](#Class_contextType)
    - [Context.Consumer](#Context_Consumer)
    - [Context.displayName](#Context_displayName)
- [示例](#示例)
    - [动态 Context](#动态_Context)
    - [在嵌套组件中更新 Context](#在嵌套组件中更新_Context)
    - [使用多个 Context](#使用多个_Context)
- [注意事项](#注意事项)
- [废弃的 API](#废弃的_API)


```js
// 创建一个ThemeContext
const ThemeContext = React.createContext('light');
class App extends React.Component {
  render() {
    // 需要像组件那样使用Contex.Provider
    return (
      <ThemeContext.Provider value="dark">
        <Toolbar />
      </ThemeContext.Provider>
    );
  }
}

// 中间的组件再也不必指明往下传递 theme 了。
function Toolbar() {
  return (
    <div>
      <ThemedButton />
    </div>
  );
}

class ThemedButton extends React.Component {
  // 指定 contextType 读取当前的 theme context。
  // React 会往上找到最近的 theme Provider，然后使用它的值。
  static contextType = ThemeContext;
  render() {
    return <Button theme={this.context} />;
  }
}
```

组件组合（component composition）有时候是一个比 context 更好的解决方案。

```js
function Page(props) {
  const user = props.user;
  const userLink = (
    <Link href={user.permalink}>
      <Avatar user={user} size={props.avatarSize} />
    </Link>
  );
  return <PageLayout userLink={userLink} />;
}

// 现在，我们有这样的组件：
<Page user={user} avatarSize={avatarSize} />
// ... 渲染出 ...
<PageLayout userLink={...} />
// ... 渲染出 ...
<NavigationBar userLink={...} />
// ... 渲染出 ...
{props.userLink}
```
Context 能让你将这些数据向组件树下所有的组件进行“广播”，所有的组件都能访问到这些数据，也能访问到后续的数据更新。

### API

#### React.createContext
```js
const MyContext = React.createContext(defaultValue);
```
只有当组件所处的树中没有匹配到 Provider 时，其 defaultValue 参数才会生效。这有助于在不使用 Provider 包装组件的情况下对组件进行测试。注意：将 undefined 传递给 Provider 的 value 时，消费组件的 defaultValue 不会生效。


#### Context.Provider
```js
<MyContext.Provider value={/* 某个值 */}>
```
它允许消费组件订阅 context 的变化。
- Provider 接收一个 value 属性，传递给消费组件。
- 一个 Provider 可以和多个消费组件有对应关系。多个 Provider 也可以嵌套使用，里层的会覆盖外层的数据

//todo  
当 Provider 的 value 值发生变化时，它内部的所有消费组件都会重新渲染。Provider 及其内部 consumer 组件都不受制于 shouldComponentUpdate 函数，因此当 consumer 组件在其祖先组件退出更新的情况下也能更新。

通过新旧值检测来确定变化，使用了与 [Object.is](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/is#description) 相同的算法。

注意

当传递对象给 value 时，检测变化的方式会导致一些问题：详见注意事项。

#### Class.contextType
挂载在 class 上的 contextType 属性会被重赋值为一个由 React.createContext() 创建的 Context 对象。这能让你使用 this.context 来消费最近 Context 上的那个值。你可以在任何生命周期中访问到它，
```js
class MyClass extends React.Component {
  componentDidMount() {
    let value = this.context;
    /* 在组件挂载完成后，使用 MyContext 组件的值来执行一些有副作用的操作 */
  }
  componentDidUpdate() {
    let value = this.context;
    /* ... */
  }
  componentWillUnmount() {
    let value = this.context;
    /* ... */
  }
  render() {
    let value = this.context;
    /* 基于 MyContext 组件的值进行渲染 */
  }
}
MyClass.contextType = MyContext;
```
[使用多个 Context](#使用多个_Context)

如果你正在使用实验性的 [public class fields](https://babeljs.io/docs/en/babel-plugin-proposal-class-properties) 语法，你可以使用 static 这个类属性来初始化你的 contextType。
```js
class MyClass extends React.Component {
  static contextType = MyContext;
  render() {
    let value = this.context;
    /* 基于这个值进行渲染工作 */
  }
}
```

#### Context.Consumer
函数组件通过 Contex.Consumer 消费contex的值

```js
<MyContext.Consumer>
  {value => /* 基于 context 值进行渲染*/}
</MyContext.Consumer>
```
[函数作为子元素（function as a child）](https://react.docschina.org/docs/render-props.html#using-props-other-than-render)

#### Context.displayName
context 对象接受一个名为 displayName 的 property 用于在React DevTool里显示
```js
const MyContext = React.createContext(/* some value */);
MyContext.displayName = 'MyDisplayName';

<MyContext.Provider> // "MyDisplayName.Provider" 在 DevTools 中
<MyContext.Consumer> // "MyDisplayName.Consumer" 在 DevTools 中
```
### 示例

#### 动态 Context
```js
// theme-context.js
export const themes = {
  light: {
    foreground: '#000000',
    background: '#eeeeee',
  },
  dark: {
    foreground: '#ffffff',
    background: '#222222',
  },
};

export const ThemeContext = React.createContext(
  themes.dark // 默认值
);

/////////////////////////////////////////
// themed-button.js
import {ThemeContext} from './theme-context';

class ThemedButton extends React.Component {
  render() {
    let props = this.props;
    let theme = this.context;
    return (
      <button
        {...props}
        style={{backgroundColor: theme.background}}
      />
    );
  }
}
ThemedButton.contextType = ThemeContext;

export default ThemedButton;
```
```js
// app.js

import {ThemeContext, themes} from './theme-context';
import ThemedButton from './themed-button';

// 一个使用 ThemedButton 的中间组件
function Toolbar(props) {
  return (
    <ThemedButton onClick={props.changeTheme}>
      Change Theme
    </ThemedButton>
  );
}

class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      theme: themes.light,
    };

    this.toggleTheme = () => { // 使用类方法和实例方法有什么区别
      this.setState(state => ({
        theme:
          state.theme === themes.dark
            ? themes.light
            : themes.dark,
      }));
    };
  }

  render() {
    // 在 ThemeProvider 内部的 ThemedButton 按钮组件使用 state 中的 theme 值，
    // 而外部的组件使用默认的 theme 值
    return (
      <Page>
        <ThemeContext.Provider value={this.state.theme}> {/*传递contex的起点 contex从state获取 (通过state触发)*/}
          <Toolbar changeTheme={this.toggleTheme} />
        </ThemeContext.Provider>
        <Section>
          <ThemedButton /> {/*这边应该是显示default*/}
        </Section>
      </Page>
    );
  }
}

ReactDOM.render(<App />, document.root);
```
#### 在嵌套组件中更新 Context
通过给context传递一个更新方法
```js
//////////////////////////////
// theme-context.js

// 确保传递给 createContext 的默认值数据结构是调用的组件（consumers）所能匹配的！
export const ThemeContext = React.createContext({
  theme: themes.dark,
  toggleTheme: () => {},
});

///////////////////////////
// theme-toggler-button.js

import {ThemeContext} from './theme-context';

function ThemeTogglerButton() {
  // Theme Toggler 按钮不仅仅只获取 theme 值，它也从 context 中获取到一个 toggleTheme 函数
  return (
    <ThemeContext.Consumer>
      {({theme, toggleTheme}) => (
        <button          onClick={toggleTheme}
          style={{backgroundColor: theme.background}}>

          Toggle Theme
        </button>
      )}
    </ThemeContext.Consumer>
  );
}

export default ThemeTogglerButton;
```

```js
// app.js

import {ThemeContext, themes} from './theme-context';
import ThemeTogglerButton from './theme-toggler-button';

class App extends React.Component {
  constructor(props) {
    super(props);

    this.toggleTheme = () => {
      this.setState(state => ({
        theme:
          state.theme === themes.dark
            ? themes.light
            : themes.dark,
      }));
    };

    // State 也包含了更新函数，因此它会被传递进 context provider。
    this.state = {
      theme: themes.light,
      toggleTheme: this.toggleTheme,
    };
  }

  render() {
    // 整个 state 都被传递进 provider
    return (
      <ThemeContext.Provider value={this.state}>
        <Content />
      </ThemeContext.Provider>
    );
  }
}

function Content() {
  return (
    <div>
      <ThemeTogglerButton />
    </div>
  );
}

ReactDOM.render(<App />, document.root);
```

#### 使用多个 Context
为了确保 context 快速进行重渲染，React 需要使每一个 consumers 组件的 context 在组件树中成为一个单独的节点。  
嵌套包裹Context.Provider  
函数组件引用时也是嵌套ThemeContext.Consumer
```js
// Theme context，默认的 theme 是 “light” 值
const ThemeContext = React.createContext('light');

// 用户登录 context
const UserContext = React.createContext({
  name: 'Guest',
});

class App extends React.Component {
  render() {
    const {signedInUser, theme} = this.props;

    // 提供初始 context 值的 App 组件
    return (
      <ThemeContext.Provider value={theme}>
        <UserContext.Provider value={signedInUser}>
          <Layout />
        </UserContext.Provider>
      </ThemeContext.Provider>
    );
  }
}

function Layout() {
  return (
    <div>
      <Sidebar />
      <Content />
    </div>
  );
}

// 一个组件可能会消费多个 context
function Content() {
  return (
    <ThemeContext.Consumer>
      {theme => (
        <UserContext.Consumer>
          {user => (
            <ProfilePage user={user} theme={theme} />
          )}
        </UserContext.Consumer>
      )}
    </ThemeContext.Consumer>
  );
}
```
如果两个或者更多的 context 值经常被一起使用，那你可能要考虑一下另外创建你自己的渲染组件，以提供这些值。

### 注意事项
因为 context 会使用参考标识（reference identity）来决定何时进行渲染，这里可能会有一些陷阱，当 provider 的父组件进行重渲染时，可能会在 consumers 组件中触发意外的渲染。举个例子，当每一次 Provider 重渲染时，以下的代码会重渲染所有下面的 consumers 组件，因为 value 属性总是被赋值为新的对象：
```js
class App extends React.Component {
  render() {
    return (
      <MyContext.Provider value={{something: 'something'}}>
        <Toolbar />
      </MyContext.Provider>
    );
  }
}
```
为了防止这种情况，将 value 状态提升到父节点的 state 里：
```js
class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      value: {something: 'something'},
    };
  }

  render() {
    return (
      <Provider value={this.state.value}>
        <Toolbar />
      </Provider>
    );
  }
}
```

### 废弃的 API
https://react.docschina.org/docs/context.html#legacy-api


## 4 错误边界
### 错误边界（Error Boundaries）
React 16 引入了一个新的概念 —— 错误边界。  
可以捕获并打印发生在其子组件树任何位置的 JavaScript 错误，并且，它会渲染出备用 UI
事件边界无法处理以下错误
- 事件处理（[了解更多](#关于事件处理器)）
- 异步代码（例如 setTimeout 或 requestAnimationFrame 回调函数）
- 服务端渲染
- 它自身抛出来的错误（并非它的子组件）

如果一个 class 组件中定义了 
[static getDerivedStateFromError()](https://react.docschina.org/docs/react-component.html#static-getderivedstatefromerror) 或 
[componentDidCatch()](https://react.docschina.org/docs/react-component.html#componentdidcatch)
 这两个生命周期方法中的任意一个（或两个）时，那么它就变成一个错误边界。  
当抛出错误后，使用 static getDerivedStateFromError() 渲染备用 UI ，使用 componentDidCatch() 打印错误信息。

不同的地方在于错误边界只针对 React 组件。只有 class 组件才可以成为错误边界组件。

### 在线演示

[例子](https://codepen.io/gaearon/pen/wqvxGa?editors=0010)

### 未捕获错误（Uncaught Errors）的新行为

**自 React 16 起，任何未被错误边界捕获的错误将会导致整个 React 组件树被卸载。**

我们也鼓励使用 JS 错误报告服务（或自行构建），这样你能了解关于生产环境中出现的未捕获异常，并将其修复。

[通过onerror事件收集错误报告](https://blog.csdn.net/baitui1989/article/details/102452221)全局window.onerror,资源onerror事件

### 组件栈追踪
在开发环境下，React 16 会把渲染期间发生的所有错误打印到控制台，即使该应用意外的将这些错误掩盖。
 Create React App 项目中默认可以查看文件名和行号

如果没有使用 Create React App，可以手动将[该插件](https://www.npmjs.com/package/babel-plugin-transform-react-jsx-source)添加到你的 Babel 配置中。注意它**仅用于开发环境**，在生产环境必须将其禁用 

*栈追踪中的显示依赖于 Function.name 属性[->](https://react.docschina.org/docs/error-boundaries.html#component-stack-traces)*

### 关于 try/catch

try / catch 仅能用于命令式代码（imperative code）
然而，React 组件是声明式的并且具体指出 什么 需要被渲染,在任何子组件内不管在生命周期的任何位置都能够被捕获到

### 关于事件处理器
事件处理器不会在渲染期间触发，错误边界无法捕获事件处理器内部的错误。  
如果需要在事件处理器内部捕获错误，使用普通的 JavaScript try / catch 语句：

### 自 React 15 的命名更改
React 15的 unstable_handleError 不再起作用  
在React 16 beta 起 修改为 componentDidCatch


## 5 Refs 转发
将 [ref](#Refs_&_DOM) 自动地通过组件传递到其一子组件的技巧
### 转发 refs 到 DOM 组件
```js
const FancyButton = React.forwardRef((props, ref) => (
  <button ref={ref} className="FancyButton">
    {props.children}
  </button>
));

// 你可以直接获取 DOM button 的 ref：
const ref = React.createRef();
<FancyButton ref={ref}>Click me!</FancyButton>;
```
1. 我们通过调用 React.createRef 创建了一个 React ref 并将其赋值给 ref 变量。
2. 我们通过指定 ref 为 JSX 属性，将其向下传递给 &lt;FancyButton ref={ref}>。
3. React 传递 ref 给 forwardRef 内函数 (props, ref) => ...，作为其第二个参数。
4. 我们向下转发该 ref 参数到 &lt;button ref={ref}>，将其指定为 JSX 属性。
5. 当 ref 挂载完成，ref.current 将指向 &lt;button> DOM 节点。

---
1. 通过React.forwardRef((props, ref) => ())声明ref组件 通过ref参数挂载dom
2. 父组件使用前声明 const ref = React.createRef();用来接收
3. 父组件通过ref.current引用dom

### 组件库维护者的注意事项
当你开始在组件库中使用 forwardRef 时，你应当将其视为一个破坏性更改，并发布库的一个新的主版本。

当 React.forwardRef 存在时有条件地使用它也是不推荐的：它改变了你的库的行为，并在升级 React 自身时破坏用户的应用。// todo 怎么理解


### 高阶组件中转发 refs

[高阶组件(HOC)](#高阶组件)  
一个输出组件 props 到控制台的 HOC 示例开始：
```js
function logProps(WrappedComponent) {
  class LogProps extends React.Component {
    componentDidUpdate(prevProps) {
      console.log('old props:', prevProps);
      console.log('new props:', this.props);
    }

    render() {
      return <WrappedComponent {...this.props} />;
    }
  }

  return LogProps;
}
```
“logProps” HOC 透传（pass through）所有 props 到其包裹的组件，所以渲染结果将是相同的。例如：
```js
class FancyButton extends React.Component {
  focus() {
    // ...
  }

  // ...
}

// 我们导出 LogProps，而不是 FancyButton。
// 虽然它也会渲染一个 FancyButton。
export default logProps(FancyButton);
```
但是refs 将不会透传下去，ref和key一样被 React 进行了特殊处理了。该 ref 将引用最外层的容器组件，而不是被包裹的组件。

所以需要在高阶组件内 用 React.forwardRef构造ref函数组件 显示的传递ref
```js
function logProps(Component) {
  class LogProps extends React.Component {
    componentDidUpdate(prevProps) {
      console.log('old props:', prevProps);
      console.log('new props:', this.props);
    }

    render() {
      const {forwardedRef, ...rest} = this.props;

      // 将自定义的 prop 属性 “forwardedRef” 定义为 ref
      return <Component ref={forwardedRef} {...rest} />;
    }
  }

  // 注意 React.forwardRef 回调的第二个参数 “ref”。
  // 我们可以将其作为常规 prop 属性传递给 LogProps，例如 “forwardedRef”
  // 然后它就可以被挂载到被 LogProps 包裹的子组件上。
  return React.forwardRef((props, ref) => {
    return <LogProps {...props} forwardedRef={ref} />;
  });
}
```

### 在 DevTools 中显示自定义名称
React.forwardRef来构造 ref 转发组件，接收一个渲染函数作为参数  
如果参数为命名函数，那么DevTool里会将函数名作为标识的名称  
或者显示的定义displayName属性

```js
const WrappedComponent = React.forwardRef(
  function myFunction(props, ref) {
    return <LogProps {...props} forwardedRef={ref} />;
  }
);

function logProps(Component) {
  class LogProps extends React.Component {
    // ...
  }

  function forwardRef(props, ref) {
    return <LogProps {...props} forwardedRef={ref} />;
  }

  // 在 DevTools 中为该组件提供一个更有用的显示名。
  // 例如 “ForwardRef(logProps(MyComponent))”
  const name = Component.displayName || Component.name;
  forwardRef.displayName = `logProps(${name})`;

  return React.forwardRef(forwardRef);
}
```

## 6 Fragments

Fragments 允许你将子列表分组，而无需向 DOM 添加额外节点。

```js
render() {
  return (
    <React.Fragment>
      <ChildA />
      <ChildB />
      <ChildC />
    </React.Fragment>
  );
}
```

### 动机
例如 table 的 Columns

### 短语法
```js
class Columns extends React.Component {
  render() {
    return (
      <>
        <td>Hello</td>
        <td>World</td>
      </>
    );
  }
}
```

### 带 key 的 Fragments

使用显式 <React.Fragment> 语法声明的片段可能具有 key

```js
function Glossary(props) {
  return (
    <dl>
      {props.items.map(item => (
        // 没有`key`，React 会发出一个关键警告
        <React.Fragment key={item.id}>
          <dt>{item.term}</dt>
          <dd>{item.description}</dd>
        </React.Fragment>
      ))}
    </dl>
  );
}
```

### 在线 Demo

[codepen](https://codepen.io/reactjs/pen/VrEbjE?editors=1000)


### 高阶组件 HOC

基于 React 的组合特性而形成的设计模式。

**高阶组件是<u>参数</u>为组件，返回值为新<u>组件</u>的函数。**

在 React 的第三方库中很常见，
例如 Redux 的 [connect](https://github.com/reduxjs/react-redux/blob/master/docs/api/connect.md#connect) 和 Relay 的 [createFragmentContainer](http://facebook.github.io/relay/docs/en/fragment-container.html)。

[为什么抛弃 mixins](https://react.docschina.org/blog/2016/07/13/mixins-considered-harmful.html)
1. Mixins引入隐式依赖
2. Mixins导致名称冲突
3. Mixins导致滚雪球的复杂性 在相同作用域下，业务逻辑不互相独立 
- 等等