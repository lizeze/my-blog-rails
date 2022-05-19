# 离线安装Docker

 官网[下载](https://download.docker.com/linux/static/stable/x86_64/)离线安装包

 ##  上传至服务器目录并解压

 ```shell
 $  tar -xvf docker-19.03.6.tar
 $  cp docker/* /usr/bin/ # 复制到该目录
 ```
 ## 注册docker服务

  在`/etc/systemd/system`下创建`docker.service`服务,并配置以下内容保存

  ```
[Unit]
Description=Docker Application Container Engine
Documentation=https://docs.docker.com
After=network-online.target firewalld.service
Wants=network-online.target
[Service]
Type=notify
# the default is not to use systemd for cgroups because the delegate issues still
# exists and systemd currently does not support the cgroup feature set required
# for containers run by docker
ExecStart=/usr/bin/dockerd
ExecReload=/bin/kill -s HUP $MAINPID
# Having non-zero Limit*s causes performance problems due to accounting overhead
# in the kernel. We recommend using cgroups to do container-local accounting.
LimitNOFILE=infinity
LimitNPROC=infinity
LimitCORE=infinity
# Uncomment TasksMax if your systemd version supports it.
# Only systemd 226 and above support this version.
#TasksMax=infinity
TimeoutStartSec=0
# set delegate yes so that systemd does not reset the cgroups of docker containers
Delegate=yes
# kill only the docker process, not all processes in the cgroup
KillMode=process
# restart the docker process if it exits prematurely
Restart=on-failure
StartLimitBurst=3
StartLimitInterval=60s
 
[Install]
WantedBy=multi-user.target
  ```

## 配置文件权限
```shell
chmod +x /etc/systemd/system/docker.service                
systemctl daemon-reload                                                       
systemctl start docker                                                            
systemctl enable docker.service   
```

## 验证`docker`是否安装成功
```shell
systemctl status docker                                                        
docker -v   
```

## 报错`docker`命令找不到

 报错的原因是因为手动安装的没有将`docker`配置到系统环境变量中
```shell
$  vim /etc/profile 
   # 写入 export PATH=$PATH:/usr/bin/docker/
$ source /etc/profile #使配置生效
```




# Docker 常用命令

##  查看容器挂载目录
```shell
 docker inspect container_name | grep Mounts -A 20
```