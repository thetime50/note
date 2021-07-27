# vue3迁移指南
## 介绍
### 概览

https://v3.cn.vuejs.org/guide/migration/introduction.html


- 通过脚手架 Vite：
```cmd
npm init vite hello-vue3 -- --template vue # OR yarn create vite hello-vue3 --template vue
```
- 通过脚手架 vue-cli：
```cmd
npm install -g @vue/cli # 或 yarn global add @vue/cli
vue create hello-vue3
# 选择 vue 3 preset
```



#### 新特性
Vue 3 中需要关注的一些新功能包括：

- [组合式 API][composition-api-introduction] // 调用 vue api 注册组件的结构和逻辑，从而把相关业务整理到一起管理
- [Teleport][teleport] // 模板渲染与 组件逻辑和嵌套分离 解决弹窗问题
- [片段][fragments] // 支持组件下直接多个节点
- [触发组件选项][component-custom-events] // 组件事件参数验证 组件emits属性
- [来自 @vue/runtime-core 的 createRenderer API][runtime-core] 创建自定义渲染器
- [单文件组件组合式 API 语法糖 (&lt;script setup>)][0040-script-setup.md] *实验性*
- [单文件组件状态驱动的 CSS 变量 (&lt;style> 中的 v-bind)][0000-sfc-style-variables] *实验性*
- [Suspense][suspense] *实验性*



[composition-api-introduction]:https://v3.cn.vuejs.org/guide/composition-api-introduction.html
[teleport]:https://v3.cn.vuejs.org/guide/teleport.html
[fragments]:https://v3.cn.vuejs.org/guide/migration/fragments.html
[component-custom-events]:https://v3.cn.vuejs.org/guide/component-custom-events.html
[runtime-core]:https://github.com/vuejs/vue-next/tree/master/packages/runtime-core
[0040-script-setup.md]:https://github.com/vuejs/rfcs/blob/master/active-rfcs/0040-script-setup.md
[0000-sfc-style-variables]:https://github.com/vuejs/rfcs/blob/style-vars-2/active-rfcs/0000-sfc-style-variables.md
[suspense]:https://v3.cn.vuejs.org/guide/migration/suspense.html


