#!/bin/bash
mkdir -p ~/.namecoin

[ -f ~/.namecoin/namecoin.conf ] || cat > ~/.namecoin/namecoin.conf <<EOF
server=1
rpcuser=$(whoami)
rpcpassword=$(openssl rand -hex 30/)
rpcport=8336
EOF

exec supervisord -n
