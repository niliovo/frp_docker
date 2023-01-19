# frp_docker

- [中文](./README.md)
- [ENGLISH](./README_EN.md)

# 本项目基于[frp](https://github.com/fatedier/frp),自动打包最新版frp到docker容器

## Docker-Cli使用指南

```bash
docker run -itd --name frps --hostname frps --net host --restart always -v /your_path/frps/config:/frp/config -v /your_path/frps/tls:/frp/tls -e TZ=Asia/Shanghai -e FRP_TYPE=frps niliaerith:latest
```

## Docker Compose使用指南

```compose.yml
  frps:
    image: niliaerith/frp:latest
    container_name: frps
    hostname: frps
    restart: always
    network_mode: host
    volumes:
      - /your_path/frps/config:/frp/config
      - /your_path/frps/tls:/frp/tls
    environment:
      - TZ=Asia/Shanghai
      - FRP_TYPE=frps
```

```compose.yml
  frpc:
    image: niliaerith/frp:latest
    container_name: frpc
    hostname: frpc
    restart: always
    network_mode: host
    volumes:
      - /your_path/frps/config:/frp/config
      - /your_path/frps/tls:/frp/tls
    environment:
      - TZ=Asia/Shanghai
      - FRP_TYPE=frpc
```

## 变量

> 必须变量
- `-v /your_path/frps/config:/frp/config` 
- - `/frp/config`目录为配置文件目录,默认服务端配置为`frps.ini`，默认客户端配置为`frpc.ini`，第一次运行自动生成，请自行修改
- `-e FRP_TYPE=frps`
- - `-e FRP_TYPE=`为指定frp功能，填`frps`即为服务端(frps)，填`frpc`即为客户端(frpc)，默认为`frps`

> 可选变量
- `/your_path/frps/tls:/frp/tls`
- - `/frp/tls`为TLS加密文件目录
- `TZ=Asia/Shanghai`
- - `TZ`为时区,默认为`Asia/Shanghai`

> 更多详细配置变量内容请移步[FRP完整文档](https://gofrp.org/docs/)

# 感谢

- [@fatedier/frp](https://github.com/fatedier/frp)
- [GitHub](https://github.com/)
- [Docker Hub](https://hub.docker.com/)
- [Github文件加速](https://tool.mintimate.cn/gh/)

# 捐赠

![支付宝](./donation/alipay.JPG)

![微信](./donation/wechatpay.JPG)