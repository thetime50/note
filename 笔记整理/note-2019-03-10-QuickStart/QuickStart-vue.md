# QuickStart-vue

[vue-en](https://vuejs.org)  
[vue-ch](https://cn.vuejs.org)

## vue实例
所有的 Vue 组件都是 Vue 实例，并且大部分接受相同的选项对象

**data 对象 数据**  
创建vue实例时会添加 data 对象中能找到的所有的属性 *创建时才会绑定视图关系*  
HTML中用{{ attr }} 引用数据
被绑上的对象如果使用Object.freeze()冻结就无法再追踪变化

**$ 引用vue对象**  
vue对象都以$开头
vm.$data //数据  
vm.$el //组件dom标签  
[vue的属性和方法](https://cn.vuejs.org/v2/api/#实例属性)

**实例生命周期和钩子**
 Vue 实例创建过程

- Create 创建
- Mount 挂载
- Update 更新
- Destroy 销毁

![lifecycle](img/QuickStart-vue/lifecycle.png)

## 模板语法
Vue实例绑定DOM，Vue模板即Html标签  
vDOM渲染或者[直接渲染](https://cn.vuejs.org/v2/guide/render-function.html)??

### 插值

**文本** 
```
<>{{ msg }}</> //解释为文本
<v-once>{{ msg }}</> //一次性插值
```

**Html**
```
<> <span v-html="rawHtml"></span> </> //span标签间被替换
```

<u>使用用户数据修改html是危险的</u>

**特性(属性)**
```
< v-bind:id="dynamicId"></>
//如果是null、undefined 或 false 属性将不输出现
```

**JavaScript(_表达式)**
```
//绑定表达式(到属性上)
//访问白名单的数据 Date Math
{{ Script }}
< v-bind:id=" Script " />
```

**指令**  
v-  
v-if v-for  
v-bind:href v-on:click //指令的参数

**动态参数**  
v-bind:[attr] v-on:[event]  
参数异常将解释为null 移除绑定  
不解析空格和引号等

**修饰符**  
句号.  后面再讲

**缩写**  
v-bind:href =>  :href
v-on:click => @click

## 计算属性和侦听器
### 计算属性
computed:计算属性 属性内为多个计算方法 引用返回结果  
*date.now()不是响应式依赖，将无法更新*
```
 <p>Computed reversed message: "{{ reversedMessage }}"</p>
 var vm = new Vue({
  el: '#example',
  data: {
    message: 'Hello'
  },
  computed: {

    reversedMessage: function () {
      return this.message.split('').reverse().join('')
    }

  }
})
```

methods: 计算方法 命令式？？ 每次调用都会重新执行其余都相同

watch： 侦听属性 侦听数据变动 名称为data名 参数为data的值

```
computed: {
  fullName: {
    // getter
    get: function () { //引用时执行
      return this.firstName + ' ' + this.lastName
    },
    // setter
    set: function (newValue) { //赋值时执行
      var names = newValue.split(' ')
      this.firstName = names[0]
      this.lastName = names[names.length - 1]
    }
  }
}
```

### 侦听器
watch 选项允许我们执行异步操作 (为什么？？)

## Class 与 Style 绑定
###别的HTML Class
```
v-bind:class="a b:'b-value'"
//一般class b-value为boolean

v-bind:class="{ active: isActive, 'text-danger': hasError }"
//多class
//遇到-加引号
```

**引用变量和方法**  
也可以引用data:的属性和compute:的方法返回对象  
本质上""内的就是表达式{}就是对象  

**数组语法**  
v-bind:class="[activeClass, errorClass]"  
//引用变量

**用在组件上**  
引用组件设置的class和组件内的class将添加在一起

### 绑定内联样式
v-bind:style  
操作差不多  
会自动添加浏览器前缀

**多重值**
```
:style="{ display: ['-webkit-box', '-ms-flexbox', 'flex'] }"
//只会加载浏览器支持的值 为什么？？
```

note:还是太细了

## 条件渲染
(构建dom)  
```
<div v-if="type === 'A'">
</div>
<div v-else-if="type === 'B'">
</div>
<div v-else>
</div>
```

v-if 监听事件 组件按需销毁重构  
*v-if命令下相识结构的DOM将会复用，输入框会保留内容*  
给输入表单添加不同的key属性就能保持标签独立
```
<template v-if="loginType === 'username'">
  <input placeholder="Enter your username" key="username-input">
</template>
<template v-else>
  <input placeholder="Enter your email address" key="email-input">
</template>
```

v-show 切换CSS 属性 display

避免 v-if 和 v-for 用在一起(虽然for优先级高但是这不利于阅读)
1. 将v-if替换为计算属性
2. 加一层容器

## 列表渲染
用 v-for 把一个数组对应为一组元素
```
//作用于数组
<li v-for="item in items"> {{ item.message }}
<li v-for="(item, index) in items"> {{ index }} - {{ item.message }}

//作用于对象
<li v-for="value in object"> {{ value }}
<div v-for="(value, key) in object"> {{ key }}: {{ value }}
<div v-for="(value, key, index) in object"> ...

//是按 Object.keys()的顺序遍历
```

数组顺序改变时默认只修改复用已有DOM将不会排序  
绑定item的id到ket属性可以在数组改变时重新更新  
```
v-for="item in items" :key="item.id"
```

**数组更新检测**

变异方法(修改自身)将观察数组数据跟新
- push() //末尾添加
- pop() //末尾删除
- shift() //开头删除
- unshift() //开头添加
- splice() //删除并添加
- sort() //排序
- reverse() //反序

非变异方法(返回新数组)替换vue会尽量少的改动DOM
- filter() //过滤
- concat() //连接
- slice() //截取

```
vm.items[indexOfItem] = newValue
//替换为
vm.$set(vm.items, indexOfItem, newValue)

vm.items.length = newLength
//替换为
vm.items.splice(newLength)

//vue对象添加属性使用
Vue.set(object, key, value)//vue方法
vm.$set(vm.userProfile, 'age', 27)//实例的方法
vm.userProfile = Object.assign({}, vm.userProfile, {
  age: 27,
  favoriteColor: 'Vue Green'
})

```

使用computed: 或者 methods： 计算获取新对象

```
<span v-for="n in 10">{{ n }}
```

v-for在组件上使用必须显示绑定key属性
```
:key="item.id"
```

*组件在模板内使用时，将<comp>替换为 is="comp"属性 避免模板解析错误*
```
 <ul>
    <li
      is="todo-item"
      v-for="(todo, index) in todos"
      v-bind:key="todo.id"
      v-bind:title="todo.title"
      v-on:remove="todos.splice(index, 1)"
    ></li>
  </ul>
```
[解析 DOM 模板时的注意事项](https://cn.vuejs.org/v2/guide/components.html#解析-DOM-模板时的注意事项)