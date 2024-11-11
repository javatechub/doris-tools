#!/bin/bash

# 获取当前脚本的绝对路径
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

# 获取根目录的绝对路径
ROOT_DIR=$(dirname "$SCRIPT_DIR")

# 拼接 JAR 文件的绝对路径
JAR_FILE="$ROOT_DIR/starters/data-gen-1.0.jar"

# 拼接依赖 JAR 文件的绝对路径
LIB_DIR="$ROOT_DIR/lib"

# 拼接 log 目录的绝对路径（与 bin 目录同级）
LOG_DIR="$ROOT_DIR/log"

# 确保 log 目录存在
if [ ! -d "$LOG_DIR" ]; then
  mkdir -p "$LOG_DIR"
fi

# 初始化类路径
CLASSPATH="$JAR_FILE"

# 添加所有依赖 JAR 文件到类路径
for i in "$LIB_DIR"/*.jar; do
  CLASSPATH="$CLASSPATH:$i"
done

# 设置 logback 配置文件的绝对路径
LOGBACK_CONFIG="$ROOT_DIR/conf/logback.xml"

# 输出调试信息
echo "Running JAR file: $JAR_FILE"
echo "CLASSPATH: $CLASSPATH"
echo "LOG_DIR: $LOG_DIR"
echo "LOGBACK_CONFIG: $LOGBACK_CONFIG"

# 运行 JAR 文件
java -cp "$CLASSPATH" -Dlogback.configurationFile="$LOGBACK_CONFIG" -Dlog.path="$LOG_DIR" cn.cloud.onetech.doris.tools.DataGenStarter
