## $attrs 包含 class & style

现在 $attrs 包含传递给组件的所有 attribute，包括 class 和 style。

**vue2**中，在使用 inheritAttrs: false 时会产生副作用：
- $attrs 中的 attribute 不再自动添加到根元素中，而是由开发者决定在哪添加。
- 但是 class 和 style 不属于 $attrs，仍然会应用到组件的根元素


[vue2 inheritAttrs](https://cn.vuejs.org/v2/api/#inheritAttrs)
- inheritAttrs 默认为true
- 不是props 定义的元素会被绑定到子组件根元素上
- 如果inheritAttrs 为false 就不会绑定到根元素三
- class 和 style 不受这个选项影响


| inheritAttrs | false | true |
| :-- | :-- | :-- |
| 被加到根元素上 | × | √ |
| 在$attrs中 | √ | √ |

**vue3**
$attrs 包含传递给组件的所有 attribute，包括 class 和 style。

## $children

https://v3.cn.vuejs.org/guide/migration/children.html#概览

$children 实例 property 已从 Vue 3.0 中移除，不再支持。

## 自定义指令

https://v3.cn.vuejs.org/guide/migration/custom-directives.html#概览

指令的钩子函数已经被重命名，以更好地与组件的生命周期保持一致。

**Vue 2** 指令的钩子函数

- **bind** - 指令绑定到元素后发生。只发生一次。
- **inserted** - 元素插入父 DOM 后发生。
- **update** - 当元素更新，但子元素尚未更新时，将调用此钩子。
- **componentUpdated** - 一旦组件和子级被更新，就会调用这个钩子。
- **unbind** - 一旦指令被移除，就会调用这个钩子。也只调用一次。

**vue3** 指令钩子
- **created** - 新的！在元素的 attribute 或事件侦听器应用之前调用。
- <s>bind</s> → **beforeMount**
- <s>inserted</s> → **mounted**
- **beforeUpdate**：新的！这是在元素本身更新之前调用的，很像组件生命周期钩子。
- <s>update</s> → 移除！有太多的相似之处要更新，所以这是多余的，请改用 updated。
- <s>componentUpdated</s> → **updated**
- **beforeUnmount**：新的！与组件生命周期钩子类似，它将在卸载元素之前调用。
- <s>unbind</s> -> **unmounted**

```js
const MyDirective = {
  created(el, binding, vnode, prevVnode) {}, // 新增
  beforeMount() {},
  mounted() {},
  beforeUpdate() {}, // 新增
  updated() {},
  beforeUnmount() {}, // 新增
  unmounted() {}
}
```

**边界情况：访问组件实例**
通常建议保持指令独立于它们所使用的组件实例。<u>从自定义指令中访问实例通常意味着该指令本身应该是一个组件。</u>然而，在某些情况下这是有意义的。

在 **Vue 2** 中，必须通过 vnode 参数访问组件实例：
```js
bind(el, binding, vnode) {
  const vm = vnode.context
}
```
在 **Vue 3** 中，实例是 binding 参数的一个 property：
```js
mounted(el, binding, vnode) {
  const vm = binding.instance
}
```