### 非兼容变更
- [全局 Vue API 已更改为使用应用程序实例](https://v3.cn.vuejs.org/guide/migration/global-api.html)
- [全局和内部 API 已经被重构为可 tree-shakable](https://v3.cn.vuejs.org/guide/migration/global-api-treeshaking.html)
#### 全局API

- (全局 Vue API 已更改为使用应用程序实例)[/guide/migration/global-api.html]
- (全局和内部 API 已经被重构为可 tree-shakable)[/guide/migration/global-api-treeshaking.html]

#### 模板指令
- (组件上 v-model 用法已更改，替换 v-bind.sync)[/guide/migration/v-model.html]
- (&lt;template v-for> 和非 v-for 节点上 key 用法已更改)[/guide/migration/key-attribute.html]
- (在同一元素上使用的 v-if 和 v-for 优先级已更改)[/guide/migration/v-if-v-for.html]
- (v-bind="object" 现在排序敏感)[/guide/migration/v-bind.html]
- (v-on:event.native 修饰符已移除)[/guide/migration/v-on-native-modifier-removed.html]
- (v-for 中的 ref 不再注册 ref 数组)[/guide/migration/array-refs.html]

#### 组件
- (只能使用普通函数创建功能组件)[/guide/migration/functional-components.html]
- (functional 属性在单文件组件 (SFC) <template> 和 functional 组件选项被抛弃)[/guide/migration/functional-components.html]
- (异步组件现在需要 defineAsyncComponent 方法来创建)[/guide/migration/async-components.html]
- (组件事件现在需要在 emits 选项中声明)[/guide/migration/emits-option.html]
#### 渲染函数
- (渲染函数 API 改变)[/guide/migration/render-function-api.html]
- ($scopedSlots property 已删除，所有插槽都通过 $slots 作为函数暴露)[/guide/migration/slots-unification.html]
- ($listeners 被移除或整合到 $attrs)[./listeners-removed]
- ($attrs 现在包含 class and style attribute)[/guide/migration/attrs-includes-class-style.html]

#### 自定义元素
- (自定义元素检测现在已经在编译时执行)[/guide/migration/custom-elements-interop.html]
- (对特殊的 is prop 的使用只严格限制在被保留的 &lt;component> 标记中)[/guide/migration/custom-elements-interop.html#定制内置元素]

#### 其他改变
- destroyed 生命周期选项被重命名为 unmounted
- beforeDestroy 生命周期选项被重命名为 beforeUnmount
- (default prop 工厂函数不再可以访问 this 上下文)[/guide/migration/props-default-this.html]
- (自定义指令 API 已更改为与组件生命周期一致)[/guide/migration/custom-directives.html]
- (data 选项应始终被声明为一个函数)[/guide/migration/data-option.html]
- (来自 mixin 的 data 选项现在为浅合并)[/guide/migration/data-option.html#mixin-合并行为变更]
- (Attribute 强制策略已更改)[/guide/migration/attribute-coercion.html]
- (一些过渡 class 被重命名)[/guide/migration/transition.html]
- (&lt;TransitionGroup> 不再默认渲染包裹元素)[/guide/migration/transition-group.html]
- (当侦听一个数组时，只有当数组被替换时，回调才会触发，如果需要在变更时触发，则需要指定 deep 选项)[/guide/migration/watch.html]
- 没有特殊指令的标记 (v-if/else-if/else、v-for 或 v-slot) 的 &lt;template> 现在被视为普通元素，并将生成原生的 &lt;template> 元素，而不是渲染其内部内容。
- (已挂载的应用不会取代它所挂载的元素)[/guide/migration/mount-changes.html]
- (生命周期 hook: 事件前缀改为 vnode-)[/guide/migration/vnode-lifecycle-events.html]

#### 移除api
- (keyCode 支持作为 v-on 的修饰符)[/guide/migration/keycode-modifiers.html]
- ($on、$off 和 $once 实例方法)[/guide/migration/events-api.html]
- (过滤)[/guide/migration/filters.html]
- (内联模板 attribute)/guide/migration/inline-template-attribute.html[]
- ($children 实例 property)[/guide/migration/children.html]
- (propsData 选项)[/guide/migration/props-data.html]
- $destroy 实例方法。用户不应再手动管理单个 Vue 组件的生命周期。
- 全局函数 set 和 delete 以及实例方法 $set 和 $delete。基于代理的变化检测不再需要它们了。

### 官方支持的库

#### Vue CLI
- (文档)[https://cli.vuejs.org/zh/]
- (GitHub)[https://github.com/vuejs/vue-cli]

#### Vue Router
- (文档)[https://next.router.vuejs.org/]
- (Github)[https://github.com/vuejs/vue-router-next]
- (RFCs)[https://github.com/vuejs/rfcs/pulls?q=is%3Apr+is%3Amerged+label%3Arouter]

#### Vuex
- (文档)[https://next.vuex.vuejs.org/]
- (Github)[https://github.com/vuejs/vuex/tree/4.0]

#### Devtools Extension
- Chrome：从 Chrome web 商店中安装
    - beta 版本可能与 devtools 的稳定版本冲突
- Firefox：下载签名扩展

#### IDE 支持

#### 其他项目

|  |  |  |
| :-- | :-- | :-- |
| 项目	npm	仓库
| @vue/babel-plugin-jsx | ![npm-img-babel-plugin-jsx][npm-img-babel-plugin-jsx][->][npm-babel-plugin-jsx] | [\[Github\]][babel-plugin-jsx] |
| eslint-plugin-vue | ![npm-img-eslint-plugin-vue][npm-img-eslint-plugin-vue][->][npm-eslint-plugin-vue] | [\[Github\]][eslint-plugin-vue] |
| @vue/test-utils | ![npm-img-test-utils][npm-img-test-utils][->][npm-test-utils] | [\[Github\]][test-utils] |
| vue-class-component | ![npm-img-vue-class-componen][npm-img-vue-class-componen][->][npm-vue-class-componen] | [\[Github\]][vue-class-component] |
| vue-loader | ![npm-img-vue-loader][npm-img-vue-loader][->][npm-vue-loader] | [\[Github\]][vue-loader] |
| rollup-plugin-vue | ![npm-img-rollup-plugin-vue][npm-img-rollup-plugin-vue][->][npm-rollup-plugin-vue] | [\[Github\]][rollup-plugin-vue] |

[npm-img-babel-plugin-jsx]:https://img.shields.io/npm/v/@vue/babel-plugin-jsx.svg
[npm-img-eslint-plugin-vue]:https://img.shields.io/npm/v/eslint-plugin-vue.svg
[npm-img-test-utils]:https://img.shields.io/npm/v/@vue/test-utils/next.svg
[npm-img-vue-class-componen]:https://img.shields.io/npm/v/vue-class-component/next.svg
[npm-img-vue-loader]:https://img.shields.io/npm/v/vue-loader/next.svg
[npm-img-rollup-plugin-vue]:https://img.shields.io/npm/v/rollup-plugin-vue/next.svg


[npm-babel-plugin-jsx]:https://www.npmjs.com/package/@vue/babel-plugin-jsx
[npm-eslint-plugin-vue]:https://www.npmjs.com/package/eslint-plugin-vue
[npm-test-utils]:https://www.npmjs.com/package/@vue/test-utils/v/next
[npm-vue-class-componen]:https://www.npmjs.com/package/vue-class-component/v/next
[npm-vue-loader]:https://www.npmjs.com/package/vue-loader/v/next
[npm-rollup-plugin-vue]:https://www.npmjs.com/package/rollup-plugin-vue/v/next

[babel-plugin-jsx]:https://github.com/vuejs/jsx-next
[eslint-plugin-vue]:https://github.com/vuejs/eslint-plugin-vue
[test-utils]:https://github.com/vuejs/vue-test-utils-next
[vue-class-component]:https://github.com/vuejs/vue-class-component/tree/next
[vue-loader]:https://github.com/vuejs/vue-loader/tree/next
[rollup-plugin-vue]:https://github.com/vuejs/rollup-plugin-vue/tree/next
