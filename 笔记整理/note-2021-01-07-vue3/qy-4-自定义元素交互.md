## 自定义元素交互
https://v3.cn.vuejs.org/guide/migration/custom-elements-interop.html#自主定制元素

[Web Components](https://developer.mozilla.org/zh-CN/docs/Web/Web_Components)  
[Web Components note](./qy-4-note.md)

### 自主定制元素
如果我们想在 Vue 外部定义添加自定义元素 \(例如使用 [Web 组件 API][Web_Components]\)，我们需要“指示”Vue 将其视为自定义元素。  

[Web_Components]:https://developer.mozilla.org/zh-CN/docs/Web/Web_Components  

Vue 2.x 中，通过 Vue.config.ignoredElements 配置自定义元素：
```js
// 这将使Vue忽略在Vue外部定义的自定义元素
// (例如：使用 Web Components API)

Vue.config.ignoredElements = ['plastic-button']
```

**3.x 语法**此检查在模板编译期间执行指示编译器将 <plastic-button> 视为自定义元素：

- 如果使用生成步骤(webpack打包编译)：将 isCustomElement 传递给 Vue 模板编译器，如果使用 vue-loader，则应通过 vue-loader 的 compilerOptions 选项传递：
```js
// webpack 中的配置
rules: [
  {
    test: /\.vue$/,
    use: 'vue-loader',
    options: {
      compilerOptions: {
        isCustomElement: tag => tag === 'plastic-button'
      }
    }
  }
  // ...
]
```
- 如果使用动态模板编译，请通过 app.config.isCustomElement 传递：
```js
const app = Vue.createApp({})
app.config.isCustomElement = tag => tag === 'plastic-button'
```

### 定制内置元素


