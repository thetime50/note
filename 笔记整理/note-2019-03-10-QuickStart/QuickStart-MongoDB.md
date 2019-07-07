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

### 安装
[link win->](https://www.runoob.com/mongodb/mongodb-window-install.html)
[link linux->](https://www.runoob.com/mongodb/mongodb-linux-install.html)

### 创建数据库
在根目录下创建数据库文件夹data/db  
在MongoDB安装目录内(mongodb\bin)运行 mongod --dbpatch D:\data\db 设置数据库路径  
运行nongo.exe 连接数据库

**配置mongo服务**  
创建文件夹\data\db \data\log  
安装目录下创建配置文件\mongodb\mongod.cfg  
```
systemLog:
    destination: file
    path: e:\data\log\mongod.log
storage:
    dbPath: e:\data\db
```
nongod.exe --config "e:\mongodb\mongod.cfg" --install

```
如果需要，您可以安装 mongod.exe 或 mongos.exe 的多个实例的服务。只需要通过使用 --serviceName 和 --serviceDisplayName 指定不同的实例名。只有当存在足够的系统资源和系统的设计需要这么做。

反正就是可以安装多个实例
用--serviceName --serviceDisplayName 指定实例名称
mongod.exe和mongos.exe有什么区别??
```

```
//启动服务
net start MongoDB

//关闭服务
net stop MongoDB

//移除服务
mongod.exe --remove
```

### 后台管理shell
```
// bin下执行mongo 进入mongo shell

//运算
1+1

//查看文档
db

//插入记录 查询
db.runoob.inseert({x:10})
db.runoob.find()

```

### MongoDB概念

| SQL术语      | MongoDB术语  | 说明                       |
| :----------- |:----------- |:----                       |
| database     | database    | 数据库                     |
| table        | collection  | 数据库表/集合               |
| row          | document    | 数据记录/文档               |
| column       | field       | 数据列/字段/域              |
| index        | index       | 索引                        |
| tale joins   |             | 表连接 MongoDB不支持         |
| primary key  | primary key | 主键 MongoDB自动把_id设为主键 |

### 数据库
数据默认数据库为db，在data目录中  
一个MongoDB实例可以有多个数据库  
每个数据库有独立的集合 权限 可以在不同目录

- show dbs 显示所有数据库列表
- db 显示当前数据库集合(对象)
- use xx 连接到数据库

**数据库命名规则**
- 不能是空字符串
- 不含有' ', '.', '$', '/', '\', '\0'
- 全小写
- 最大64字节
- '_'开头有特定含义

- 特殊作用的保留字符  
  - admin 'root'根权限数据库，添加到此数据库的用户继承所有数据库的权限，能运行特殊服务器端命令(列出所有数据库、关闭服务器)
  - local 数据不会被复制，用来存限于本地单台服务器的集合
  - config 内部使用，保存分片设置的信息

### 文档
用来保存一组key-value  
MongoDB不要求设置相同的字段，同字段不要求相同的类型

| RDBMS | MongoDB  |
| :---- |:-------- |
| 数据库 | 数据库   |
| 表格   | 集合     |
| 行     | 文档     |
| 列     | 字段     |
| 表联合 | 嵌入文档  |
| 主键   | 主键 (MongoDB 提供了 key 为 _id ) |

命令行工具
|        | RDBMS          | MongoDB  |
| :----  | :----          |:-------- |
| 服务端: | Mysqld/Oracle  | mongod   |
| 客户端: | mysql/sqlplus  | mongo    |

- 文档的 key-value 是有序的
- 值可以是带双引号的字符串和其他数据类型 可以嵌入文档
- 区分类型和大小写
- 不能有重复的key
- 除了少数情况，key可以使用UTF-8

### 集合
不同的集合数据和结构可以不同

命名规则基本同上，不能以system.开头，不能包含保留字符

### capped collection
限制集合 固定大小的collection  
高性能 队列过期(按插入顺序) 类似"RRD"  
自动维护对象插入入顺序，适合记录日志  

capped collection内保存的文档和文档在磁盘上的位置由插入顺序决定，通过插入顺序而不是index确定位置  
需要显式的创建capped collection ，指定字节大小分配空间，保证磁盘上的存储位置不变  

```
db.createcCollection("mycoll",{capped:true,size:100000})
```

- 能够添加对象
- 跟新对象，如果更新会增加存储那么更新失败
- 可以用drop()删除所有行，但是不能删除文档
- 删除后必须显式的重新创建这collection
- 32位系统capped collection 最大存储1e9字节

### 元数据
数据库的信息存储在system集合中
```
dbname.system.*
```
| 集合命名空间 | 描述 |
| :---- | :---- |
| dbname.system.namespaces | 列出所有命名空间 |
| dbname.system.indexes    | 列出所有索引 |
| dbname.system.profile    | 数据库概要(profile)信息 |
| dbname.system.name       | 可访问的用户 |
| dbname.system.source     | 复制对端(slave)的服务器信息和状态 |

**修改系统集合对象的限制**
- {{system.indexes}}插入数据可以创建索引，除indexes之外的信息是不可变的(drop index命令会自动更新相关信息)  
- ??(system应该是表/集合，上面说除此之外该表信息不可变，下面又说users profile是可变的)
- {{systym.users}}可修改，systym.profile可删除

### 数据类型


## 创建集合
```
db.createCollection(name,options)
```


| 数据类型 | 描述 |
| :---- | :---- |
| String | 字符串 UTF-8 编码 |
| Integer | 整型数值 跟随系统32 位或 64 位 |
| Boolean | 布尔值 |
| Double | 双精度浮点值 |
| Min/Max keys | 将一个值与 BSON（二进制的 JSON）元素的最低值和最高值相对比 |
| Array | 数组 列表或多个值 |
| Timestamp | 时间戳 文档修改或添加时间 |
| Object | 内嵌文档 |
| Null | 创建空值 |
| Symbol | 符号 基本等同于字符串，但它一般用于采用特殊符号类型的语言 |
| Date | 日期时间 用 UNIX 时间格式 |
| Object ID | 对象 ID 用于创建文档的 ID |
| Binary Data | 二进制数据 |
| Code | 代码类型 JavaScript 代码 |
| Regular expression | 正则表达式 |

- objectid
MongoDB必须有_id键，默认为Objectid对象  
  - 4byte unix UTC时间戳
  - 3byte 机器标识码
  - 2byte PID 进程id
  - 3byte 随机数

![objectid.jpg](img/QuickStart-MongoDB/objectid.jpg)

```
var newObject= ObjectId()
newObject.getTimestamp()//获取时间戳
newObject.str //16进制字符串
```

- 时间戳
  - 32位 unix time_t值
  - 32位递增序列

  复制集中ts字段使用BSON时间戳表示操作时间

- 日期  
  Unix格式
  new Date()  或 ISODate()