#!/bin/sh

m_d="/frp"

sc_d="/config"

sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories

apk --update --no-cache add openssl tzdata curl tar wget dpkg

rm -rf /tmp/*

v=$(wget -qO- -t1 -T2 "https://api.github.com/repos/fatedier/frp/releases/latest" | grep "tag_name" | head -n 1 | awk -F ":" '{print $2}' | sed 's/\"//g;s/,//g;s/ //g'
)

v_n=${v#*v}

p_f=$(dpkg --print-architecture|grep -v musl-linux-|grep -v i|grep -v hf)

echo $p_f

f1=frp_$v_n
f2=_linux_$pf

f_v=$f1$f2

tg1=frp_$v_n
tg2=_linux_$pf
tg3=.tar.gz

tg_v=$tg1$tg2$tg3

echo "$f_v,$tg_v"

mkdir -p $sc_d

echo "https://github.com/fatedier/frp/releases/download/$v/$tg_v"

#curl -C - -O https://github.com/fatedier/frp/releases/download/$v/$tg_v

curl -C - -O https://gh.flyinbug.top/gh/https://github.com/fatedier/frp/releases/download/$v/$tg_v

tar -zxvf $tg_v -C ./

mv $f_v/* ./

rm -rf $f_v $tg_v

mv *.ini $sc_d

apk del curl tar wget dpkg