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

#### 模板指令

#### 组件

#### 渲染函数

#### 自定义元素

#### 其他改变

#### 移除api

### 官方支持的库

#### Vue CLI

#### Vue Router

#### Vuex

#### Devtools Extension

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
