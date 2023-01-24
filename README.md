# frp_docker

- [中文](./README.md)
- [ENGLISH](./README_EN.md)

- [Github](https://github.com/niliovo/frp_docker)
- [Docker Hub](https://hub.docker.com/r/niliaerith/frp)

# 本项目基于下列项目,自动打包最新版frp到docker容器

- [frp](https://github.com/fatedier/frp)

## Docker-Cli使用指南

- FRPS

```bash
docker run -itd --name frps --hostname frps --net host --restart always -v /your_path/frps/config:/frp/config -v /your_path/frps/tls:/frp/tls -e TZ=Asia/Shanghai -e FRP_TYPE=frps -e DOMAIN=www.example.com niliaerith/frp:latest
```

- FRPC

```bash
docker run -itd --name frpc --hostname frpc --net host --restart always -v /your_path/frpc/config:/frp/config -v /your_path/frpc/tls:/frp/tls -e TZ=Asia/Shanghai -e FRP_TYPE=frpc -e DOMAIN=www.example.com niliaerith/frp:latest
```

## Docker Compose使用指南

- FRPS

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
      - DOMAIN=www.example.com
```

- FRPC

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
      - DOMAIN=www.example.com
```

## 变量

> 必须变量
- `-v /your_path/frps/config:/frp/config` 
- - `/frp/config`目录为配置文件目录,默认服务端配置为`frps.ini`，默认客户端配置为`frpc.ini`，第一次运行自动生成，请自行修改
- `-e FRP_TYPE=frps`
- - `-e FRP_TYPE=`为指定frp功能，填`frps`即为服务端(frps)，填`frpc`即为客户端(frpc)，默认为`frps`

> 可选变量
- `TZ=Asia/Shanghai`
- - `TZ`为时区,默认为`Asia/Shanghai`
- 下列选项仅当开启自定义TLS协议加密后生效,[官方文档](http://gofrp.org/docs/features/common/network/network-tls/)
- `/your_path/frps/tls:/frp/tls`
- - `/frp/tls`为TLS加密文件目录
- `DOMAIN=www.example.com`
- - `www.example.com`修改为你的域名

> 更多详细配置变量内容请移步[FRP完整文档](https://gofrp.org/docs/)

## 支持平台

- amd64
- 386/32
- arm64
- arm/v7

# 感谢

- [@fatedier/frp](https://github.com/fatedier/frp)
- [GitHub](https://github.com/)
- [Docker Hub](https://hub.docker.com/)
- [Github文件加速](https://tool.mintimate.cn/gh/)
