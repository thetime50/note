# QuickStart-vue

[vue-en](https://vuejs.org)  
[vue-ch](https://cn.vuejs.org)

[TOC]
  - [QuickStart-vue](#QuickStart-vue)
    - [vue实例](#vue实例)
    - [模板语法](#模板语法)
      - [插值](#插值)
    - [计算属性和侦听器](#计算属性和侦听器)
      - [计算属性](#计算属性)
      - [侦听器](#侦听器)
    - [Class 与 Style 绑定](#Class-与-Style-绑定)
      - [绑定内联样式](#绑定内联样式)
    - [条件渲染](#条件渲染)
    - [列表渲染](#列表渲染)
    - [事件处理](#事件处理)
      - [监听事件](#监听事件)
      - [事件修饰符](#事件修饰符)
      - [按键修饰符](#按键修饰符)
    - [表单输入绑定](#表单输入绑定)
      - [基础](#基础)
      - [修饰符](#修饰符)
    - [组件基础](#组件基础)
      - [通过 Prop 向子组件传递数据](#通过-Prop-向子组件传递数据)
      - [监听子组件事件](#监听子组件事件)
      - [组件上使用 v-model](#组件上使用-v-model)
      - [插槽](#插槽)
      - [动态组件](#动态组件)
    - [组件注册](#组件注册)
      - [组件名](#组件名)
      - [全局注册](#全局注册)
      - [局部注册](#局部注册)
      - [模块系统](#模块系统)
    - [Prop](#Prop)
    - [传递静态或动态 Prop](#传递静态或动态-Prop)
      - [单向数据流](#单向数据流)
      - [Prop 验证](#Prop-验证)
      - [禁用特性继承](#禁用特性继承)
    - [自定义事件](#自定义事件)
      - [事件名](#事件名)
      - [自定义组件的 v-model](#自定义组件的-v-model)
      - [sync 修饰符](#sync-修饰符)
    - [插槽](#插槽-1)
      - [具名插件](#具名插件)
      - [作用域插槽](#作用域插槽)
      - [解构插槽 Prop](#解构插槽-Prop)
      - [动态插槽名](#动态插槽名)
      - [具名插槽缩写](#具名插槽缩写)
      - [示例](#示例)
    - [动态组件 异步组件](#动态组件-异步组件)
      - [keep-alive](#keep-alive)
      - [异步组件](#异步组件)
    - [处理边界情况](#处理边界情况)
      - [访问元素 组件](#访问元素-组件)
      - [程序化的事件侦听器](#程序化的事件侦听器)
      - [循环引用](#循环引用)
      - [模板定义的替代品](#模板定义的替代品)
      - [控制更新](#控制更新)
    - [进入 离开 列表过渡](#进入-离开-列表过渡)
      - [单元素 组件的过渡](#单元素-组件的过渡)
      - [过度动画的类名](#过度动画的类名)
      - [css过渡](#css过渡)
      - [css动画](#css动画)
      - [定义过渡的类名](#定义过渡的类名)

[TOCEND]

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
动态的属性名称  
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
//不使用vue语法的为一般的html

v-bind:class="b:'b-value'"
//b-value为boolean

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
*v-if命令下相似结构的DOM将会复用，输入框会保留内容*  
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

使用computed: 或者 methods： 计算获取新建的对象

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

## 事件处理
### 监听事件

```
v-on:xxx="expression"
@xxx="expression"

 methods: {
    greet: function (event) {// `event` 是原生 DOM 事件
      alert('Hello ' + this.name + '!') // `this` 指向当前 Vue 实例
      if (event) {
        alert(event.target.tagName)
      }
    }
  }

  //传递参数
  <button v-on:click="say('hi')">Say hi</button>
  //特殊变量$event (和函数内默认的event是一样的)
  <button v-on:click="warn('Form cannot be submitted yet.', $event)">
```

### 事件修饰符
- .stop //阻止传播
- .prevent //阻止默认行为
- .capture //捕获模式 (优先于冒泡 由外到内)
- .self //自身事件
- .once //单次 2.1.4 新增
- .passive //2.3.0 新增

可串联 从左到右

.passive  
页面滚动事件会先执行监听器(回调)再执行系统默认行为产生卡顿  
passive内preventDefault()是无效的，可以直接执行默认行为(滚动)
[link](https://blog.csdn.net/hhlljj0828/article/details/79497734)

### 按键修饰符

```
<input v-on:keyup.enter="submit">
//即过滤$event.key
```

按键码可用数字v-on:keyup.13 ie部分编码不同

- .enter
- .tab
- .delete (捕获“删除”和“退格”键)
- .esc
- .space
- .up
- .down
- .left
- .right

config.keyCodes 对象自定义按键修饰符别名

2.1.0 新增
- .ctrl
- .alt
- .shift
- .meta

.exact 精确的系统修饰符
```
@click.ctrl //ctrl + *
@click.ctrl.a //ctrl + * + a
@click.ctrl.exact //only ctrl + *
@click.exact //没有任何系统修饰符
```

鼠标按钮修饰符
- .left
- .right
- .middle

## 表单输入绑定
### 基础
用v-model 指令双向绑定 input txtarea select

> 会忽略原本HTML的value、checked、selected属性，始终用Vue实例的数据作为数据来源，需要在data对象内初始化

- text 和 textarea 元素使用 value 属性和 input 事件；
- checkbox 和 radio 使用 checked 属性和 change 事件；
- select 字段将 value 作为 prop 并将 change 作为事件。

使用输入法过程中v-model的值不会改变，但是input事件会响应

checkbox 绑定数组选中项目填充value属性值字符串  
radio 填充value属性   
select option中的value或者content（需要加一个disabled 选项，iOS 可能会无法选择第一个选项）  
selected 绑定数组

```
<input
  type="checkbox"
  v-model="toggle"
  true-value="yes"//只影响v-model 不会影响value
  false-value="no"
>
```

### 修饰符
v-model修饰符
|         |                                |
| :--     | :--                            |
| .lazy   | v-model input同步改为change同步 |
| .number | 转为数值                        |
| .trim   | 过滤首尾空白字符                 |

## 组件基础
组件是可复用的 Vue 实例  
通过 new Vue 创建的 Vue 根实例中
new Vue() 接收的属性和组件的属性相同，但是多了le

```html
<!-- 定义组件 -->
<script>
// 定义一个名为 button-counter 的新组件
Vue.component(//(全局注册)
	'button-counter', //组件名字
	{
		data: function () {
			return {
				count: 0
			}
		},
		template: '<button v-on:click="count++">You clicked me {{ count }} times.</button>'
	}
)

<!-- 引用组件 -->
<div id="components-demo"> 
  <button-counter></button-counter><!-- 应用组件 -->
</div>
new Vue({ el: '#components-demo' })//创建根组件components-demo
<script>

```

data:为函数 需要返回一个对象(这样可以保证实例的参数独立)

### 通过 Prop 向子组件传递数据
 props:[]接收属性作为参数

### 监听子组件事件
在模板中：v-on:click="$emit('enlarge-text',event)"  
$emit('enlarge-text',event)触发一个自定义的事件，在父级引用的地方绑定这个事件,并带上事件参数  
如果引用处绑定一个方法，会自动填充事件的参数

### 组件上使用 v-model
- value属性绑定到prop 的value里
- 抛出input 事件
```
<input v-model="searchText">
//等价于：
<input
  v-bind:value="searchText" //自动在prop 内定义了value
  v-on:input="searchText = $event.target.value"
>
```

### 插槽
组件内使用 &ltslot/>占位，用引用组件时的内容填充

### 动态组件
```
  <component
    v-bind:is="currentTabComponent"
    class="tab"
  ></component>
  
  computed: {
    currentTabComponent: function () {
      return 'tab-' + this.currentTab.toLowerCase()
    }
  }
  ```

  ### 解析 DOM 模板时的注意事项
有些 HTML 元素，诸如 &ltul>、&ltol>、&lttable> 和 &ltselect>，对于哪些元素可以出现在其内部是有严格限制的。  
有些元素，诸如 &ltli>、&lttr> 和 &ltoption>，只能出现在其它某些特定的元素内部。  

这种情况下使用is="component"属性来指定引用的组件  
使用下列来源的组件没有这条限制
- 字符串 (例如：template: '...')
- 单文件组件 (.vue)
- &lt script type="text/x-template">

## 组件注册
### 组件名  
Vue.component('my-component-name', { /* ... */ })
组件名建议 [W3C 规范][w3c_componentname]字母全小写且必须包含-  
参考[风格指南](https://cn.vuejs.org/v2/style-guide/#基础组件名-强烈推荐)

[w3c_componentname]:https://html.spec.whatwg.org/multipage/custom-elements.html#valid-custom-element-name

使用keybab-case定义(注册)必须用keybab-case引用  
使用PascalCase定义的在中字符串模板中可以用PascalCase或者keybab-case引用,在DOM模板只能用keybab-case(因为DOM大小写不敏感)

### 全局注册  
Vue.component('my-component-name', { /* ... */ })  
注册之后可以用在任何新创建的 Vue 根实例 (new Vue) 的模板中。  
子组件中也可用

### 局部注册
用js对象定义组件  
在components选项(对象)中声明，对象key即自定义元素名字
在其子组件中不可用
```
var ComponentA = { /* ... */ }
var ComponentB = {
  components: {
    'component-a': ComponentA
  },
}

//ES2015
import ComponentA from './ComponentA.vue'
export default {
  components: {
    ComponentA //即ComponentA: ComponentA
  },
}
```

### 模块系统
Babel 和 webpack 的模块系统  
组件放在components 目录下 用import引入  

自动化全局注册：  
(webpack 的 Vue CLI 3+)
src/main.js
```
import Vue from 'vue'
import upperFirst from 'lodash/upperFirst'
import camelCase from 'lodash/camelCase'

const requireComponent = require.context(
  // 其组件目录的相对路径
  './components',
  // 是否查询其子目录
  false,
  // 匹配基础组件文件名的正则表达式
  /Base[A-Z]\w+\.(vue|js)$/
)

 //componentConfig(req) //Module模块 import导入的效果
 //.resolve(req) 搜索相对路径转为项目相路径
 //.keys() 匹配的模块名字列表
 //.id {String} -执行环境的id 即输入参数用在module.hot.accept

requireComponent.keys().forEach(fileName => {
  // 获取组件配置
  const componentConfig = requireComponent(fileName)
  
  // 获取组件的 PascalCase 命名
  const componentName = upperFirst(
    camelCase(
      // 剥去文件名开头的 `./` 和结尾的扩展名
      fileName.replace(/^\.\/(.*)\.\w+$/, '$1')
    )
  )

  // 全局注册组件
  Vue.component(
    componentName,
    // 如果这个组件选项是通过 `export default` 导出的，
    // 那么就会优先使用 `.default`，
    // 否则回退到使用模块的根。
    componentConfig.default || componentConfig
  )
})
```
**全局注册(Vue.component())必须在根 Vue 实例 (通过 new Vue) 创建之前**

[使用require.context实现前端工程自动化](https://www.jianshu.com/p/c894ea00dfec)  
[webpack](https://webpack.docschina.org/guides/dependency-management/)  
[upperfirst](https://www.html.cn/doc/lodash/#_upperfirststring)
[camelcase](https://www.html.cn/doc/lodash/#_camelcasestring)

## Prop
Prop 的大小写 同[组件名](#组件名)的规则
```
通过数组列出
props: ['title', 'likes', 'isPublished', 'commentIds', 'author']

//通过属性和数据类型列出
props: {
  title: String,
  likes: Number,
  isPublished: Boolean,
  commentIds: Array,
  author: Object
}
```

## 传递静态或动态 Prop
传#递prop：  
通过属性赋值静态传递  
通过v-bind传递变量

```
//传递对象的所有属性 对象的属性即生成标签的属性
<tag v-bind="{a:123,b:234}"/>
```

### 单向数据流
**单向下行绑定** prop只会从父对象传递到子对象和同步刷新，在子组件中是只读的
1. 需要修改的prop则在data:内定义一个变量来使用
2. 需要转换类型的则定义一个computed:作为转类型的常量引用

*prop作为引用传递，子组件无法修改prop的引用也无法通过修改prop来改变父组件的对象，但是子组件可以修改引用内的属性值同时影响父组件对象内的属性值*

### Prop 验证
```javascript
Vue.component('my-component', {
  props: {
    // 基础的类型检查 (`null` 和 `undefined` 会通过任何类型验证)
    propA: Number,
    // 多个可能的类型
    propB: [String, Number],
   
    propC: {
      type: String,
      required: true, // 必填的字符串
      default: 100// 带有默认值的数字
    },
    // 带有默认值的对象
    propE: {
      type: Object,
      // 对象或数组默认值必须从一个工厂函数获取
      default: function () {
        return { message: 'hello' }
      }
    },
    // 自定义验证函数
    propF: {
      validator: function (value) {
        // 这个值必须匹配下列字符串中的一个
        return ['success', 'warning', 'danger'].indexOf(value) !== -1
      }
    }
  }
})
```
> prop 会在一个组件实例创建之前验证，实例的属性 (如 data、computed 等) 在 default 或 validator 函数中不可用。

可使用原生构造函数或自定义的构造函数来验证
用于验证的原生构造函数
- String
- Number
- Boolean
- Array
- Object
- Date
- Function
- Symbol

在DOM中引用组件时，非prop定义的属性也会自动加到组件的根元素上

1. 传入的属性会替换掉模板内的属性
2. class 和 style的属性会合并

### 禁用特性继承
引用组件时添加的属性将绑定在组件根元素上  
在创建组件的属性中添加 inheritAttrs: false 则不继承根元素属性(不会影响 style 和 class)  
$attrs 在模板中引用没有声明的prop属性
```
<template>
	<div>
		attrs: {{$attrs['gender']}}  
	</dir>
</template>
```

## 自定义事件
### 事件名
事件名不会keybab-case 和pascalCase自动转换，要完全匹配

### 自定义组件的 v-model
2.2.0+ 新增  
v-model 用名为 value 的 prop 和名为 input 的事件  
创建组件的model:属性可以重新设置v-model绑定的prop和事件
```
 model: {
    prop: 'checked',
    event: 'change'
}
```

事件的.native修饰符：监听原生DOM事件(vue中部分事件会执行默认动作而静默掉)

通过$listeners将模板内某个标签的所有事件转移作为组件的事件  
以下是一个完全透明的包裹器：
```javascript
Vue.component('base-input', {
  inheritAttrs: false,
  props: ['label', 'value'],
  computed: {
    inputListeners: function () {//给模板里的标签注册事件处理回调
      var vm = this
      // `Object.assign` 将所有的对象合并为一个新对象
      return Object.assign({},//合并对象
        // 我们从父级添加所有的监听器
        this.$listeners,//引用时注册的回调
        // 然后我们添加自定义监听器，
        // 或覆写一些监听器的行为
        {
          // 这里确保组件配合 `v-model` 的工作
          input: function (event) {//注册input回调
            vm.$emit('input', event.target.value)//触发模板的vevnt事件 //为什么还需要这个
          }
        }
      )
    }
  },
  template: `
    <label>
      {{ label }}
      <input
        v-bind="$attrs" //添加未命名的prop
        v-bind:value="value"
        v-on="inputListeners"
      >
    </label>
  `
})
```

[vue中'. native'修饰符的使用](https://blog.csdn.net/qq_29468573/article/details/80771625)

### sync 修饰符
2.3.0+ 新增

一般使用this.$emit('update:myPropName', newTitle)更新父对象的属性

```
<text-document
  v-bind:title="doc.title"
  v-on:update:title="doc.title = $event"
></text-document>

//缩写为
<text-document v-bind:title.sync="doc.title"></text-document>

//同步绑定对象的属性
<text-document v-bind.sync="doc"></text-document>
```
.sync修饰符只能绑定属性名，不能是表达式

## 插槽

2.6.0 中用v-slot 合并了插槽和作用域插槽(slot slot-scope)

父级模板里的所有内容都是在父级作用域中编译的；子模板里的所有内容都是在子作用域中编译的。

在组件的模板中 slot 标签内的内容作为后备内容

### 具名插件
(&lt 2.6.0 的slot语法)

```html
<!-- 组件模板 -->
<slot name="header"></slot>
<slot></slot><!-- 隐含名字“default” -->
<slot name="footer"></slot>

<!-- 引用 -->
<base-layout>
  <template v-slot:header>
    <h1>Here might be a page title</h1>
  </template>

	<!-- default域 -->
  <p>A paragraph for the main content.</p>
  <p>And another one.</p>

  <template v-slot:footer>
    <p>Here's some contact info</p>
  </template>
</base-layout>
```

### 作用域插槽
1. 组件内通过给slot标签v-bind绑定变量到slot的prop中
2. 引用时使用 v-slot:xxx="slotProps"获取slot prop
```html
<!-- 组件模板 -->
<span>
  <slot v-bind:user="user">
    {{ user.lastName }}
  </slot>
</span>

<!-- 引用 -->
<current-user>
  <template v-slot:default="slotProps">
    {{ slotProps.user.firstName }}
  </template>
</current-user>
<!-- 或者 -->
<!-- 只有default插槽可以将v-slot放在模板标签内 -->
<!-- 缩写语法不能和具名插槽混用!!!!只使用default插槽时才能使用缩写 -->
<current-user v-slot="slotProps">
  {{ slotProps.user.firstName }}
</current-user>
```

### 解构插槽 Prop
插槽的工作原理相当于传递一个包含插槽内容和参数的函数到组件中  
因此在支持的环境下 (单文件组件或现代浏览器)使用组件引入插槽prop时可以使用解构赋值 重命名 后备值等方法

[单文件组](https://cn.vuejs.org/v2/guide/single-file-components.html)  
[现代浏览器](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment#浏览器兼容)  
[ES2015解构(解构赋值)](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment#解构对象)  

```html
<current-user v-slot="{ user }">
  {{ user.firstName }}
</current-user>

<current-user v-slot="{ user: person }">
  {{ person.firstName }}
</current-user>

<current-user v-slot="{ user = { firstName: 'Guest' } }">
  {{ user.firstName }}
</current-user>
```

### 动态插槽名

即[动态指令参数](#动态参数)语法，用表达式来指定插槽
```
<base-layout>
  <template v-slot:[dynamicSlotName]>
    ...
  </template>
</base-layout>
```

### 具名插槽缩写
v-slot: 缩写为 #
```html
<base-layout>
  <template #header>
  </template>

  <p>A paragraph for the main content.</p>

  <template #footer>
  </template>
</base-layout>


<current-user #default="{ user }">
  {{ user.firstName }}
</current-user>

<!-- <current-user #="{ user }"> 这样是无效的 -->
```

### 示例
```html
<!-- 组件模板 -->
<ul>
  <li
    v-for="todo in filteredTodos"
    v-bind:key="todo.id"
  >
    <slot name="todo" v-bind:todo="todo">
      <!-- 后备内容 -->
      {{ todo.text }}
    </slot>
  </li>
</ul>

<!-- 引用 -->
<todo-list v-bind:todos="todos">
  <template v-slot:todo="{ todo }">
    <span v-if="todo.isComplete">✓</span>
    {{ todo.text }}
  </template>
</todo-list>
```
[Vue Virtual Scroller](https://github.com/Akryum/vue-virtual-scroller) 用于在DOM中的任何位置呈现组件的模板  
[Vue Promised](https://github.com/posva/vue-promised) 异步处理过程的显示
[Portal Vue](https://github.com/LinusBorg/portal-vue) 滚动浏览组件

## 动态组件 异步组件
### keep-alive

使用keep-alive缓存动态标签，保存状态避免反复重建  
组件必须有自己的名字(name选项 局部/全局注册)  
[动态组件](#动态组件)  
[keep-alive](https://cn.vuejs.org/v2/api/#keep-alive)

```
<!-- 失活的组件将会被缓存！-->
<keep-alive>
  <component v-bind:is="currentTabComponent"></component>
</keep-alive>
```

### 异步组件
从服务器加载一个模块,使用工厂函数会异步解析组件定义，只有需要被渲染的时候才触发工厂函数并且缓存起来  
//注册组件可以由promise方法来提供
```javascript
Vue.component('async-example', function (resolve, reject) {
  setTimeout(function () {//ajax
    // 向 `resolve` 回调传递组件定义
    resolve({
      template: '<div>I am async!</div>'
    })
  }, 1000)
})
```

使用 webpack 的 code-splitting (拆分代码 按需加载)  
[code-splitting](https://webpack.js.org/guides/code-splitting/)

```javascript
Vue.component('async-webpack-example', function (resolve) {
  // 这个特殊的 `require` 语法将会告诉 webpack
  // 自动将你的构建代码切割成多个包，这些包
  // 会通过 Ajax 请求加载
  require(['./my-async-component'], resolve)
})

//使用ES2015 语法
//全局注册
Vue.component(
  'async-webpack-example',
  () => import('./my-async-component')
)
//局部注册
new Vue({
  components: {
    'my-component': () => import('./my-async-component')
  }
})


//2.3.0+ 新增
//这里的异步组件工厂函数也可以返回一个如下格式的对象：

const AsyncComponent = () => ({
  // 需要加载的组件 (应该是一个 `Promise` 对象)
  component: import('./MyComponent.vue'),
  // 异步组件加载时使用的组件
  loading: LoadingComponent,
  // 加载失败时使用的组件
  error: ErrorComponent,
  // 展示加载时组件的延时时间。默认值是 200 (毫秒)
  delay: 200,
  // 如果提供了超时时间且组件加载也超时了，
  // 则使用加载失败时使用的组件。默认值是：`Infinity`
  timeout: 3000
})
```
Vue.component > {name,{component_data}}
Vue.component > promise > {name,{component_data}}
Vue.component > conf_obj > promise > {name,{component_data}}


不支持[Browserify](http://browserify.org)
[browserify-handbook](https://www.npmjs.com/package/browserify-handbook)

## 处理边界情况
### 访问元素 组件
通过 this.$store 访问根实例，引用根实例的属性和方法  
(建议用vuex来管理状态)

通过 this.$parent 访问父级对象
(上下文环境发生变化时容易出问题，建议用[依赖注入](#依赖注入))

访问子组件
```
//通过ref赋予子组件ID引用
<tag ref="comtid"/>

//通过id引用子组件
this.$refs.comtid
```
和for一起用时this.$refs.comtid将是一个数组
1. $refs在组件渲染完成之后生效
2. 不是响应式的
3. 避免在模板或计算属性中访问 

依赖注入  
同样是非响应式的 建议用vuex替代
```
//通过provide属性提供
provide: function () {
  return {
    getMap: this.getMap
  }
}
//在任何后代中可以通过inject引用
inject: ['getMap']
```

### 程序化的事件侦听器
- $on(eventName, eventHandler) 侦听事件
- $once(eventName, eventHandler) 侦听一次性事件
- $off(eventName, eventHandler) 停止侦听事件
```javascript
//使用时间绑定统一管理数据生成和释放
mounted: function () {
  this.attachDatepicker('startDateInput')
  this.attachDatepicker('endDateInput')
},
methods: {
  attachDatepicker: function (refName) {
    var picker = new Pikaday({
      field: this.$refs[refName],
      format: 'YYYY-MM-DD'
    })
    this.$once('hook:beforeDestroy', function () {
      picker.destroy()
    })
  }
}
```

### 循环引用
引用自身  
用Vue.component全局注册组件，ID将作为组件的name属性  
在组件内也可引用自身

组件间循环引用  
 webpack 或 Browserify构造工具会陷入循环  
 ```javascript
//动态注册组件
beforeCreate: function () {
  this.$options.components.TreeFolderContents = require('./tree-folder-contents.vue').default
}
//或者
//webpack 的异步 import
components: {
  TreeFolderContents: () => import('./tree-folder-contents.vue')
}
 ```

### 模板定义的替代品
内联模板  
标签的inline-template属性存在时即作为组件模板  
建议用组件的template对象或template 标签定义模板

X-Template  
通过type="text/x-template" 的script定义，id索引
```
//定义模板
script type="text/x-template" id="hello-world-template">
  <p>Hello hello hello</p>
</script>
//组件通过ID引用模板
Vue.component('hello-world', {
  template: '#hello-world-template'
})
```

### 控制更新
this.$forceUpdate()刷新  
影响实例本身和插入插槽内容的子组件，而不包含子组件

DOM添加v-once 属性定义静态的模板，只渲染一次

## 进入 离开 列表过渡
Vue 在插入、更新或者移除 DOM 时实现过渡效果的方法
- 在 CSS 过渡和动画效果
- 第三方 CSS 动画库，如 Animate.css
- 使用 JavaScript 钩子函数，直接操作 DOM
- 使用第三方 JavaScript 动画库，如 Velocity.js

### 单元素 组件的过渡
Vue 的 transition 组件，可用于
1. 条件渲染 (使用 v-if)
2. 条件展示 (使用 v-show)
3. 动态组件
4. 组件根节点

transition 组件的处理方式
1. 使用css动画的自动添加删除css类名
2. 使用js钩子函数将在恰当和时候被调用
3. 不使用动画的将在浏览器逐帧动画的下一帧执行；

使用transition标签包裹过渡DOM元素 用name标识  
用v-if v-show 动态组件等在transition标签内控制过渡DOM元素  
过渡的DOM元素必须在transition内的根节点上
用name-enter-active 等css控制过渡过程的渲染效果

未命名的transition默认为v-xxx

### 过度动画的类名
|     |                |   |
| :-- | :------------- | :-- |
| 1.  | v-enter        | 渲染为起始状态后一帧删除 |
| 2.  | v-enter-active | 整个过渡过程 可定义曲线等 |
| 3.  | v-enter-to     | 插入后下一帧生效结束状态 |
| 4.  | v-leave        |  |
| 5.  | v-leave-active |  |
| 6.  | v-leave-to     |  |

![transition](img/QuickStart-vue/transition.png)

### css过渡
```html
<div id="example-1">
  <button @click="show = !show">
    Toggle render
  </button>
  <transition name="slide-fade">
    <p v-if="show">hello</p> <!-- @transitionend= -->
  </transition>
</div>

<script>
new Vue({
  el: '#example-1',
  data: {
    show: true
  }
})
</script>

<style>
/* 可以设置不同的进入和离开动画 */
/* 设置持续时间和动画函数 */
.slide-fade-enter-active {
  transition: all .3s ease;
}
.slide-fade-leave-active {
  transition: all .8s cubic-bezier(1.0, 0.5, 0.8, 1.0);
}
.slide-fade-enter, .slide-fade-leave-to
/* .slide-fade-leave-active for below version 2.1.8 */ {
  transform: translateX(10px);
  opacity: 0;
}
</style>
```

### css动画
使用css的 @keyframes name-in 创建动画  
在-active样式中用animation引入动画
```html
<div id="example-2">
  <button @click="show = !show">Toggle show</button>
  <transition name="bounce">
    <p v-if="show">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris facilisis enim libero, at lacinia diam fermentum id. Pellentesque habitant morbi tristique senectus et netus.</p>
  </transition>
</div>
<script>
new Vue({
  el: '#example-2',
  data: {
    show: true
  }
})
</script>
<style>
.bounce-enter-active {
  animation: bounce-in .5s;
}
.bounce-leave-active {
  animation: bounce-in .5s reverse;
}
@keyframes bounce-in {
  0% {
    transform: scale(0);
  }
  50% {
    transform: scale(1.5);
  }
  100% {
    transform: scale(1);
  }
}
</style>

```

### 定义过渡的类名
使用自定义过渡效果类名，可引用第三方动画效果  
自定义效果类名优先级高于普通的类名

- enter-class
- enter-active-class
- enter-to-class (2.1.8+)
- leave-class
- leave-active-class
- leave-to-class (2.1.8+)

```html
<link href="https://cdn.jsdelivr.net/npm/animate.css@3.5.1" rel="stylesheet" type="text/css">

<div id="example-3">
  <button @click="show = !show">
    Toggle render
  </button>
  <transition
    name="custom-classes-transition"
    enter-active-class="animated tada"
    leave-active-class="animated bounceOutRight"
  >
    <p v-if="show">hello</p>
  </transition>
</div>
```

transitionend 或 animationend 事件监听过渡或动画结束  
