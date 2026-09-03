# DevOps Homework

**Akshat Kushwaha**

All homework assignments for the DevOps module. Every command shown in these write-ups was run on the machine described below, and the output is what it printed.

| # | Assignment | Deliverable |
|---|---|---|
| 01 | Linux Fundamentals — soft/hard links, `adduser` vs `useradd`, `journalctl`, command cheat sheet | [`DevOps-Homework-Answers.md`](./DevOps-Homework-Answers.md) |
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
├── DevOps-Homework-Answers.md      01 - Linux fundamentals
├── DevOps-Homework-Answers.docx    01 - same, formatted for submission
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

## Two things not run on this machine

Both need root, and this machine had no sudo password available for the session. Each is clearly marked where it appears, with the commands and the expected behaviour written out rather than presented as captured output:

- **Assignment 1, Task 2** — creating and deleting the test users. The rest of that task (which binary is which, which package ships each, the config files that set the differing defaults) was run and captured.
- **Assignment 3** — `tcpdump`. The commands are given, along with why a capture on `wlo1` would show encrypted WireGuard traffic rather than ICMP on this machine.

One further note: Assignment 6 asks for port 8080, and 8080 on `127.0.0.1` was already held by `code-server`. The container is published on the LAN interface instead — `docker ps` shows `8080->8080/tcp` either way, and the reason is documented in that assignment's README.

## A note on the output

MAC addresses and one public IPv6 address have been replaced with obvious placeholders (`aa:bb:cc:…`) in Assignment 3, since this repository is public. Nothing else has been altered. Private-range addresses like `172.20.0.64` and `172.17.0.1` are left as captured.
