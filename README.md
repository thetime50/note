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
