## 软件安装source收集
mongodb(mirror): `deb http://mirrors.aliyun.com/mongodb/apt/ubuntu xenial/mongodb-org/stable multiverse`
docker(mirror): `deb http://mirrors.aliyun.com/docker-engine/apt/repo ubuntu-xenial main`


## source.list
- mirror
```
deb http://mirrors.aliyun.com/ubuntu/ xenial main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ xenial-security main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ xenial-updates main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ xenial-proposed main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ xenial-backports main restricted universe multiverse
```
    - http://mirrors.aliyun.com/ubuntu/
    - http://mirrors.163.com/ubuntu/
    - http://cn.archive.ubuntu.com/ubuntu

- auto select
```
deb mirror://mirrors.ubuntu.com/mirrors.txt xenial main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt xenial-security main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt xenial-updates main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt xenial-proposed main restricted universe multiverse
deb mirror://mirrors.ubuntu.com/mirrors.txt xenial-backports main restricted universe multiverse
```

