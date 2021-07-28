## v-for 中的 Ref 数组

https://v3.cn.vuejs.org/guide/migration/array-refs.html

```html
<div v-for="item in list" :ref="setItemRef"></div>
```

vue2 中在v-for里面绑定ref会创建节点数组，这样行为不明确并且效率低下  
vue3中需要绑定到一个methods上，dom创建口会调用方法并传入dom // 可能是在每次dom更新时触发

选项式api
```js
export default {
  data() {
    return {
      itemRefs: []
    }
  },
  methods: {
    setItemRef(el) {
      if (el) {
        this.itemRefs.push(el)
      }
    }
  },
  beforeUpdate() {
    this.itemRefs = []
  },
  updated() {
    console.log(this.itemRefs)
  }
}

```

组合式api
```js
import { onBeforeUpdate, onUpdated } from 'vue'

export default {
  setup() {
    let itemRefs = []
    const setItemRef = el => {
      if (el) {
        itemRefs.push(el)
      }
    }
    onBeforeUpdate(() => {
      itemRefs = []
    })
    onUpdated(() => {
      console.log(itemRefs)
    })
    return {
      setItemRef
    }
  }
}
```

- itemRefs 不必是数组：它也可以是一个对象，其 ref 会通过迭代的 key 被设置。 (demo->)[https://codepen.io/thetime50/pen/GRmQQwv]
- 如果需要，itemRef 也可以是响应式的且可以被监听。

## 异步组件

https://v3.cn.vuejs.org/guide/migration/async-components.html

- 异步组件需要通过 defineAsyncComponent 函数处理
- 异步组件component选项重命名为loader
- loader还是不再接受resolve reject参数，且必须返回promise
  - 路由的懒加载不需要使用 defineAsyncComponent [->](https://next.router.vuejs.org/zh/guide/advanced/lazy-loading.html)
  - 

vue2语法
```js
// 异步组件
const asyncModal = () => import('./Modal.vue')

// 异步组件选项
const asyncModal = {
  component: () => import('./Modal.vue'),
  delay: 200,
  timeout: 3000,
  error: ErrorComponent,
  loading: LoadingComponent
}
```

vue3语法
```js
import { defineAsyncComponent } from 'vue'

// 不带选项的异步组件
const asyncModal = defineAsyncComponent(() => import('./Modal.vue'))

// 带选项的异步组件
const asyncModalWithOptions = defineAsyncComponent({
  loader: () => import('./Modal.vue'),
  delay: 200,
  timeout: 3000,
  errorComponent: ErrorComponent,
  loadingComponent: LoadingComponent
})
```

vue3异步组件要返回promise
```js
// 2.x 版本
const oldAsyncComponent = (resolve, reject) => {
  /* ... */
}

// 3.x 版本
const asyncComponent = defineAsyncComponent(
  () =>
    new Promise((resolve, reject) => {
      /* ... */
    })
)
```

## attribute 强制行为

https://v3.cn.vuejs.org/guide/migration/attribute-coercion.html

*这是一个低等级的内部 API 更改，不会影响大多数开发人员。*

- 删除枚举 attribute 的内部概念，并将这些 attribute 视为普通的非布尔 attribute //// 这是什么鬼啊啊
- **重大改变**：如果值为布尔值，则不再删除 attribute false。相反，它被设置为 attr=“false”。移除 attribute，应该使用 null 或者 undefined。

