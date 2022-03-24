# Machine Learning 基金应用搭建

## 调研
### Machine Learning 框架调研
- taichi.js：Javascript的GPU计算框架 https://github.com/AmesingFlank/taichi.js

- openai gym https://www.gymlibrary.ml/ https://gym.openai.com/  
    - Classic control 经典控制理论环境
    - Algorithmic 算法问题环境
    - atari 雅达利游戏环境
    - mujoco 2D 3D 机器人环境
- Torch Points3D：点云深度学习统一框架 [link->](https://github.com/nicolas-chaulet/torch-points3d)
- NeutronStarLite：分布式图神经网络(GNN)训练框架  [link->](https://github.com/Wangqge/NeutronStarLite)
- Easy Parallel Library：面向大模型的高效分布式深度学习训练框架 [link->](https://github.com/alibaba/EasyParallelLibrary)
- **ZenML**：可扩展的开源MLOps框架，用于创建可用于生产的机器学习管道 [link->](https://github.com/zenml-io/zenml)





### 机器学习框架集合  
- [awesome-machine-learning](https://github.com/josephmisiti/awesome-machine-learning)
    - [js 机器学习和可视化](https://github.com/josephmisiti/awesome-machine-learning#javascript-data-analysis--data-visualization)



## 问题梳理
### 金融应用问题

神经网络技术点
1. Gan
2. LSTM
3. 图神经网络

应用框架

同类产品 应用 文献分析

金融概念 数据表达 可视化


爬虫数据
1. 基金数据
2. 基金经理数据
3. 基金组成数据
4. 公司和投资人数据
5. 大盘数据降维优化辅助策略 

docker 管理


## 章节
### 空数据处理
[机器学习中如何处理缺失数据？](https://www.zhihu.com/question/26639110)  
<s>[机器学习中处理缺失值的9种方法](https://zhuanlan.zhihu.com/p/270551105) 机翻的</s>

- 缺失较多，&gt;10% 的行或者列舍弃掉
- 缺失少的
    1. 用 NaN 填充  
        增加一个是否空值的布尔输入 维度诅咒
    2. 均值 中位数 众数 等填充
    3. 前/后数据填充
    4. 插值 前后点的平均值
    5. 删除缺失行或者列
    6. 用RFR 随机森林预测填充
    7. 使用KNN 填充

缺失数据可能和数据特征是随机的，也可能是有关的  
// todo 能不能减少缺失数据的相关性对模型的影响？   

### 网站

[股票、基金最全网站工具推荐](https://zhuanlan.zhihu.com/p/180240411)

- 基金网站
    - [**中证指数公司**](http://www.csindex.com.cn/)
    - [天天基金网](https://fund.eastmoney.com/)
    - [蛋卷基金](https://danjuanapp.com/)
    - [晨星](网http://cn.morningstar.com/main)
    - [且慢](https://qieman.com/)
<!-- - 债券网站
    - [**中国债券信息网**](https://www.chinabond.com.cn/)
    - [集思录](https://www.jisilu.cn/) -->
<!-- - 股票网站
    - [东方财富网](https://www.eastmoney.com/)
    - [同花顺财经](http://www.10jqka.com.cn/)
    - [雪球](https://xueqiu.com/) -->
- 官方财报
    - [**上海证券交易所**](http://www.sse.com.cn/)
    - [**深圳证券交易所**](http://www.szse.cn/) 
    <!-- - [巨潮资讯网](http://www.cninfo.com.cn/new/index) -->
- 国家级数据
    - [国家统计局](http://www.stats.gov.cn/tjsj/)  
        GDP、CPI、PPI、城镇就业率、各地房价、外汇储备,肉价，可以查到牲畜出栏量
    <!-- - [中国人民银行](http://www.pbc.gov.cn/)  
        降准降息等等，还有通胀利率、货币供应量等等专业数据，如果投资银行行业也可以多关注这个网站里的相关资讯。
    - [国家外汇管理局](http://www.safe.gov.cn/)  
      外汇储备、人民币汇率中间价，以及国家金融资产
    - [中华人民共和国财政部](http://www.mof.gov.cn/index.htm) -->
    - [中国证券登记结算有限公司](http://www.chinaclear.cn/)  
        新增投资者数量，目前总的投资者数量，各类证券目前的登记情况
    <!-- - [证监会](http://www.csrc.gov.cn/pub/newsite/)
    - [银保监会](http://www.cbirc.gov.cn/cn/view/pages/index/index.html) -->
<!-- - 实用工具
    - [银行定期利率查询](https://bank.cngold.org/yhckll/)
    - [中国理财网](https://www.chinawealth.com.cn/zzlc/index.shtml)
    - [中财网数据中心](http://data.cfi.cn/cfidata.asp) -->


上证综指  
深证综指  
沪深300  
深证成指  
创业板指  
上证50  
科创50  


