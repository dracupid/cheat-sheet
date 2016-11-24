## apt

- mirror
- 升级所有的lib为最新版本

```sh
apt update && apt upgrade -y
```



## 安装常用必备工具

```sh
apt install git zsh curl
```



### oh-my-zsh

- 需要预先安装zsh和git
- 安装oh-my-zsh

```sh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

- 安装zsh-syntax-highlighting插件

  ```sh
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git --depth=1 ${ZSH}/custom/plugins/zsh-syntax-highlighting
  ```

## SSH

### 安装并启用ssh-server

```sh
apt install openssh-server
service ssh start # 默认会启动，通常不需要执行
```

### 使用SSH key免密登录远程主机

- 在本机生成RSA key

  ```sh
  ssh-keygen -t rsa
  ```

- 在远程主机上添加本机公钥

```sh
ssh name@server mkdir -p ~/.ssh
cat ~/.ssh/id_rsa.pub | ssh name@server 'cat >> ~/.ssh/authorized_keys'
```

> 以上命令均在本机执行

