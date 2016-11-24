## init checklist
- ssh-server
- language package
- apt mirror
- apt update & upgrade


## init install
git zsh curl

## Chinese Environment
```shell
sudo apt-get install language-pack-zh-hant language-pack-zh-hans
echo "LANG=\"zh_CN.UTF\"\nLANGUAGE=\"zh_CN:zh:en_US:en\"" | sudo tee /etc/default/locale
sudo reboot
```


## docker
```sh
curl -sSL http://acs-public-mirror.oss-cn-hangzhou.aliyuncs.com/docker-engine/internet | sh -
sudo usermod -aG docker dracupid # need log out
sudo newgrp docker

sudo mkdir -p /etc/systemd/system/docker.service.d
sudo tee /etc/systemd/system/docker.service.d/mirror.conf <<-'EOF'
[Service]
ExecStart=
ExecStart=/usr/bin/docker daemon -H fd:// --registry-mirror=https://3mvo5g01.mirror.aliyuncs.com
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker

```
# https://get.docker.com/

## oh-my-zsh
```sh
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
# sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```


## locale
https://help.ubuntu.com/community/Locale
apt-cache search language-pack
install language-pack-zh-hans // it will locale-gen
// /var/lib/locales/supported.d/
update_locale LANG=zh_CN.UTF-8 // /etc/default/locale
以上每一步完了都重新login检查下


1. 首先语言包要有
2. 其次配置要生成好
3. 环境变量要设好

https://help.ubuntu.com/community/EnvironmentVariables


apt-cache policy git
