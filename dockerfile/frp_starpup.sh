#!/bin/sh

TZ=${TZ:-Asia/Shanghai}

FRP_TYPE=${FRP_TYPE:-frps}

m_d="/frp"

sc_d="/config"

nc_d="config"

f_i="${FRP_TYPE}.ini"

s_d="tls"

cp /usr/share/zoneinfo/${TZ} /etc/localtime
echo ${TZ} > /etc/timezone

if [ ! -e "$nc_d/$f_i" ]; then
	echo "配置文件不存在，正在生成配置文件"
	cp -r $sc_d/* $m_d/$nc_d
else
	echo "配置文件已存在，请修改配置文件(修改完毕请忽略)"
fi

if [ ! -e "$s_d/${FRP_TYPE}.crt" -o ! -e "$s_d/${FRP_TYPE}.key" -o ! -e "$s_d/frp.crt" ]; then
	echo "TLS文件不存在或不完整，正在生成配置文件"

mkdir -p $s_d && cd $s_d

cat > my-openssl.cnf << EOF
[ ca ]
default_ca = CA_default
[ CA_default ]
x509_extensions = usr_cert
[ req ]
default_bits        = 2048
default_md          = sha256
default_keyfile     = privkey.pem
distinguished_name  = req_distinguished_name
attributes          = req_attributes
x509_extensions     = v3_ca
string_mask         = utf8only
[ req_distinguished_name ]
[ req_attributes ]
[ usr_cert ]
basicConstraints       = CA:FALSE
nsComment              = "OpenSSL Generated Certificate"
subjectKeyIdentifier   = hash
authorityKeyIdentifier = keyid,issuer
[ v3_ca ]
subjectKeyIdentifier   = hash
authorityKeyIdentifier = keyid:always,issuer
basicConstraints       = CA:true
EOF

openssl genrsa -out frp.key 2048
openssl req -x509 -new -nodes -key frp.key -subj "/CN=*.niliovo.top" -days 100000 -out frp.crt

openssl genrsa -out frps.key 2048
openssl req -new -sha256 -key frps.key \
    -subj "/C=XX/ST=DEFAULT/L=DEFAULT/O=DEFAULT/CN=CN=*.niliovo.top" \
    -reqexts SAN \
    -config <(cat my-openssl.cnf <(printf "\n[SAN]\nsubjectAltName=DNS:localhost,DNS:*.niliovo.top")) \
    -out frps.csr
openssl x509 -req -days 100000 -sha256 \
	-in frps.csr -CA frp.crt -CAkey frp.key -CAcreateserial \
	-extfile <(printf "subjectAltName=DNS:localhost,DNS:*.niliovo.top") \
	-out frps.crt

openssl genrsa -out frpc.key 2048
openssl req -new -sha256 -key frpc.key \
    -subj "/C=XX/ST=DEFAULT/L=DEFAULT/O=DEFAULT/CN=*.niliovo.top" \
    -reqexts SAN \
    -config <(cat my-openssl.cnf <(printf "\n[SAN]\nsubjectAltName=DNS:localhost,DNS:*.niliovo.top")) \
    -out frpc.csr
openssl x509 -req -days 100000 -sha256 \
    -in frpc.csr -CA frp.crt -CAkey frp.key -CAcreateserial \
	-extfile <(printf "subjectAltName=DNS:localhost,DNS:*.niliovo.top") \
	-out frpc.crt

cd ..

echo "请保证frp服务器与frp客户端所使用TLS文件一致，否则无法完成验证！"

else
	echo "TLS文件已存在，请保证frp服务器与frp客户端所使用TLS文件一致，否则无法完成验证！"
fi

chmod -R 755 $m_d

cd ..

echo "启动${FRP_TYPE}服务"
$m_d/${FRP_TYPE} -c $m_d/$nc_d/$f_i
