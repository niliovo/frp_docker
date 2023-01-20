#!/bin/sh

m_d="/frp"

sc_d="/config"

sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories

apk --update --no-cache add curl tar openssl tzdata wget

rm -rf /tmp/*

v=$(wget -qO- -t1 -T2 "https://api.github.com/repos/fatedier/frp/releases/latest" | grep "tag_name" | head -n 1 | awk -F ":" '{print $2}' | sed 's/\"//g;s/,//g;s/ //g'
)

v_n=${v#*v}

dpkg --print-architecture

f_v=frp_"$v_n"_linux_amd64

tg_v=frp_"$v_n"_linux_amd64.tar.gz

mkdir -p $sc_d

#curl -C - -O https://github.com/fatedier/frp/releases/download/$v/$tg_v

curl -C - -O https://gh.flyinbug.top/gh/https://github.com/fatedier/frp/releases/download/$v/$tg_v

tar -zxvf $tg_v -C ./

mv $f_v/* ./

rm -rf $f_v $tg_v

mv *.ini $sc_d