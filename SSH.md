## Generate RSA key
```bash
ssh-keygen -t rsa
```

## Login with key
```bash
ssh name@server mkdir -p .ssh
cat .ssh/id_rsa.pub | ssh b@B 'cat >> .ssh/authorized_keys'
```
