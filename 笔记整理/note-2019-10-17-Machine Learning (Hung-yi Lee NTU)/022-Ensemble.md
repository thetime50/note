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

### adaboost  

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

### Boosting 推导

1式 <img src="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}H(x)&space;=&space;sign(\textstyle\sum_{t=1}^T&space;\alpha_t&space;f_t(x))" title="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}H(x) = sign(\textstyle\sum_{t=1}^T \alpha_t f_t(x))" />  
2式 <img src="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}\alpha_1=ln{\sqrt{(1-\varepsilon_1)/\varepsilon_1}&space;}" title="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}\alpha_1=ln{\sqrt{(1-\varepsilon_1)/\varepsilon_1} }" />



H(x) 的error rate 为  
<img src="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}loss=&space;\frac{1}{N}&space;\sum_n&space;\delta(H(x^n)\neq&space;\hat{y}^n)" title="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white} loss= \frac{1}{N} \sum_n \delta(H(x^n)\neq \hat{y}^n)" />

令<img src="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}g(x)=\textstyle&space;\sum_{t=1}^T&space;\alpha_t&space;f_t(x)" title="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}g(x)=\textstyle \sum_{t=1}^T \alpha_t f_t(x)" /> 即H(x) 符号函数 sign()里面那项 用 *-1来解决 y&#770; 和 f(x) 是否相同的问题

<img src="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}loss=\frac{1}{N}\sum_n\delta(\hat{y}^n&space;g(x^n)<0)" title="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}loss=\frac{1}{N}\sum_n\delta(\hat{y}^n g(x^n)<0)" />

把上面1式的&alpha;带入

<img src="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}\leq\frac{1}{N}\sum_n&space;exp(-\hat{y}^n&space;g(x^n))&space;" title="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}\leq\frac{1}{N}\sum_n exp(-\hat{y}^n g(x^n)) " /> 即upper bound


d -> &delta; -> &alpha; 

<img src="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}Z_t&space;=&space;\sum&space;d_t^n" title="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}Z_t = \sum d_t^n" />

3式 <img src="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}Z_{T&plus;1}=\sum_n&space;u_{T&plus;1}^n\" title="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}Z_{T+1}=\sum_n u_{T+1}^n\" />

4式 <img src="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}\left.\begin{matrix}u_1^n&space;=&space;1\\u_{t&plus;1}^n&space;=&space;u_t^n&space;\times&space;exp(-\hat{y}^nf_t(x^n)\alpha_t)\end{matrix}\right\}&space;u_{T&plus;1}^n=\prod_{t=1}^{T}&space;exp(-\hat{y}^nf_t(x^n)\alpha)" title="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}\left.\begin{matrix}u_1^n = 1\\u_{t+1}^n = u_t^n \times exp(-\hat{y}^nf_t(x^n)\alpha_t)\end{matrix}\right\} u_{T+1}^n=\prod_{t=1}^{T} exp(-\hat{y}^nf_t(x^n)\alpha)" />

这个大门符号表示嵌套运算？？？

把4式代入3式  
<img src="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}\\Z_{T&plus;1}=\sum_n\prod_{t=1}^{T}&space;exp(-\hat{y}^nf_t(x^n)\alpha)\\=\sum_n&space;exp(-\hat{y}^n\sum_{t=1}^T&space;f_t(x^n)\alpha_t)\\=\sum_n&space;exp(-\hat{y}^n&space;g(x))" title="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}\\Z_{T+1}=\sum_n\prod_{t=1}^{T} exp(-\hat{y}^nf_t(x^n)\alpha)\\=\sum_n exp(-\hat{y}^n\sum_{t=1}^T f_t(x^n)\alpha_t)\\=\sum_n exp(-\hat{y}^n g(x))" />


train data 的weight 和 和error 的 upper bound 有关  
现在要证明weight的和会越来越小  

<img src="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}\\Z_1&space;=&space;N\\Z_t&space;=&space;Z_{t-1}\varepsilon_t&space;exp(\alpha_t)&space;&plus;&space;Z_{t-1}(1-\varepsilon_t)exp(-\alpha_t)" title="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}\\Z_1 = N\\Z_t = Z_{t-1}\varepsilon_t exp(\alpha_t) + Z_{t-1}(1-\varepsilon_t)exp(-\alpha_t)" />

第一项表示分类错误的数据，第二项表示分类正确的部分 &epsilon;就是error rate  
带入 &epsilon; 得到  
<img src="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}\\=Z_{t-1}\varepsilon_t\sqrt{(1-\varepsilon_t)/\varepsilon_t}&space;&plus;&space;Z_{t-1}(1-\varepsilon_t)\sqrt{\varepsilon_t/(1-\varepsilon_t)}\\=Z_{t-1}\times&space;2\sqrt{\varepsilon_t(1-\varepsilon_t)}&space;" title="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}\\=Z_{t-1}\varepsilon_t\sqrt{(1-\varepsilon_t)/\varepsilon_t} + Z_{t-1}(1-\varepsilon_t)\sqrt{\varepsilon_t/(1-\varepsilon_t)}\\=Z_{t-1}\times 2\sqrt{\varepsilon_t(1-\varepsilon_t)} " />


因为后面的 <img src="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}2\sqrt{\varepsilon_t(1-\varepsilon_t)}&space;" title="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}2\sqrt{\varepsilon_t(1-\varepsilon_t)} " />比1小 所以 Z<sub>t</sub> 会比 Z<sub>t-1</sub> 小  

