# 3Palmi Half-Life Docker Server

A small, self-contained Half-Life Deathmatch server running in Docker with a custom map.  
Designed to be easy to deploy on any Linux host or VM (including OpenStack).

> **Goal:** start a Half-Life DM server with a custom map in a couple of commands, without manually installing HLDS or 32-bit libraries on the host.

---

## Features

- 🕹️ Half-Life Deathmatch dedicated server (HLDS)
- 🗺️ Custom map bundled in the image (e.g. `gas_workz.bsp` from this repository)
- 🐳 Docker-based: no HLDS installation on the host
- 🌐 Ready to run on any x86_64 Linux VM (OpenStack, bare metal, etc.)
- 🔧 Easily extendable with more maps, configs and mods (Metamod / AMX Mod X later)

The actual HLDS base image is defined in the `Dockerfile`  
(for example it can wrap [`jives/hlds:valve`](https://github.com/JamesIves/hlds-docker)). 

---

## Repository Structure

```text
3palmi-halflife-docker/
├─ Dockerfile          # Builds the final HLDS image with the custom map
├─ maps/
│   └─ gas_workz.bsp   # Example custom map (put your BSP here)
├─ config/
│   └─ server.cfg      # Server configuration (hostname, rcon, mp_*, etc.)
├─ docker-compose.yml  # Optional: convenient local development / hosting
└─ README.md
