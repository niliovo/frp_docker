# frp_docker

# 本项目基于[frp](https://github.com/fatedier/frp),自动打包最新版frp到docker容器

## Docker-Cli使用指南

```bash
docker run -itd --name frps --hostname frps --net host --restart always -v /your_path/frps/config:/frp/config -v /your_path/frps/tls:/frp/tls -e TZ=Asia/Shanghai -e FRP_TYPE=frps niliaerith:latest
```

> 必须参数为`-v /your_path/frps/config:/frp/config` `-e FRP_TYPE=frps`
>> `/frp/config`目录为配置文件目录
>> `-e FRP_TYPE`为指定frp功能，填`frps`即为服务端，填`frpc`即为客户端，默认为frps
>>> `/frp/tls目录`为TLS加密文件目录
>>> `TZ`为时区

## Docker Compose使用指南

```compose.yml
  frps:
    image: niliaerith/frp:latest
    container_name: frps
    hostname: frps
    restart: always
    network_mode: host
    volumes:
      - ./frps/config:/frp/config
      - ./frps/tls:/frp/tls
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
      - ./frpc/config:/frp/config
      - ./frpc/tls:/frp/tls
    environment:
      - TZ=Asia/Shanghai
      - FRP_TYPE=frpc
```

# 感谢

- [@fatedier/frp](https://github.com/fatedier/frp)
- [GitHub](https://github.com/)
- [Docker Hub](https://hub.docker.com/)

# 捐赠

![支付宝](https://github.com/niliovo/frp_docker/blob/main/donation/alipay.JPG)

![微信](https://github.com/niliovo/frp_docker/blob/main/donation/wechatpay.JPG)