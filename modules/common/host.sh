#!/usr/bin/env bash

echo "$HOST_NAME" >>/etc/hostname

cat >/etc/hosts <<EOF
127.0.0.1   localhost
::1         localhost
127.0.1.1   $HOST_NAME.localdomain   $HOST_NAME
EOF
