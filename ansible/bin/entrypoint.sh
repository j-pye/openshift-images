#!/usr/bin/env bash

if [ `id -u` -ge `1000` ]; then

  cat << EOF > /tmp/passwd
root:x:0:0:root:/root:/bin/bash
ansible:x:`id -u`:`id -g`:,,,:/ansible:/bin/bash
EOF

  cat /tmp/passwd > /etc/passwd
  rm /tmp/passwd
fi

exec tini -- "${@}"