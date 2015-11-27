#!/bin/bash
mkdir -p ~/.namecoin

[ -f ~/.namecoin/namecoin.conf ] || cat > ~/.namecoin/namecoin.conf <<EOF
rpcuser=$(whoami)
rpcpassword=$(openssl rand -hex 30/)
rpcport=8336
EOF
