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

vue2中 &lt;button is="plastic-button">点击我!&lt;/button> 的is语句会生效，将button标签替换为plastic-button组件

vue3.0中is属性只会在&lt;component>标签上生效，在其他标签上表现为一般prop属性


### dom模板解析方案
直接在页面的 HTML 中写入 Vue 模板时，原生HTML解析规则会限制 &lt;ul>，&lt;ol>，&lt;table> 和 &lt;select>标签内部的元素，&lt;li>，&lt;tr>，和 &lt;option>标签指南出现在指定元素中

vue2中使用is语法在限制标签内让引用组件能够生效
```html
<table>
  <tr is="blog-post-row"></tr> <!-- htlm规则限制table内出现blog-post-row标签，通过is语法避免html规则限制来调用blog-post-row组件 -->
</table>
```

vue3中使用 is="vue:xxx"前缀忽略is属性的component标签限制
```html
<table>
  <tr is="vue:blog-post-row"></tr>
</table>
```

