#!/bin/sh

m_d="/frp"

sc_d="/config"

sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories

apk --update --no-cache add openssl tzdata curl tar wget dpkg

pf="$(dpkg --print-architecture|sed 's/^.*musl-linux-//g'|sed 's/hf.*$//g'|sed 's/^.*i//g')"

v=$(wget -qO- -t1 -T2 "https://api.github.com/repos/fatedier/frp/releases/latest" | grep "tag_name" | head -n 1 | awk -F ":" '{print $2}' | sed 's/\"//g;s/,//g;s/ //g'
)

v_n=$(echo $v | sed 's/^.*v//g')

f_v=frp_$v_n\_linux_$pf

tg_v=frp_$v_n\_linux_$pf\.tar.gz

echo "$f_v,$tg_v"

mkdir -p $sc_d

echo "https://github.com/fatedier/frp/releases/download/$v/$tg_v"

#curl -C - -O https://github.com/fatedier/frp/releases/download/$v/$tg_v

curl -C - -O https://gh.flyinbug.top/gh/https://github.com/fatedier/frp/releases/download/$v/$tg_v

tar -zxvf $tg_v -C ./

mv $f_v/* ./

rm -rf $f_v $tg_v

mv *.ini $sc_d

rm -rf /tmp/*

apk del curl tar wget dpkg