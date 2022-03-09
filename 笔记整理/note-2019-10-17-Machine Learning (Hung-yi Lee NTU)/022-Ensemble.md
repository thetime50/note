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


给每一个train data 的 x 和 y 乘一个weight （把每一笔data 的位置随机缩放）  
(有点像VAE auto encoder 的正太随机版，VAE 是根据正态分布扩散)  
(bagging的sampling方法也像是 整数倍的weight)  

怎么train 第二个model?  
生成第一笔data --> 训练f1() --> 找到 data2 能让f1() 的错误率为50% -> 训练f2()


**adaboost**  






