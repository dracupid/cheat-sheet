## Generate RSA key
```bash
ssh-keygen -t rsa
```

## Login with key(on client)
```bash
ssh name@server mkdir -p ~/.ssh
cat ~/.ssh/id_rsa.pub | ssh name@server 'cat >> ~/.ssh/authorized_keys'
```

## Start SSH server
```bash
sudo apt-get install openssh-server
sudo service ssh start # just in case
```
