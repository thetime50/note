# QuickStart-Docker
[link](https://www.runoob.com/docker/docker-tutorial.html)

## 构架
- 镜像（Image）：配置/模板
- 容器（Container）：容器是镜像运行时的实体。容器可以被创建、启动、停止、删除、暂停等。
- 仓库（Repository）：仓库可看着一个代码控制中心，用来保存镜像。
- Docker Registry（登记列表）- Repository（仓库）- tag（标签）  
==> 镜像

- 客户端 （Client）：通过命令行或其他工具使用Dockers SDK与Docker守护进程通信
- 主机 （Host）：执行的守护进程和容器

Docker 使用客户端-服务器 (C/S) 架构模式，使用远程API来管理和创建Docker容器。  
![framework](img/QuickStart-Docker/1-framework.png)