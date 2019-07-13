# QuickStart-MongoDB
[link](https://www.runoob.com/mongodb/nosql.html)

```
e:
cd 'E:\Program Files\MongoDB\Server\4.0\bin'
./mongo shell
```

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
- update()替换文档/字段
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
在MongoDB安装目录内(mongodb\bin)运行 mongod --dbpath D:\data\db 设置数据库路径  
运行mongo.exe 连接数据库

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
db.runoob.insert({x:10})
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

## 连接
在MongoDB安装目录bin下运行mongodb启动服务(*之前不是说运行mongod么*)

使用mongodb shell连接服务
URL语法
```
mongodb://[username:password@]host1[:port1][,host2[:port2],...[,hostN[:portN]]][/[database][?options]]
```
- mongodb:// 协议
- username:passworld@ 用户 密码
- hostx 连接服务器/复制集地址
- portx 指定端口
- /database 指定连接的数据库 默认位test
- ?options (/?options)连接选项name=value& 或name=value;

- replicaSet=name	验证replica set的名称。 Impliesconnect=replicaSet.
- slaveOk=true|false	
  - true:
    - connect=direct 驱动会连接第一台机器，即使这台服务器不是主服务器
    - 在connect=replicaSet模式下，驱动会发送所有的写请求到主并且把读取操作分布在其他从服务器。
  - false:
    - connect=direct 驱动会自动找寻主服务器
    - connect=replicaSet 驱动仅仅连接主服务器，并且所有的读写命令都连接到主服务器。
- safe=true|false
  - true: 在执行更新操作之后，驱动都会发送getLastError命令来确保更新成功。(还要参考 wtimeoutMS).
- w=n	驱动添加 { w : n } 到getLastError命令. *应用于safe=true*。
- wtimeoutMS=ms	驱动添加 { wtimeout : ms } 到 getlasterror 命令. *应用于 safe=true*.
- fsync=true|false true: 驱动添加 { fsync : true } 到 getlasterror 命令.*应用于 safe=true*.
- journal=true|false	如果设置为 true, 同步到 journal (在提交到数据库前写入到实体中). *应用于 safe=true*
- connectTimeoutMS=ms	可以打开连接的时间。
- socketTimeoutMS=ms	发送和接受sockets的时间。

```
mongodb://localhost
```

## 创建数据库
- use DATABASE_NAME 创建或切换数据库 (需要插入数据后才能用show dbs显示)
- db.COLLECTION_NAME.insert({key:value}) 插入数据

插入数据后才真正创建数据库

## 删除数据库
- db.dropDatabase() 删除当前数据库
- db.createCollection('xxx') 创建集合
- db.collection.drop() 删除集合

## 创建集合
- db.createCollection(name,options)
  - name: collection name
  - options:
    - capped: bool capped collection 固定集合
    - autoIndexdId: bool(false) 自动在_id字段创建索引
    - size: word capped is true use
    - max: capped 文档最大数量

- show collections (show tables) 查看集合
- db.COLLECTION_NAME.insert({key:value}) 插入(并创建)集合

## 删除集合
- db.COLLECTION_NAME.drop() 成功返回true

## 插入文档
MongoDB文档以BJSON格式存储

- db.COLLECTION_NAME.insert({xxx}) 向集合中插入文档(_id不允许重复)
- db.COLLECTION_NAME.find() 显示集合下的文件
- db.COLLECTION_NAME.save() 插入(添加)文档 指定_id则覆盖文档

- db.COLLECTION_NAME.insertMany([])

## 更新文档

- update
```javascript
db.dollection.update(
  <query/>,
  <update/>,
  {
    upsert:<bollean/>,
    multi:<bollean/>,
    writeConcern:<document/>,
  }
)
```

- query: 查询条件 (key:value)(类似SQL update查询内的where)
- update: 更新的对象和操作符($,$inc),(类似SQL update查询的set)
- upset: 可选(flase) 如果不存在记录是否自动插入objNew(自动创建)
- multi: 可选(false) 更新所有匹配记录
- writeConcern 可选 定义抛出异常的级别

```javascript
//json格式化输出
db.COLLECTION_NAME.find().prettry()
```

- save
```javascript
db.COLLECTRY_NAME.save(
  <document/>,
  {
    writeConcern:<document/>,
  }
)
```
- document 文档数据{'_id':objectId("xxx"),xxx:xxx}
- writeConcern 异常级别

## 删除文档
执行删除前建议先执行find确认执行条件正确

```javascript
db.COLLECTION_NAME.remove(
  <query/>,
  {
    justOne:<Boolean/>,
    writeConcern:<document/>
  }
)
```
- query: 可选 删除条件
- justOne: 可选(false) 只删除一个文档
- writeConcern: 抛出异常级别

## 查询文档
find()查找文档 以非结构化的方式显示
```javascript
db.COLLECTION_NAME.find(query.projection)
db.COLLECTION_NAME.find().pretty()
```
- query: 可选 查询条件
- projection: 可选 使用投影操作符指定返回的键

### 数值比较
MongoDB 与 RDBMS Where 条件查询指令对比
| 操作    | 格式                | RDBMS Where        |
| :----- | :------------------ | :----------------- |
| 等于    | {key:value}         | where key=value    |
| 小于    | {key:{$lt:value}}   | where key < value  |
| 小于等于 | {key:{$lte:value}} | where key <= value |
| 大于     | {key:{$gt:value}}  | where key > value  |
| 大于等于 | {key:{$gte:value}} | where key >= value |
| 不等于   | {key:{$ne:value}}  | where key != value |

### 逻辑条件
and 传入多个key value用','隔开
(*WHERE中 where key=value AND key=value*)

or 关键字$or {$or:[{key:value},{key:value}]}
(*where 中 where key=value OR key=value*)

## type操作符
$type

| 类型                   | 数值 |
| :--------------------- | :---|
| Double                 | 1   |
| String                 | 2   |
| Object                 | 3   |
| Array                  | 4   |
| Binary data            | 5   |
| Undefined              | 6 已废弃 |
| Object id              | 7   |
| Boolean                | 8   |
| Date                   | 9   |
| Null                   | 10  |
| Regular Expression     | 11  |
| JavaScript             | 13  |
| Symbol                 | 14  |
| JavaScript (with scope)| 15  |
| 32-bit integer         | 16  |
| Timestamp              | 17  |
| 64-bit integer         | 18  |
| Min key 255 Query with | -1. |
| Max key                | 127 |

```javascript
db.COLLECTION_NAME.find({"title":{$type:2}})
db.COLLECTION_NAME.find({"title":{$type:"string"}})
```

## Limit方法Skip
.limit()方法读取指定记录条数  
.skip()方法跳过指定条数的数据

```javascript
db.COLLECTION_NAME.find().limit(n)
db.COLLECTION_NAME.find().limit(m).skip(m)//谁先谁后没有区别吗
```

## sort方法
.sort({key:1}) 升序 .sort({key:-1})降序

```javascript
db.COLLECTION_NAME.find().sort({key:1})
```

## 索引
使用.createIndex()创建索引 对列进行排序

```javascript
db.COLLECTION_NAME.createIndex(keys,options)
```
- keys: {key1:1,key2:-1} keyn指定索引终字段 1为升序 -1降序
- options: 可选
| Parameter | Type | Description |
| :-- | :-- | :-- |
| background | Boolean | (false)创建索引时在后台创建，避免阻塞数据库操作 |
| unique | Boolean | (false)创建索引为唯一索引 |
| name | string | 索引名称，默认使用字段名和排序生成 |
| dropDups | Boolean | 3.0.0弃用 创建唯一索引删除重复记录 |
| sparse | Boolean | (false)索引的字段不存在的数据不回加入索引 |
| expireAfterSeconds | integer | 设定集合生存时间 |
| v | index version | 版本索引号 |
| weights | document | 权重 1-99,999 |
| default_language | string | 用于文本索引停用词的词干规则列表，默认英语 |
| language_override | string | 用于文本索引指定包含在文档中的字段名，默认langrage |

## aggregate
aggregate聚合 统计平均值/求和  
```javascript
db.COLLECTION_NAME.aggregate(AGGREGATE_OPERATION)
```

```javascript
//data
{
   _id: ObjectId(7df78ad8902e)
   title: 'Neo4j Overview', 
   description: 'Neo4j is no sql database',
   by_user: 'Neo4j',
   url: 'http://www.neo4j.com',
   tags: ['neo4j', 'database', 'NoSQL'],
   likes: 750
},

db.COLLECTION_NAME.aggregate([{$group:{_id:"$by_user",num_tutorial:{$sum:1}}}])
// ([$group{过滤器,统计数据}])
//类似SQL select by_user,count(*) from mycol group by by_user
>
{
   "result" : [
      {
         "_id" : "runoob.com",
         "num_tutorial" : 2
      },
      {
         "_id" : "Neo4j",
         "num_tutorial" : 1
      }
   ],
   "ok" : 1
}
```

[\[link ->\]](https://www.runoob.com/mongodb/mongodb-aggregate.html)

| 表达式    | 描述 |
| :------   | :-- |
| $sum      | 求和 |
| $avg      | 平均数 |
| $min      | 最小值 |
| $max      | 最大值 |
| $push     | 将取得的值插入到数组中 |
| $addToSet | 插入到数组 但不创建副本 |
| $first    | 按排序获取第一个数据 |
| $last     | 按排序获取最后一个数据 |

### 管道
同linux 当前命令的输出结果作为下一条命令的参数  
表达式: 处理文档并输出，是无状态的，只能用于处理当前聚合的文档
- $project: 修改文档结构，重命名、增加删除域，可创建计算结果和嵌套文档
- $match: 过滤数据
- $limit: 限制聚合管道返回的文档数
- $skip: 跳过指定文档返回剩余文档
- $unwind: 拆分某一数组类型字段
- $group: 将集合中的文档分组 用于统计
- $sort: 文档排序
- $geoNear: 输出接近某一地理位置的有序文档

```javascript
//只保留_id title author字段
db.col.aggregate({
  {$project:{
    title:1,
    author:1
  }}
})
//去除_id字段
db.col.aggregate({
  {
    $project{
      _id:0,
      title:1,
      author:1
    }
  }
})
//过滤
db.col.aggregate([
  {$match:{score:{$gt:70,$lt:90}}},//先过滤数据
  {$group:{_id:null,count:{$sum:1}}}//将结果分组
])
//$skip
db.col.aggregate({$skip:5})
```

## 复制 副本集
