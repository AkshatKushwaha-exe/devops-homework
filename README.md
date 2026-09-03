# DevOps Homework

**Akshat Kushwaha**

All homework assignments for the DevOps module. Each one lives in its own numbered folder with its write-up in `README.md`. Every command shown was run on the machine described below, and the output is what it printed.

| # | Assignment | Deliverable |
|---|---|---|
| 01 | Linux Fundamentals — soft/hard links, `adduser` vs `useradd`, `journalctl`, command cheat sheet | [`01-linux-fundamentals/`](./01-linux-fundamentals/) |
| 02 | Shell Scripting — system information script | [`02-shell-scripting/`](./02-shell-scripting/) |
| 03 | Networking — commands, output and explanations | [`03-networking/`](./03-networking/) |
| 04 | Git — `commit -a -m` vs `commit -m`, cherry-pick | [`04-git/`](./04-git/) |
| 05 | Docker — six Hello World applications | [`05-docker-hello-world/`](./05-docker-hello-world/) |
| 06 | Docker — multi-stage build | [`06-docker-multistage/`](./06-docker-multistage/) |
| 07 | Docker — networking and volumes | [`07-docker-networking-volumes/`](./07-docker-networking-volumes/) |

## Environment

Everything was done on the same machine:

- Ubuntu 22.04.5 LTS, kernel 6.8.0-110-generic
- Docker 28.2.2 (legacy builder — no `buildx` plugin installed)
- Git 2.34.1
- Bash 5.1.16
- Go 1.22 (in-container), Node 20, Python 3.11, Temurin JDK/JRE 21

## Screenshots

`screenshots/` holds the evidence for each assignment, in two kinds:

- **Browser screenshots** — real captures of the running containers, taken with headless Chrome pointed at `localhost`. These are the pages the applications actually served.
- **Terminal screenshots** — the captured command output rendered as a terminal window. Every character in them is genuine output from the commands shown; the rendering is for legibility.

```
screenshots/
├── 01-linux/
├── 02-shell/
├── 03-networking/
├── 04-git/
├── 05-docker-hello-world/
├── 06-multistage/
└── 07-networking-volumes/
```

## Layout

```
DevOps/
├── README.md                       this file
├── 01-linux-fundamentals/
│   └── README.md
├── 02-shell-scripting/
│   ├── README.md
│   └── sysinfo.sh
├── 03-networking/
│   └── README.md
├── 04-git/
│   └── README.md
├── 05-docker-hello-world/
│   ├── README.md
│   ├── nodejs-app/
│   ├── python-app/
│   ├── java-app/
│   ├── Apache-app/
│   ├── React-app/
│   └── nginx-app/
├── 06-docker-multistage/
│   ├── README.md
│   ├── Dockerfile
│   ├── Dockerfile.single-stage
│   ├── main.go
│   └── go.mod
├── 07-docker-networking-volumes/
│   ├── README.md
│   └── bind-mount-demo/
│       └── index.html
└── screenshots/
```

## Running the Docker assignments

```bash
# 05 - build and run any of the six apps
cd 05-docker-hello-world/nodejs-app
docker build -t nodejs-hello .
docker run -d -p 3000:3000 --name nodejs-hello nodejs-hello

# 06 - multi-stage build, serves on port 8080
cd 06-docker-multistage
docker build -t hello-multistage .
docker run -d -p 8080:8080 --name hello-multistage hello-multistage
curl localhost:8080
```

Port assignments for assignment 05 are in that folder's README.

## A note on the output

MAC addresses and one public IPv6 address are replaced with obvious placeholders (`aa:bb:cc:…`) in Assignment 3, since this repository is public. Nothing else is altered — private-range addresses like `172.20.0.64` and `172.17.0.1` are left exactly as captured, because they mean nothing outside my own LAN.

A few of the exercises that need root — creating and deleting test users, and packet capture — were done inside throwaway containers rather than on the laptop itself. Same Ubuntu 22.04 packages, real output, and nothing left behind on a working machine afterwards.
