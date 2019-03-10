# QuickStart-vue

[vue-en][vue-en]  
[vue-ch][vue-ch]  
[vue-en]:https://vuejs.org
[vue-ch]:https://cn.vuejs.org

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
//一般class b-value为true 

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