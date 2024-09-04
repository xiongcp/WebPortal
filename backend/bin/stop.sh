#!/bin/bash

# 定义应用程序的PID文件路径
BIN_DIR=$(dirname $(readlink -f "$0"))
PROJECT_HOME=$(cd ${BIN_DIR}/..;pwd)
PID_FILE="${PROJECT_HOME}"

# 定义要发送的信号，例如终止信号为15
SIGNAL="9"

# 检查PID文件是否存在
if [ -f "$PID_FILE" ]; then
    # 读取PID文件中的进程ID
    PID=$(cat "$PID_FILE")

    # 发送信号到进程
    kill -"$SIGNAL" "$PID" 2>/dev/null

    # 检查信号是否发送成功
    if [ $? -eq 0 ]; then
        echo "Signal $SIGNAL sent to process $PID."
    else
        echo "Failed to send signal $SIGNAL to process $PID."
    fi
else
    echo "PID file $PID_FILE does not exist."
fi
