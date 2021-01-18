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
#### 使用多个 Context
### 注意事项
### 废弃的 API