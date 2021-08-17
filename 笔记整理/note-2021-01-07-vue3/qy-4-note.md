## Web Components

[Web Components](https://developer.mozilla.org/zh-CN/docs/Web/Web_Components)  
[未来的组件化标准 —— 浅尝Web Components](https://juejin.cn/post/6844903685475008526)

### index

- Custom elements
    - [mdn/web-components-examples](https://github.com/mdn/web-components-examples/blob/master/life-cycle-callbacks/main.js)
        - customElements.define('popup-info', class) // 注册组件标签
        - el.attachShadow({ mode: 'open' }) 创建 shadowDom
    - [使用 Webpack 🔧 构建 Shadow DOM 组件](https://juejin.cn/post/6983974056991129631)
    - [影子节点ShadowDOM](https://juejin.cn/post/6844903506801852429)
        - el.createShadowRoot 接口已经弃用了
- Shadow DOM
- HTML templates




- **Custom elements（自定义元素）**
- **Shadow DOM（影子DOM）**
- **HTML templates（HTML模板）**

---

- [custom-element](http://thetime50.com/front-laboratory/html/custom-element.html)
- [shadow-dom](http://thetime50.com/front-laboratory/html/shadow-dom.html)
- [web-components](http://thetime50.com/front-laboratory/html/web-components.html)


### Shadow DOM
- Shadow host：一个常规 DOM节点，Shadow DOM 会被附加到这个节点上。
- Shadow tree：Shadow DOM内部的DOM树。
- Shadow boundary：Shadow DOM结束的地方，也是常规 DOM开始的地方。
- Shadow root: Shadow tree的根节点。

```js
let shadow = elementRef.attachShadow({mode: 'open'}); // 可以通过外界js获取DOM
let shadow = elementRef.attachShadow({mode: 'closed'}); // 不能通过外界js获取DOM
```

