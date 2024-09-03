#!/bin/bash

# 获取进程状态
status=$(pm2 show cysic-aleo-prover | grep "status" | awk '{print $4}')

# 检查状态
if [ "$status" == "online" ]; then
    echo "cysic-aleo-prover is online! ☀️"
else
    echo "cysic-aleo-prover is offline! ❌"
fi
