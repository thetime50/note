
# 计划和日志


## 第一阶段

- 现有方案分析 概念理解
- 数据预处理
    - 标准化 ??
    - [空数据处理](./ml-fund.md#空数据处理)
- 数据抓取
    - [网站](./ml-fund.md#网站)
    - 技术工具
- 数据库存储  
    - mongoDB

先打通流程 不要太关注模型效果  
先做一到3支基金的数据  
尽量减少变量 减小模型规模  

### 2022-03-23
- 现有方案分析 概念理解
- 数据预处理


### 2022-03-24

- 数据源网站选择  
    - 24h 
    - 历史累积净值
    
可能有量化交易数据库可以用  
注册都要企业信息  


### 2022-03-26
- 爬虫整理

### 2022-03-27

蛋卷 登录 cookie刷新机制  
两个网站的数据抓取 数据结构处理  
服务器 新版本ES 打包编译

- [如何在 Node.js 中打印堆栈跟踪？](https://ask.csdn.net/questions/712928)
    - var stack = new Error().stack; console.log( stack )
    - console.trace("Here I am!")
    - [node util.inspect](https://nodejs.org/api/util.html#util_util_inspect_object_options)
    - console.dir() 是有效的，可以解决引用循环的问题,但是较多的数据还是省略不显示
    - 类似浏览器的V8终端？
- 使用Tasker app 转发验证短信信息

先验证cookie  

node 编译和调试环境

node http/https 库太底层了，数据包都要直接串起来


整理接口  
基金选择 爬数据  

python csv 选型
模型结构设计  