<img src="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}Z_{t&plus;1}=M\prod_{t=1}^{T}2\sqrt{\varepsilon_t(1-\varepsilon_t)}" title="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}Z_{t+1}=M\prod_{t=1}^{T}2\sqrt{\varepsilon_t(1-\varepsilon_t)}" />


**adaboost 特性** 在train data上总和的 error rate变为0后继续学习在 test data上的error rate还会下降  
adaboost 假设tain 的弱模型没有办法让error rate变0，否则会计算出错

<img src="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}u_{t&plus;1}^n&space;\leftarrow&space;u_t^n&space;\times&space;&space;exp(-\hat{y}^nf_t(x^n)\alpha_t)" title="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}u_{t+1}^n \leftarrow u_t^n \times exp(-\hat{y}^nf_t(x^n)\alpha_t)" /> 不断迭代可以让数据分布更远离边界（类似SVM的效果）  

**adaboost Decision Tree**


### Gradient Boosting

相比于adaboost，gradient boosting 会在每一步的f(x)都加上之前model 的总和。

找到 f<sub>t</sub>(x) &alpha;<sub>t</sub> 改善 g<sub>t-1</sub>(x)

<img src="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}\\g_{t-1}(x)=\textstyle&space;\sum_{i=1}^{t-1}\alpha_if_i(x)\\g_t(x)=g_{t-1}(x)&plus;\alpha_t&space;f_t(x)\\Output:&space;H(x)&space;=&space;sign(g_T(x))&space;" title="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}\\g_{t-1}(x)=\textstyle \sum_{i=1}^{t-1}\alpha_if_i(x)\\g_t(x)=g_{t-1}(x)+\alpha_t f_t(x)\\Output: H(x) = sign(g_T(x)) " />

怎么更新 f<sub>t</sub>(x) &alpha;<sub>t</sub>?   

<img src="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}L(g)=\sum_n&space;l(\hat({y}^n,g(x^n))=\sum_n&space;exp(-\hat{y}^n&space;g(x^n))" title="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}L(g)=\sum_n l(\hat({y}^n,g(x^n))=\sum_n exp(-\hat{y}^n g(x^n))" />

也可以用 Gradient Descent 来算

<img src="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}g_t&space;\leftarrow&space;&space;g_{t-1}&space;-&space;\eta&space;\left.\begin{matrix}\frac{\partial&space;L(g)&space;}{\partial&space;g}\end{matrix}\right|_{g=g_{t-1}}" title="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}g_t \leftarrow g_{t-1} - \eta \left.\begin{matrix}\frac{\partial L(g) }{\partial g}\end{matrix}\right|_{g=g_{t-1}}" />

用loss function 对 函数g 的偏微分来更新g,（对函数g的参数，整理的参数就是每个train data 乘的系数）  

<img src="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}g_t(x)&space;\leftarrow&space;g_{t-1}(x)&space;&plus;&space;\alpha_tf_t(x)" title="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}g_t(x) \leftarrow g_{t-1}(x) + \alpha_tf_t(x)" />

希望 &alpha;<sub>t</sub>f<sub>t</sub>(x) 和上面 Gradient 的梯度项 反向是一样的

要让左边的bossting 项 和右边的gradient 项反向越一致越好  
<img src="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}f_t(x)&space;\Leftrightarrow&space;\sum_n&space;exp(-\hat(y)^n&space;g_t(x^n))(\hat(y)^n)" title="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}f_t(x) \Leftrightarrow \sum_n exp(-\hat(y)^n g_t(x^n))(\hat(y)^n)" />

就是要两式相乘大于0  
<img src="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}\sum_n&space;exp(-\hat(y)^n&space;g_t(x^n))(\hat(y)^n)&space;f_t(x)&space;" title="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}\sum_n exp(-\hat(y)^n g_t(x^n))(\hat(y)^n) f_t(x) " />

即希望 <img src="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}(\hat(y)^n)&space;f_t(x)&space;" title="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}(\hat(y)^n) f_t(x) " /> 同号， 前面的是一个weight： <img src="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}u_t^n" title="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}u_t^n" />

<img src="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}u_t^n&space;=&space;exp(-\hat{y}^n&space;g_{t-1}(x^n))&space;=&space;exp(-\hat{y}^n&space;\sum_{i=1}^{t-1}\alpha_i&space;f_i(x^n))=\coprod_{i=1}^{t-1}&space;exp(-\hat{y}^n&space;\alpha_i&space;f_i(x^n))" title="https://latex.codecogs.com/gif.image?\dpi{110}\bg{white}u_t^n = exp(-\hat{y}^n g_{t-1}(x^n)) = exp(-\hat{y}^n \sum_{i=1}^{t-1}\alpha_i f_i(x^n))=\coprod_{i=1}^{t-1} exp(-\hat{y}^n \alpha_i f_i(x^n))" />

adabossting 这里面的 weak classifier f<sub>t</sub> 就是 gradient descent 里的负的 gradient  
  
在做 adabossting 时，每次获取f<sub>t</sub> 都要做一次Gradient Descent 的iteration过程。所以要在得到一个f<sub>t</sub> 后，固定 f<sub>t</sub>， 找到最好的 learning rate &alpha;<sub>t</sub>



![022-find-alpha-t](./img/022-find-alpha-t.jpg)


可以定其他的 <u>Objective Function</u> 创造不一样 Bosting 的方法。

exp(-y&#770; * g(x))


### Stacking 

结合独立train 出来的而不同model , Majority Vote(多数投票)

或者 再把所有model 的output 接到一个 Classifier model 上 , 但是要把train data分一部分只用作 final classifier 的train data。因为前面的模型可能只是做 fit training data,能够检测出前面overfitting的情况 减少权重。
