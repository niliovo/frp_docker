# frp_docker

- [中文](./README.md)
- [ENGLISH](./README_EN.md)

# This project is based on [frp](https://github.com/fatedier/frp),It will auto packaging the newest FRP to Docker container

## Docker-Cli Usage Guide

```bash
docker run -itd --name frps --hostname frps --net host --restart always -v /your_path/frps/config:/frp/config -v /your_path/frps/tls:/frp/tls -e TZ=Asia/Shanghai -e FRP_TYPE=frps niliaerith:latest
```

## Docker Compose Usage Guide

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

## Variable

> Necessary Variable
- `-v /your_path/frps/config:/frp/config` 
- - `/frp/config` directory is the configuration file directory,The default server configuration is `frps.ini`，The default client configuration is`frpc.ini`，It will auto generate when first run，please change it by yourself
- `-e FRP_TYPE=frps`
- - `-e FRP_TYPE=`is specifing the function of the FRP，Fill in `frps` to enable the server(frps)，Fill in `frpc` to enable the client(frpc)，The default option is `frps`

> Optional Variable
- `/your_path/frps/tls:/frp/tls`
- - `/frp/tls`Is the TLS encrypted file directory
- `TZ=Asia/Shanghai`
- - `TZ`Is the timezone,The default option is `Asia/Shanghai`

> For more details about how to configure variables, go to the following steps[Complete documentation of FRP](https://gofrp.org/docs/)

# Thanks

- [@fatedier/frp](https://github.com/fatedier/frp)
- [GitHub](https://github.com/)
- [Docker Hub](https://hub.docker.com/)
- [Github file acceleration](https://tool.mintimate.cn/gh/)

# Donation

![Alipay](./donation/alipay.JPG)

![WechatPay](./donation/wechatpay.JPG)