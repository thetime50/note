# three
- 腾讯课堂 https://ke.qq.com/user/index/index.html#/plan/cid=368612&tid=100438594&term_id=100438594  
- 教程 http://www.webgl3d.cn/Three.js/  
《three.js开发指南》

- 官网 https://threejs.org/
- github https://github.com/mrdoob/three.js

## start cuble grid

- THREE.WebGLRenderer 渲染器
  - Scene 场景
    - Mesh 网眼
      - CubeGeometry 几何体
      - MeshBasicMaterial 材质
    - (ceometry)
  - PerspectiveCamera 相机

## 1. three.js快速入门

### 1.第一个3D场景
- THREE.WebGLRenderer 渲染器
  - Scene 场景
    - Mesh 网眼
      - BoxGeometry 几何体
      - MeshLambertMaterial 材质
    - PointLight 点光源
    - AmbientLight 环境光
  - OrthographicCamera 相机

drawArrays()

### 3.鼠标操作三维场景旋转缩放
操作控件  
import "THREE/examples/js/controls/OrbitControls.js"

### 4.集合体

todo BoxGeometry and BoxBufferGeometry 表达不一样??  
辅助坐标系 AxisHelper  
几何体translateY等方法在Object基类中  

### 5.材质
```javascript
   let map=[
       (color)=>{
           return new THREE.MeshBasicMaterial({
               color: color,
               wireframe:true,//线条模式渲染
           });
       },
       //基础网格材质对象   不受光照影响  没有棱角感
       (color)=>{
           return new THREE.MeshBasicMaterial({
               color: color,
           });
       },
       // 与光照计算  漫反射   产生棱角感
       (color)=>{
           return new THREE.MeshLambertMaterial({
               color: color,
           })
       },
       // 与光照计算  高光效果（镜面反射）    产生棱角感
       (color)=>{
           return new THREE.MeshPhongMaterial({
               color: color,
               specular:0x444444,
               shininess:30,
           })
       },
   ]
```


## 2. 顶点概念、几何体结构

类型数组 https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Typed_arrays

### 1.顶点位置数据解析渲染


- THREE.Mesh
  - THREE.BufferGeometry // 几何体基类 缓冲区类型  
    (Geometry 非缓冲区类型)  
    - THREE.BufferAttribute
      - Float32Array
  - THREE.MeshBasicMaterial

### 1.2.3.汇总

geometry.attributes.position // 位置
geometry.attributes.color // 颜色
geometry.attributes.normal // 法向量

### 4.顶点索引复用顶点数据

geometry.index 属性

```javascript

    // Uint16Array类型数组创建顶点索引数据
    var indexes = new Uint16Array([
        0, 1, 2, 0, 2, 3,
    ])
    // 索引数据赋值给几何体的index属性
    geometry.index = new THREE.BufferAttribute(indexes, 1); //1个为一组
```

### 5.设置Geometry
- Geometry //对象存储 灵活易用  
  http://www.yanhuangxueyuan.com/threejs/docs/index.html#api/zh/core/BufferGeometry
- BufferGeometry //类型化数组超出 性能高  
  http://www.yanhuangxueyuan.com/threejs/docs/index.html#api/zh/core/Geometry
- Vector3  
  http://www.yanhuangxueyuan.com/threejs/docs/index.html#api/zh/math/Vector3
- color  
  http://www.yanhuangxueyuan.com/threejs/docs/index.html#api/zh/math/Color


- geometry.vertices.push
  - THREE.Vector3
- geometry.colors.push // 设置点集颜色 用于点模型 线模型渲染
  - THREE.Color

### 6.Face3对象定义Geometry的三角面


- geometry.vertices.push //顶点定义
  - THREE.Vector3
- geometry.colors.push // 颜色定义
  - THREE.Color
- geometry.faces.push
  - THREE.Face3
    -  face1.vertexNormals.push // 对每个顶点设置法向量
      - THREE.Vector3
  - THREE.Face3
    -  face2.normal //对整个面设置法向量
      -  THREE.Vector3
  - -----------
    - face2.color // 对网格模型的顶点设置颜色
      - THREE.Color
    - face1.vertexColors // 对网格模型整个面设置颜色
      - THREE.Color

### 7.访问几何体对象的数据

- geometry.faces.forEach
  - face.vertexColors
- geometry.faces.pop
- geometry.faces.shift

### 8.旋转平移缩放变换、复制、克隆
几何体旋转平移 和 网格模型旋转平移不同

- geometry.scale // 几何体xyz三个方向都放大2倍
- geometry.translate // 几何体沿着x轴平移50
- geometry.rotateX // 几何体绕着x轴旋转45度
- geometry.center // 居中：偏移的几何体居中

## 3、材质对象
### 1.常用材质介绍

主要包含顶点着色器和片元着色器

- 点材质
- 线材质
- 网格材质

### 2.材质共有属性、私有属性

```javascript
var material = new THREE.MeshPhongMaterial({
      color: 0xdd00ff,
      // wireframe:true,//将几何图形渲染为线框
      // transparent:true,//开启透明
      // opacity:0.5,//透明度0.5
      // 前面FrontSide  背面：BackSide 双面：DoubleSide
      // side:THREE.DoubleSide,
    }); //材质对象Material
console.log(material.color.r)//范围为0-1
material.color = new THREE.color(0xff00ff)
material.setRGB(0.5,0.3,.09)

```

- 共有属性
  - 渲染为线框模式
  - transparent透明
  - 显示前面 后面 双面
- 私有属性
  - 高光材质
    - 高光颜色 高光亮度
  - 点材质
    - 点尺寸
  - color材质
    - 点线网格材质都有
    - ShaderMaterial. RawShaderMaterial不具有
  - mesh
    - wirframe线框模式

## 4、模型对象
### 1.点、线、网格模型介绍

```javascript
//替换 覆盖材质 几何体

var mesh = new THREE.Mesh( geometry, material1 )

mesh.material=material2

// THREE.Line //绘制点集
// THREE.LineLoop
// THREE.LineSegments

// Three.Mesh({wirframe:true}) // 绘制面的边线

// void gl.drawArrays() //绘制方式??
```


## 4、模型对象
### 2.模型对象旋转平移缩放变换
- .clone 方法 mesh  和 geometry 是共享的  
  位置 角度 矩阵 是深拷贝的
- .copy 方法 从拉一个网格模型拷贝 位置 角度 矩阵  
  不拷贝 mesh 和 geometry