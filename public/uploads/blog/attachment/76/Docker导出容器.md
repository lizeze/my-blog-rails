  # 导出已有容器

##  将已有容器打包成镜像并导出

```shell

$  docker commit container__id mynewimage

$  docker save mynewimage > /tmp/mynewimage.tar

```
 
## 导入容器
 
 复制到另一台安装好`docker`的服务器，执行下面的命令
``` shell  
$  docker load < /tmp/mynewimage.tar
```
 
