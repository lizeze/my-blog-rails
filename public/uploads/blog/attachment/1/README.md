---
sidebar: auto
---
 # 达梦相关操作

## Window
 ###   备份数据库

 ```bash
 rem  @echo off
set lzyear=%date:~0,4%
set lzmonth=%date:~5,2%
set lzday=%date:~8,2%

set lzhour=%time:~0,2%
set lzminute=%time:~3,2%
set lzsecord=%time:~6,2%

set lzlocal=E:\DM\bak   # 备份保存目录
set lzsavepath=dm_%lzyear%-%lzmonth%-%lzday%_%lzhour%-%lzminute%-%lzsecord%_%random%  # 备份文件名
set lzpgdumppath="C:\dmdbms\bin\dexp.exe"  # 达梦安装目录
 
 
%lzpgdumppath% """SYSDBA"""/"""SYSDBA"""@192.168.14.121:5236 DIRECTORY=%lzlocal% FILE=%lzsavepath%.dmp SCHEMAS=("""GZCIM""") TABLESPACE=N DROP=N LOG=%lzsavepath%.log LOG_WRITE=N
 ```

可把以上内容写入`bat`文件中，定时执行。

### 备份恢复

```bash
C:\dmdbms\bin\dimp.exe """GZCIM"""/"""dmserver2022"""@192.168.14.121:5236 DIRECTORY=E:\DM\bak\a FILE=dm_2022-01-13_13-35-34_30315.dmp SCHEMAS=("""GZCIM""") IGNORE=N COMPILE=Y INDEXFIRST=N TABLE_FIRST=N LOCAL=N COMMIT_ROWS=5000 FAST_LOAD=N LOG=dm_2022-01-13_13-35-34_30315.log LOG_WRITE=N
```

## Linux

### 备份数据库
```shell
#! /bin/bash
dirdate=`date +%Y%m%d`_`date +%H%M%S`
echo $dirdate
cd "/opt/dm/back"
mkdir $dirdate
cd $dirdate
/home/dmdba/dmdbms/bin/dexp """GZCIM"""/"""dmserver2022"""@192.168.14.121:5236 DIRECTORY=./ FILE=imp_exp.dmp SCHEMAS="GZCIM" TABLESPACE=Y DROP=N LOG=$dirdate.log LOG_WRITE=N
```

### 定时备份

```shell
 $ crontab -e
```
另起一行写入

```shell
30 2 * * * /dmbak/bak.sh  # 每天凌晨2:30启动备份
```
### 备份恢复