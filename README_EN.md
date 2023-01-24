# frp_docker

- [中文](./README.md)
- [ENGLISH](./README_EN.md)

- [Github](https://github.com/niliovo/frp_docker)
- [Docker Hub](https://hub.docker.com/r/niliaerith/frp)

# This project is based on below projects,It will auto packaging the newest FRP to Docker container

- [frp](https://github.com/fatedier/frp)

## Docker-Cli Usage Guide

- FRPS

```bash
docker run -itd --name frps --hostname frps --net host --restart always -v /your_path/frps/config:/frp/config -v /your_path/frps/tls:/frp/tls -e TZ=Asia/Shanghai -e FRP_TYPE=frps -e DOMAIN=www.example.com niliaerith/frp:latest
```

- FRPC

```bash
docker run -itd --name frpc --hostname frpc --net host --restart always -v /your_path/frpc/config:/frp/config -v /your_path/frpc/tls:/frp/tls -e TZ=Asia/Shanghai -e FRP_TYPE=frpc -e DOMAIN=www.example.com niliaerith/frp:latest
```

## Docker Compose Usage Guide

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

## Variable

> Necessary Variable
- `-v /your_path/frps/config:/frp/config` 
- - `/frp/config` directory is the configuration file directory,The default server configuration is `frps.ini`，The default client configuration is`frpc.ini`，It will auto generate when first run，please change it by yourself
- `-e FRP_TYPE=frps`
- - `-e FRP_TYPE=`is specifing the function of the FRP，Fill in `frps` to enable the server(frps)，Fill in `frpc` to enable the client(frpc)，The default option is `frps`

> Optional Variable
- `TZ=Asia/Shanghai`
- - `TZ`Is the timezone,The default option is `Asia/Shanghai`
- The following options take effect only when custom TLS protocol encryption is enabled,[official documentation](http://gofrp.org/docs/features/common/network/network-tls/)
- `/your_path/frps/tls:/frp/tls`
- - `/frp/tls`Is the TLS encrypted file directory
- `DOMAIN=www.example.com`
- - `www.example.com` Change to your domain name

> For more details about how to configure variables, go to the following steps[Complete documentation of FRP](https://gofrp.org/docs/)

## Support platform

- amd64
- 386/32
- arm64
- arm/v7

# Thanks

- [@fatedier/frp](https://github.com/fatedier/frp)
- [GitHub](https://github.com/)
- [Docker Hub](https://hub.docker.com/)
- [Github file acceleration](https://tool.mintimate.cn/gh/)
