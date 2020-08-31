# Docker

## Docker 架构
[link->](https://www.runoob.com/docker/docker-architecture.html)

|  |  |
| :-- | :-- |
| Docker 镜像(Images) | 定义 |
| Docker 容器(Container) | 实例 运行环境 |
| Docker 客户端(Client) | 连接docker 服务 |
| Docker 主机(Host) | docker 服务 运行docker(守护进程 容器) |
| Docker 仓库Registry | 管理 存储镜像 |
| Docker Machine | docker shell |

## Ubuntu Docker 安装
```sh
# 文件传输工具
curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun
```
### 设置仓库
```sh
# 更新 apt 包索引
$ sudo apt-get update

# 安装 apt 依赖包，用于通过HTTPS来获取仓库:
$ sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# 添加 Docker 的官方 GPG 密钥：
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# 搜索指纹的后8个字符，验证是否拥有带有指纹的密钥
$ sudo apt-key fingerprint 0EBFCD88


# 设置稳定版仓库
$ sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable"
```

### 安装 Docker Engine-Community
```sh
# 更新 apt 包索引
$ sudo apt-get update

# 安装 Docker Engine-Community 和 containerd
$ sudo apt-get install docker-ce docker-ce-cli containerd.io

## 或者
# 列出可用版本
$ apt-cache madison docker-ce
# 安装特点版本
$ sudo apt-get install docker-ce=<VERSION_STRING> docker-ce-cli=<VERSION_STRING> containerd.io

# 测试
$ sudo docker run hello-world 
```

### 使用 Shell 脚本进行安装
Docker 在 get.docker.com 和 test.docker.com 上提供了方便脚本，用于将快速安装 Docker Engine-Community 的边缘版本和测试版本。脚本的源代码在 docker-install 仓库中。   
不建议在生产环境中使用这些脚本，在使用它们之前，您应该了解潜在的风险：  
不允许您自定义任何安装参数
会更改当前系统配置

## Docker 镜像加速
- 网易：https://hub-mirror.c.163.com/
- 阿里云：https://<你的ID>.mirror.aliyuncs.com
- 七牛云加速器：https://reg-mirror.qiniu.com

```sh
## upstart 的系统 ##
# 编辑 /etc/default/docker 文件，在其中的 DOCKER_OPTS 中配置加速器地址
DOCKER_OPTS="--registry-mirror=https://registry.docker-cn.com"

# 重新启动服务:
$ sudo service docker restart

## systemd 的系统 ##
/etc/docker/daemon.json 中写入如下内容（如果文件不存在请新建该文件）：
{"registry-mirrors":["https://reg-mirror.qiniu.com/"]}
# 之后重新启动服务
$ sudo systemctl daemon-reload
$ sudo systemctl restart docker
```
ps:
Linux系统目前存在的三种系统启动方式所对应的配置文件目录
1. SysVinit：/etc/init.d目录；
2. UpStart： /usr/share/upstart目录；
3. Systemd：/usr/lib/systemd目录；

## Hello World
在指定镜像执行命令 (或者创建 下载镜像并执行)
```sh
runoob@runoob~$ docker run ubuntu:15.10 /bin/echo "Hello world"
# docker run [镜像] [容器命令]
```

运行交互式容器
```sh
runoob@runoob:~$ docker run -i -t ubuntu:15.10 /bin/bash
root@0123ce188bd8:/#
```
- -t: 在新容器内指定一个伪终端或终端。(指定终端)
- -i: 允许你对容器内的标准输入 (STDIN) 进行交互。(允许交互)

退出容器
```sh
exit
# or [ctrl+d]
```

### 启动容器（后台模式）
使用以下命令创建/启动一个以进程方式运行的容器
```sh
runoob@runoob:~$ docker run -d ubuntu:15.10 /bin/sh -c "while true; do echo hello world; sleep 1; done"
-> 2b1b7a428627c51ab8810d541d759f072b4fc75487eed05812646b8534a2fe63 #容器ID

# 正在运行的容器
docker ps

# 容器shell输出
docker logs 2b1b7a428627

# 停止容器
runoob@runoob:~$ docker stop amazing_cori
runoob@runoob:~$ docker stop [id]
```

**docker ps**
- CONTAINER ID: 容器 ID。
- IMAGE: 使用的镜像。
- COMMAND: 启动容器时运行的命令。
- CREATED: 容器的创建时间。
- STATUS: 容器状态。
    - created（已创建）
    - restarting（重启中）
    - running（运行中）
    - removing（迁移中）
    - paused（暂停）
    - exited（停止）
    - dead（死亡）
- PORTS: 容器的端口信息和使用的连接类型（tcp\udp）。
- NAMES: 自动分配的容器名称。

## Docker 容器使用
```sh
docker

docker stats --help

## 容器
# 载入镜像
docker pull ubuntu
# 启动容器
docker run -it ubuntu /bin/bash # 启动容器并启用交互
# 退出
exit

# 查看容器
docker ps -a
# 启动停止的容器
docker start b750bbbcfd88 

# 指定容器后台运行 -d
docker run -itd --name ubuntu-test ubuntu /bin/bash
# 停止容器
docker stop <容器 ID>
# 可以restart 重启
docker restart <容器 ID>
```


```sh
# 进入容器
docker attach # 退出终端 容器即停止
docker exec #推荐 此退出容器终端，不会导致容器的停止

docker exec --help

# 导出容器
docker export 1e560fca3906 > ubuntu.tar
# 快照导入到镜像
cat docker/ubuntu.tar | docker import - test/ubuntu:v1
# 从url 或目录导入
docker import http://example.com/exampleimage.tgz example/imagerepo

# 删除容器
docker rm -f 1e560fca3906
```

### 运行web应用

```sh
docker pull training/webapp  # 载入镜像
docker run -d -P training/webapp python app.py #随机映射端口

docker run -d -p 5000:5000 training/webapp python app.py #指定映射端口 hostPort:containerPort/tcp

docker port [id/containerName]
```

- -d:让容器在后台运行。
- -P:将容器内部使用的网络端口随机映射到我们使用的主机上。

ps 命令查看信息
PORTS 0.0.0.0:32769->5000/tcp ( 主机端口 -> 容器内端口 )

web应用日志
```sh
docker logs -f bf08b7f2cd89
```
-f: 循环读取，类型tail -f 一样来输出容器内部的标准输出。

检查 WEB 应用程序
```sh
docker inspect wizardly_chandrasekhar
```

```sh
# 停止WEB应用容器
docker inspect wizardly_chandrasekhar
# 重启WEB应用容器
docker start wizardly_chandrasekhar
# 查询最后一次创建容信的息 last
docker ps -l 

# 移除容器 (必须先stop
docker rm wizardly_chandrasekhar
```

## 镜像使用

