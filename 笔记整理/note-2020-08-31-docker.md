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