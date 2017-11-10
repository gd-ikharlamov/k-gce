#/bin/env bash
GCE_PROJECT=dotted-music-184711
NODE_NAME=*

if [ ! -d keys ]; then
    echo "Creating directories"
    mkdir -v {keys,crts,srl,csrs}
fi

if [ ! -f keys/ca.key ]; then
    echo "Creating root ca"
    openssl genrsa -out keys/ca.key 2048
    openssl req -x509 -new \
            -key keys/ca.key -days 3600 \
            -out crts/ca.crt \
            -subj "/C=RU/ST=SPB/L=SPB/O=K/OU=cloud/CN=$NODE_NAME.c.$GCE_PROJECT.internal"
fi

echo "Creating certificate for $NODE_NAME.c.$GCE_PROJECT.internal"
#generate key
openssl genrsa -out keys/"$NODE_NAME.c.$GCE_PROJECT.internal.key" 2048
#generate cert request
openssl req -new \
        -subj "/C=RU/ST=SPB/L=SPB/O=K/OU=cloud/CN=$NODE_NAME.c.$GCE_PROJECT.internal" \
        -key keys/$NODE_NAME.c.$GCE_PROJECT.internal.key \
        -out csrs/$NODE_NAME.c.$GCE_PROJECT.internal.csr

#generate cert ans sign
openssl x509 -req -days 360 \
        -CA crts/ca.crt \
        -CAkey keys/ca.key \
        -CAcreateserial \
        -CAserial srl/ca.srl \
        -in csrs/$NODE_NAME.c.$GCE_PROJECT.internal.csr \
        -out crts/$NODE_NAME.c.$GCE_PROJECT.internal.crt
