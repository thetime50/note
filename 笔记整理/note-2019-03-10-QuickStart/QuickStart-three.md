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