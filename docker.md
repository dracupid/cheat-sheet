- remove dangling volume
```bash
docker volume rm $(docker volume ls -qf dangling=true)
```
