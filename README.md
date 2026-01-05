## ✅ **Updated README.md with Run Instructions**

````markdown
# 3Palmi Half-Life Docker Server

A small, self-contained Half-Life Deathmatch server running in Docker with a custom map.  
Designed to be easy to deploy on any Linux host or VM (including OpenStack).

> Run a Half-Life DM server with a custom map in just a couple of commands —
> no native HLDS installation or 32-bit libraries required on the host.

---

## Features

- 🕹️ Half-Life Dedicated Server (HLDS)
- 🗺️ Custom map included in the image (`maps/gas_workz.bsp`)
- 🐳 Docker-based — clean and reproducible deployment
- 🌐 Runs on any x86_64 Linux VM or bare-metal server
- 🔧 Easy to extend with more maps / configs / mods

---

## Repository Structure

```text
3palmi-halflife-docker/
├─ Dockerfile              # Builds the final HLDS image
├─ config/
│   └─ server.cfg          # Server configuration
├─ maps/
│   └─ gas_workz.bsp       # Custom map(s)
├─ mapcycle.txt            # Optional map rotation
├─ docker-compose.yml      # Optional convenience runtime
├─ LICENSE
└─ README.md
````

---

# 🚀 How to Run the Server

This project is designed to run **fully inside Docker**.

Tested on:

* Debian / Ubuntu
* OpenStack VM
* Home server

---

## 1️⃣ Install Docker (if not installed)

```bash
sudo apt update
sudo apt install -y docker.io
sudo systemctl enable --now docker
```

---

## 2️⃣ Clone the repository

```bash
git clone https://github.com/juffaz/3palmi-halflife-docker.git
cd 3palmi-halflife-docker
```

---

## 3️⃣ Build the image

```bash
docker build -t 3palmi-hlds .
```

---

## 4️⃣ Run the server

```bash
docker run -d -ti \
  --name 3palmi-hlds \
  -p 27015:27015/udp \
  -p 27015:27015 \
  -p 26900:26900/udp \
  3palmi-hlds \
  "+log on +hostname \"3Palmi Half-Life\" +rcon_password changeme +maxplayers 16 +map gas_workz"
```

---

## ✅ Connect to the server

From Half-Life console:

```text
connect <YOUR_PUBLIC_IP>:27015
```

Replace `<YOUR_PUBLIC_IP>` with:

* your OpenStack floating IP
* or your server public IP

---

# 🌐 Network Requirements

Open these ports on the host / cloud security group:

|  Port | Protocol | Purpose                        |
| ----: | :------- | ------------------------------ |
| 27015 | UDP      | Game traffic                   |
| 27015 | TCP      | Server query / RCON            |
| 26900 | UDP      | (Optional) Steam master server |

---

# ⚙️ Configuration

## `config/server.cfg`

This file is copied into HLDS at container startup.

Example:

```cfg
hostname "3Palmi Half-Life Server"
rcon_password "changeme"
sv_lan 0
mp_timelimit 25
mp_friendlyfire 0
mp_footsteps 1
sv_maxrate 25000
sv_minrate 5000
sv_maxspeed 320
sv_cheats 0
pausable 0
log on
```

---

## 🗺️ Maps

Put custom maps into:

```
maps/*.bsp
```

They are copied into `valve/maps` during image build.

Start the server on a specific map:

```bash
+map gas_workz
```

---

## 🔁 Mapcycle (optional)

Define map rotation in:

```
mapcycle.txt
```

One map name per line.

---

# 🟡 Optional: Run via Docker Compose

```yaml
version: "3.8"

services:
  hlds:
    build: .
    container_name: 3palmi-hlds
    ports:
      - "27015:27015/udp"
      - "27015:27015"
      - "26900:26900/udp"
    restart: unless-stopped
    command: >
      +log on
      +hostname "3Palmi Half-Life"
      +rcon_password changeme
      +maxplayers 16
      +map gas_workz
```

Run:

```bash
docker compose up -d
```

---

# 🧭 Roadmap

Planned improvements:

* Optional Metamod / AMX Mod X layer
* FastDL HTTP map delivery
* Prebuilt image on Docker Hub

---

## Disclaimer

This project is not affiliated with or endorsed by Valve Corporation.
It only provides a Dockerized wrapper around the original HLDS.

```

---

Скажи — дополним 👍
```
