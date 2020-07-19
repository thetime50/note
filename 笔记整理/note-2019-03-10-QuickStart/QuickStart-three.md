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