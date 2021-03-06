
## 2020-11-30 vue01-全家桶原理和实现

https://github.com/thetime50/2020-11-30-kkb-whole-stack

### vue router 原理
https://github.com/57code/vue-study/tree/web25

1. use(router)
2. import router from './router' -> new vue({router})


window.addEventListener('hashchange'
H5 history api // History.pushState() .replaceState()


### ---
实现vue routetr 插件
处理路由选项
监控url 变化 
渲染模板


**vue.Use的时间比 new Router 的时间早 所以不用vue.protope.$router = router而是在全局混入beforeCreate内vue.protope.$router = router**

注册全局组件 router-view router-link

Vue.component({template:'\<a\>'}) 报 run-time

### 
vue.util.defineReactive(this,'current','/')


### vuex 
集中管理 
状态变更

#### vuex实现
实现state class
1. 维持响应式state 
2. 实现conmit
3. 实现action


**************************************************************************
*2:12:54*
```js
// kvuex
// 插件里不要import vue 要通过 indtall传参来引用
let Vue

class Store {
  constructor(options) {
    // 1.选项处理
    // this.$options = options
    this._mutations = options.mutations
    this._actions = options.actions
    // 2.响应式state
    // 这里不直接用 this.state = new Vue({})
    // 以为需要代理 this.state 的 get set 拦截set操作 做一些保护
    this._vm = new Vue({
      data: {
        // 避免直接通过 this._vm.data 引用到state
        // https://cn.vuejs.org/v2/guide/instance.html#%E6%95%B0%E6%8D%AE%E4%B8%8E%E6%96%B9%E6%B3%95
        // 除了数据 property，Vue 实例还暴露了一些有用的实例 property 与方法。它们都有前缀 $，以便与用户定义的 property 区分
        // https://cn.vuejs.org/v2/style-guide/#私有-property-名必要

        // 加了$ 就不能通过 _vm.$xxx 直接引用
        // 要通过 _vm._data 引用
        // _vm.$data 不是响应式的
        // 响应式数据里都有个 __ob__ 属性
        dbgData:"_vm.dbgData 直接引用测试",
        $dbgData:"_vm.$dbgData 直接引用测试",
        $$dbgData:"_vm.$$dbgData 直接引用测试",
      },
      computed: {
        $$getter(){
          let result = {}
          for(let index in options.getters){
            result[index] = options.getters[index](
              this._data.$$state,
              // this.$$getter //._computedWatchers.$$getter
            )//.call(this.$store)
          }
          return result
        }
      }
    })

    this.commit = this.commit.bind(this) // commit 通过this 引用到vuex实例 绑定上下文环境 
    this.dispatch = this.dispatch.bind(this) // dispatch 通过this 引用到vuex实例 绑定上下文环境 

  }

  get state() {
    console.log(this._vm);
    return this._vm._data.$$state
  }

  get getters() {
    console.log(this._vm);
    return this._vm.$$getter //._computedWatchers.$$getter
  }

  set state(v) {
    console.error('please use replaceState to reset state');
  }

  commit(type, payload) {
    const entry = this._mutations[type]

    if (!entry) {
      console.error('unkwnow mutation type');
      return
    }

    entry(this.state, payload)
  }

  dispatch(type, payload) {
    const entry = this._actions[type]

    if (!entry) {
      console.error('unkwnow action type');
      return
    }

    entry(this, payload)
  }
}
function install(_Vue) {
  Vue = _Vue

  Vue.mixin({
    beforeCreate() {
      if (this.$options.store) { 
        Vue.prototype.$store = this.$options.store //new Vue({store})传进来的 class Store 实例
      }
    }
  })
}

// 导出对象认为是Vuex
// vuex 插件挂载时是使用 vue.use(Vuex.store) 和vue router 挂载方式不同
export default {Store, install}
```

react 中的mobx相当于更复杂的vuex实现

