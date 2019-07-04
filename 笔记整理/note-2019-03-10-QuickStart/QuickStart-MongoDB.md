# QuickStart-MongoDB
[link](https://www.runoob.com/mongodb/nosql.html)

## 数据库简介
MongoDB是非关系型数据库(NoSQL Not-Only-SQL 不仅仅是SQL)  
RDMBS 关系型数据库

### 关系型数据库ACID规则
1. A(Atomicity)原子性  
增删改查为原子操作，结果为成功/失败，不存在在中间状态
2. C(Consistency)  
关联的数据同步改变
3. I(Isolation)独立性  
不同的操作不会互相影响
4. D(Durability)持久  
事务提交后宕机不丢失

### 分布式系统
内聚性和透明性??

优点
- 可靠(容错)  
一台出错不会影响其它服务器
- 可扩展
- 资源共享
- 灵活
- 处理更快速
- 开放系统  
远程访问
- 高性能

缺点
- 排除故障困难
- 软件支持较少
- 受网络影响
- 安全问题

### NoSQL
NoSQL用于超大规模数据存储，不需要固定的模式方便横向扩展

对比 RDBMS vs NoSQL

RDBMS
- 高度组织化结构化数据
- 结构化查询语言(SQL)
- 数据 关系都存储在单独的表中
- 数据操纵语言，数据定义语言
- 严格的一致性
- 基础事务

NoSQL
- 不仅仅是SQL
- 没有声明性查询语言??
- 没有预定义的模式
- key-value存储、列存储、文档存储、图形数据库
- 最终一致性??
- 非结构化不可预知的数据??
- CAP定理
- 高性能高可用??可扩展

### CAP定理
分布式系统不可能同时满足这三点
- 一致性(Consistency) (所有节点在同一时刻都有系统数据)
- 可用性(Availability) (保证成功和失败都有响应)
- 分隔容错(Partition tolerance) (系统中信息丢失或失败不影响运行)

3种模式
- CA 一致可用 单点集群(单点怎么集群??)，扩展性不强
- CP 一致容错 性能不高
- AP 可用容错 一致性不高

业务上如何处理这3种类型

优点
- 高可扩展性
- 分布式计算
- 低成本
- 架构的灵活性，半结构化数据
- 没有复杂的关系

缺点
- 没有标准化
- 有限的查询功能（到目前为止）
- 最终一致是不直观的程序

### BASE原则
BASE NoSQL数据库对可用性 一致性的弱要求原则
- Basically Availble --基本可用
- Soft-state --软状态/柔性事务。  
"Soft state" 可以理解为"无连接"的, 而 "Hard state" 是"面向连接"的
- Eventual Consistency -- 最终一致性， 也是是 ACID 的最终目的。

### NoSQL 数据库分类

列存储 文档存储 key-value存储 图存储 对象存储 xml数据库

[NoSQL 数据库分类](https://www.runoob.com/mongodb/nosql.html#NoSQL-数据库分类)

## MongoDB 简介
数据由key=>value组成，存储为文档，value可以是文档/数组等

特点
- 记录中设置属性索引排序
- 通过本地或者网络创建数据镜像扩展
- 分布式、分担负载
- 用json形式标记的查询指令
- updata替换文档/字段
- Map/reduce 批量处理/聚合
- Map调用emit(key,value)遍历记录，传给reduce处理
- 用db.runCommand/mapreduce执行命令
- GridFS存放小文件
- 服务端存储/执行脚本

### mongoDB工具
内置Munin 系统/网络监控工具  
内置Gangila 系统监视工具  
Cacti 查看cpu负载/带宽利用率/监控MongoDB插件

GUI
- Fang of Mongo 网页式
- Mongo3 – Ruby