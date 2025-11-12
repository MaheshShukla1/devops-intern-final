# DevOps Final Assessment – Mahesh Shukla
**Date:** 13-Nov-2025  
**Email:** maheshcloudsec1@gmail.com

This repository contains the final DevOps assessment demonstrating:
- Linux scripting
- Docker containerization
- GitHub Actions CI pipeline
- Nomad job file for deployment
- Grafana Loki monitoring setup notes

---

## Files & Purpose

- `hello.py` — simple Python app that prints "Hello, DevOps!"
- `Dockerfile` — builds a container that runs `hello.py`
- `scripts/sysinfo.sh` — shell script to show basic system info
- `.github/workflows/ci.yml` — GitHub Actions workflow that runs on push
- `nomad/hello.nomad` — Nomad job specification to run Docker container
- `monitoring/loki_setup.txt` — steps to start Loki locally
- `monitoring/promtail-config.yml` — promtail config to forward container logs to Loki

---

## Quick local instructions

### 1. Run the Linux script
```bash
bash scripts/sysinfo.sh
```

### 2. Build and run Docker image locally

```bash
docker build -t devops-final:latest .
docker run --rm devops-final:latest
```

### 3. (Optional) Push image to Docker Hub

```bash
docker tag devops-final:latest YOUR_DOCKERHUB_USERNAME/devops-final:latest
docker push YOUR_DOCKERHUB_USERNAME/devops-final:latest
```

If pushed, update `nomad/hello.nomad` image to `YOUR_DOCKERHUB_USERNAME/devops-final:latest`.


### 4. Start Loki and Promtail (local)

```bash
# Start Loki
docker run -d --name loki -p 3100:3100 grafana/loki:3.0.0

# Start Promtail (see monitoring/promtail-config.yml)
docker run -d --name promtail -v $(pwd)/monitoring/promtail-config.yml:/etc/promtail/promtail-config.yml -v /var/log:/var/log grafana/promtail:latest --config.file=/etc/promtail/promtail-config.yml
```

Visit `http://localhost:3100/ready` to check Loki readiness.

### 5. Run Nomad job (if Nomad agent available)

```bash
nomad job run nomad/hello.nomad
```

