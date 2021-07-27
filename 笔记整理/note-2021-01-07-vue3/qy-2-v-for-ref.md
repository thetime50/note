## v-for 中的 Ref 数组

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
