# How to Deploy Nmap Viewer with Docker

This document explains how to deploy **Nmap Viewer** using Docker on Debian-based Linux or macOS. Follow the steps below to use the provided deployment script.

## Prerequisites

- You need to have **Docker** installed on your system.
- You also need either **curl** or **wget** installed to download files.

## Deployement

### Debian
```bash
/bin/bash -c "$(wget -qO- https://raw.githubusercontent.com/SyNode-IT/nmap-viewer/docker/heads/master/public/deploy-docker.sh)"
```

### Mac OS
```bash
/bin/bash -c "$(curl -sSL https://raw.githubusercontent.com/SyNode-IT/nmap-viewer/docker/heads/master/public/deploy-docker.sh)"
```
