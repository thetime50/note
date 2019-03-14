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
v-on:click="$emit('enlarge-text',event)"  
$emit('enlarge-text',event)触发一个自定义的事件，在父级引用的地方绑定这个事件,并带上事件参数  
如果引用处绑定一个方法，参数会自动填充

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
使用PascalCase定义的在DOM模板中可以用PascalCase或者keybab-case引用,在字符串模板中心内用PascalCase

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

requireComponent.keys().forEach(fileName => {
  // 获取组件配置
  const componentConfig = requireComponent(fileName)
  
  //componentConfig(req) //Module模块 即import导入的效果
  //.resolve(req) 搜索相对路径转为项目相对路径
  //.keys() 匹配的模块名字列表
  //.id {String} -执行环境的id 即输入参数用在module.hot.accept



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