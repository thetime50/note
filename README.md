设置http、https代理
```cmd
git config --global http.proxy socks5://127.0.0.1:2080
git config --global https.proxy socks5://127.0.0.1:2080
```

查看http、https代理配置情况
```cmd
git config --global --get http.proxy
git config --global --get https.proxy
```

取消http、https代理配置
```cmd
git config --global --unset http.proxy
git config --global --unset https.proxy
```

gitpod edit test

cmd设置代理
```cmd
// 设置代理
set all_proxy=socks5://127.0.0.1:10808
// 删除代理
set all_proxy=

```

powershell设置代理
```cmd
// 设置代理
$env:all_proxy="socks5://127.0.0.1:10808"
// 删除代理
$env:all_proxy=""
// 查看代理
ls env:*
```

cmd和powershell永久代理
设置环境变量all_proxy / socks5://127.0.0.1:10808

