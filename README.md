# vscode-powershell
Dockerized powershell with VS Code support.

Build docker image:
---

```
$ docker build -f Dockerfile -t local/vscodepowershell:latest .
```

Create and run docker container:
---

```
$ docker compose up -d
```

Run VS Code inside docker container
---

1. Open VS Code workspace
2. Dev Containers: Reopen in Container
3. Install VS Code extensions as needed