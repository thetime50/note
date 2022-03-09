## 022-Ensemble

[022-Ensemble](https://www.youtube.com/watch?v=tH9FH1DH5n0&list=PLJV_el3uVTsPy9oCRY30oBPNLCo89yu49&index=32)  
[pdf](http://speech.ee.ntu.edu.tw/~tlkagk/courses/ML_2016/Lecture/Ensemble%20(v6).pdf)


团队合作 好几个模型一起上


多个 Classifier model 一起使用


### Bagging
解决overfitting问题

自己制造不同的data set??

从N笔data中可重复的抽取 N'笔数据生成新的data set （可以是N'=N）
这样得到几个模型，Testing 的时候，把x 通过每个模型得到output,然后做 Average/voting  

更 robust 不容易 overfitting  

regression -> Average  
classification -> voting   

<u>model 很复杂 容易overfitting，bias 很小 variance 很大</u>

Decidion Tree 很容易 overfitting，Random Forest 就是 Decision Tree 做Bagging 的版本  

**Decision Tree** 在每一个节点用一个数值判断产生分支 (有点像K-means 的感觉??)  
每个节点多少分支
用什么样的criterion做分支  
什么时候停止  

Random Forest 是在每一次产生branch 的时候都随机的决定哪一些feature 或问题是不用的。train 出多尔 Decision Tree 后再把他们的结果集合起来  


**out-of-bag** 可以不用把data 分为 training set 和 validation set，在Bagging中，可以把没有用到某一个data 的model bagging其来 作为test。


### Boosting
解决数据不足，模型匹配能力不足问题  
可以让50%错误率的模型组合起来，错误率为0  

按顺序train n 个 classifier model 每一个模型都和前一个是互补的  

相当于是用多个小模型来处理问题，每一个小模型都是能力不足不会overfitting的  


对于一个 ***classifier 的问题***  
给每一个train data 的 x <!--和 y--> 乘一个weight （把每一笔data 的位置随机缩放）  
(有点像VAE, auto encoder 的正太随机版，VAE 是根据正态分布扩散)  
(bagging的sampling方法也像是 整数倍的weight)  

怎么train 第二个model?  
生成第一笔data --> 训练f1() --> 找到 data2 能让f1() 的错误率为50% -> 训练f2()

初始化 weight 为 1

**adaboost**  

<!--对加工过的 training data 做 error function 的偏微分。-->记 f<sub>1</sub>在training data 的 error rate 为 &epsilon;<sub>1</sub>，  &epsilon;<sub>1</sub> = L<sub>f<sub>1</sub> | data 1</sub>

<img src="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}\varepsilon&space;_1&space;=&space;\frac{\sum_n&space;u_1^n&space;\delta(f_1(x^n)\neq&space;\hat{y}^n)}{Z_1}" title="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}\varepsilon _1 = \frac{\sum_n u_1^n \delta(f_1(x^n)\neq \hat{y}^n)}{Z_1}" />

<img src="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}u_1^n" title="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}u_1^n" /> 是每一笔data 的weight  

classifier问题 在计算loss 时，要给每一个data 的loss 乘上对应那笔数据的 weight

<img src="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}Z_1&space;=&space;\sum_n&space;u_1^n" title="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}Z_1 = \sum_n u_1^n" />

然后除以weight 的总和做 normalization

然后<!-- 对 error function 做 training data 的 weight 的偏微分，-->调整 weight 找到 u<sub>2</sub> 让 f<sub>1</sub>的结果是烂的, 也就是让&epsilon;<sub>2</sub> => 0.5

感觉就像在反向/描边

找到参数 d<sub>1</sub> (d<sub>1</sub> &gt; 1)

如果第n笔data 的结果 f<sub>1</sub>(x) 是<u>错</u>的 就让weight增大继续错  
u<sub>2</sub> = u<sub>1</sub> * d<sub>1</sub> 

如果第n笔data 的结果 f<sub>1</sub>(x) 是<u>对</u>的 就让weight减小 变对  
u<sub>2</sub> = u<sub>1</sub> / d<sub>1</sub> 

这时候 错误的数据一部分来自 之前的错误数据，一部分来自之前正确乘上d<sub>1</sub> 后变成错误的数据

<img src="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}\frac{\sum_{{f_1}(x^n)\neq&space;\hat{y}^n}&space;u_1^n&space;d_1}{\sum_{{f_1}(x^n)\neq&space;\hat{y}^n}&space;u_1^n&space;d_1&space;&plus;&space;\sum_{{f_1}(x^n)&space;=&space;\hat{y}^n}&space;u_1^n&space;/&space;d_1}&space;=&space;0.5" title="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}\frac{\sum_{{f_1}(x^n)\neq \hat{y}^n} u_1^n d_1}{\sum_{{f_1}(x^n)\neq \hat{y}^n} u_1^n / d_1 + \sum_{{f_1}(x^n) = \hat{y}^n} u_1^n d_1} = 0.5" />

<img src="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}\frac{\sum_{{f_1}(x^n)\neq&space;\hat{y}^n}&space;u_1^n&space;d_1&space;&plus;&space;\sum_{{f_1}(x^n)&space;=&space;\hat{y}^n}&space;u_1^n&space;/&space;d_1}{\sum_{{f_1}(x^n)\neq&space;\hat{y}^n}&space;u_1^n&space;d_1}&space;=&space;2" title="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}\frac{\sum_{{f_1}(x^n)\neq \hat{y}^n} u_1^n d_1 + \sum_{{f_1}(x^n) = \hat{y}^n} / u_1^n d_1}{\sum_{{f_1}(x^n)\neq \hat{y}^n} u_1^n d_1} = 2" />

<img src="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}\frac{\sum_{{f_1}(x^n)&space;=&space;\hat{y}^n}&space;u_1^n&space;/&space;d_1}{\sum_{{f_1}(x^n)\neq&space;\hat{y}^n}&space;u_1^n&space;d_1}&space;=&space;1" title="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}\frac{\sum_{{f_1}(x^n) = \hat{y}^n} u_1^n / d_1}{\sum_{{f_1}(x^n)\neq \hat{y}^n} u_1^n d_1} = 1" />


<img src="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}\sum_{{f_1}(x^n)&space;=&space;\hat{y}^n}&space;u_1^n&space;/&space;d_1=\sum_{{f_1}(x^n)\neq&space;\hat{y}^n}&space;u_1^n&space;d_1" title="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}\sum_{{f_1}(x^n) = \hat{y}^n} u_1^n / d_1=\sum_{{f_1}(x^n)\neq \hat{y}^n} u_1^n / d_1" />

<img src="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}\because&space;\varepsilon_1&space;=&space;\frac{\sum_{{f_1}(x^n)\neq&space;\hat{y}^n}&space;u_1^n}{Z_1}" title="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}\because \varepsilon_1 = \frac{\sum_{{f_1}(x^n)\neq \hat{y}^n} u_1^n}{Z_1}" />

<img src="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}\\\therefore&space;&space;Z_1(1-\varepsilon_1)/d_1&space;=&space;Z_1\varepsilon_1d_1&space;\\&space;&space;d_1=\sqrt{(1-\varepsilon_1)/\varepsilon_1}&space;>&space;1" title="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}\\\therefore Z_1(1-\varepsilon_1)/d_1 = Z_1\varepsilon_1d_1 \\ d_1=\sqrt{(1-\varepsilon_1)/\varepsilon_1} > 1" />
<br>
<br>
或者表示为  
<img src="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}\alpha_1=ln{\sqrt{(1-\varepsilon_1)/\varepsilon_1}&space;}" title="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}\alpha_1=ln{\sqrt{(1-\varepsilon_1)/\varepsilon_1} }" />

这样 对于结果正确的data  
<img src="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}u_{t&plus;1}^n&space;=&space;u_t^n&space;\times&space;d_t&space;=&space;u_t^n&space;\times&space;exp(\alpha_t)" title="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}u_{t+1}^n = u_t^n \times d_t = u_t^n \times exp(\alpha_t)" />

对于结果错误的data  
<img src="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}u_{t&plus;1}^n&space;=&space;u_t^n&space;\times&space;/&space;d_t&space;=&space;u_t^n&space;\times&space;exp(-\alpha_t)" title="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}u_{t+1}^n = u_t^n \times / d_t = u_t^n \times exp(-\alpha_t)" />

最终  
<img src="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}u_{t&plus;1}^n&space;\leftarrow&space;u_t^n&space;\times&space;&space;exp(-\hat{y}^nf_t(x^n)\alpha_t)" title="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}u_{t+1}^n \leftarrow u_t^n \times exp(-\hat{y}^nf_t(x^n)\alpha_t)" />



反复运算得到T 个 classifier model ,增加拿所有模型的结果加起来判断正负就行  
<img src="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}H(x)&space;=&space;sign(\sum_{t=1}^T&space;\alpha_t&space;f_t(x))" title="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}H(x) = sign(\sum_{t=1}^T \alpha_t f_t(x))" />

错误率 &epsilon;<sub>t</sub> 越小，得到的 &alpha;<sub>t</sub> 就越大，也就是越烂的模型权重越小。&alpha;<sub>t</sub>可以理解为正确率/好模型率

decision stump (决策柱？？)

重点就是拿到准确率高的模型的weght


// todo Math 58'' 

