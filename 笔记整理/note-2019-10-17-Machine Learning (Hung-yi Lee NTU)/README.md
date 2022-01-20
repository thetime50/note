
# note-2019-10-17-Machine Learning (Hung-yi Lee NTU)

youtobe: https://www.youtube.com/watch?v=CXgbekl66jc&list=PLJV_el3uVTsPy9oCRY30oBPNLCo89yu49  
課程網頁: http://speech.ee.ntu.edu.tw/~tlkagk/courses_ML17_2.html  
https://pan.baidu.com/s/1Shjn2el7gr3RPNlUTnBtxw  
bili: https://www.bilibili.com/video/av65521101/?p=1  

***tool***  
codecogs: https://www.codecogs.com/latex/eqneditor.php  
codecogs help: https://en.wikipedia.org/wiki/Help:Displaying_a_formula

## 001
- [file link ->](./001.md)
- [0-1 Introduction of Machine Learning](./001.md#0-1 Introduction-of-Machine-Learning)
- [0-2 Why we need to learn machine learning?](./001.md#0-2-Why-we-need-to-learn-machine-learning?)
- [1 回归 - 案例研究](./001.md#ML讲座1-回归---案例研究)
- [1 Regression - Demo](./001.md#1-Regression---Demo)

## 002
- [file link ->](./002.md)
- [2 Where does the error come from?](./002.md#2-Where-does-the-error-come-from)

## 003
- [file link ->](./003.md)
- [3-1 Gradient Descent](./003.md#3-1-Gradient-Descent)
- [3-2 Gradient Descent (Demo by AOE)](./003.md#3-2-Gradient-Descent-Demo-by-AOE)
- [3-3 Gradient Descent (Demo by Minecraft)](./003.3-3-Gradient-Descent-Demo-by-Minecraft)

## 004
- [file link ->](./004.md)
- [4 Classification](./004.md#4-Classification)

从高斯分布分析分类问题

## 005
- [file link ->](./005.md)
- [5 Logistic Regression](./005.md#5-Logistic-Regression)

从概率问题分析分类问题

## 006
- [file link ->](./006.md)
- [6 Brief Introduction of Deep Learning](./006.md#6-Brief-Introduction-of-Deep-Learning)

## 007
- [file link ->](./007.md)
- [7 Backpropagation](./007.md#7-Backpropagation)

## 008
- [file link ->](./008.md)
- [8-1 Hello world of deep learning](./008.md#8-1-Hello-world-of-deep-learning)
- [8-2 Keras 2-0](./008.md#8-2-Keras-2-0)
- [8-3 Keras Demo](./008.md#8-3-Keras-Demo)


## 009
- [file link ->](./009.md)
- [9-1 Tips for Training DNN](./009.md#9-1-Tips-for-Training-DNN)
- [9-2 Keras Demo 2](./009.md#9-2-Keras-Demo-2)
- [9-3 Fizz Buzz in Tensorflow (sequel)](./009.md#9-3-Fizz-Buzz-in-Tensorflow-(sequel))

## 010
10 Convolutional Neural Network
- [file link ->](./010.md)
- [10 Convolutional Neural Network](./010.md#10-Convolutional-Neural-Network)

### 011
11 Why Deep
- [file link ->](./011.md)
- [11 Why Deep](./011.md#11-Why-Deep)

### 012
12 Semi-supervised
- [file link ->](./012.md)
- [12 Semi-supervised](./012.md#12-Semi-supervised)



## 整理

// 输入数据类型 处理方式

多输出处理

| 问题 | 描述 | 分布模型 | 输出数据处理 | loss |
| :--- | :--- | :--- | :--- | :--- |
| Linear Regression | 一层的线代函数运算 连续数值输出 | wx+b | | 方差 mean_squared_error |
| Classification | 分类输出 | 分别计算两输出分类的高斯模型 纯概率发布问题 | >0.5 | \  |
| Logistic Regression | 一层的线代函数运算加s函数处理 将输出转换为0-1的概率值 | &sigma;(wx+b)) | &sigma;()<br> Sigmoid function |  <img src="https://latex.codecogs.com/gif.latex?\bg_white&space;L(w,b)=f_{w,b}(x^1)f_{w,b}(x^2)(1-f_{w,b}(x^3))...f_{w,b}(x^N)" title="L(w,b)=f_{w,b}(x^1)f_{w,b}(x^2)(1-f_{w,b}(x^3))...f_{w,b}(x^N)" /> 交叉熵 binary_crossentropy |
| Multi-class | 多分类 | --- | <img src="https://latex.codecogs.com/gif.image?\dpi{110}&space;\bg_white&space;y_1&space;=&space;e^{Z_1}/\sum_{j=1}^{3}e^{Z_j}" title="\bg_white y_1 = e^{Z_1}/\sum_{j=1}^{3}e^{Z_j}" /> Shoftmax | --- |


