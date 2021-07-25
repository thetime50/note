# vue3迁移指南
## 介绍
### 概览

https://v3.cn.vuejs.org/guide/migration/introduction.html#概览


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
- [触发组件选项][component-custom-events] // 组件事件参数验证
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