@echo off
setlocal enabledelayedexpansion

:: 获取当前脚本的目录路径
set SCRIPT_DIR=%~dp0

:: 拼接 JAR 文件的全路径
set JAR_FILE=%SCRIPT_DIR%..\starters\data-gen-1.0.jar

:: 拼接依赖 JAR 文件的全路径
set LIB_DIR=%SCRIPT_DIR%..\lib

:: 拼接 log 目录的全路径（与 bin 目录同级）
set LOG_DIR=%SCRIPT_DIR%..\log

:: 确保 log 目录存在
if not exist "%LOG_DIR%" mkdir "%LOG_DIR%"

:: 初始化类路径
set CLASSPATH=%JAR_FILE%

:: 添加所有依赖 JAR 文件到类路径
for %%i in ("%LIB_DIR%\*.jar") do (
    set CLASSPATH=!CLASSPATH!;%%i
)

:: 设置 logback 配置文件路径
set LOGBACK_CONFIG=%SCRIPT_DIR%..\conf\logback.xml

:: 输出调试信息
echo Running JAR file: %JAR_FILE%
echo CLASSPATH: %CLASSPATH%
echo LOG_DIR: %LOG_DIR%
echo LOGBACK_CONFIG: %LOGBACK_CONFIG%

:: 运行 JAR 文件
java -cp %CLASSPATH% -Dlogback.configurationFile=%LOGBACK_CONFIG% -Dlog.path=%LOG_DIR% cn.cloud.onetech.doris.tools.DataGenStarter

endlocal