# DevOps Final Assessment – Mahesh Shukla
**Date:** 13-Nov-2025  
**Email:** maheshcloudsec1@gmail.com

This repository contains the final DevOps assessment for the **Springer Capital / Greentree Group Internship Program**, demonstrating key DevOps skills such as:
- Linux scripting
- Docker containerization
- GitHub Actions CI/CD pipeline
- Nomad job configuration
- Grafana Loki & Promtail monitoring setup

---

## Repository Overview
This repository demonstrates the core DevOps competencies covered during the internship pre-onboarding and final assessment:

- **Linux Fundamentals & Scripting** — system information and automation  
- **Containerization (Docker)** — build and run Python-based container  
- **Continuous Integration (CI/CD)** — GitHub Actions workflow for automation  
- **Infrastructure as Code (Nomad)** — deploy containerized apps via job files  
- **Monitoring** — setup of Grafana Loki and Promtail for centralized log collection  

---

## Files & Purpose

| File/Folder | Description |
|--------------|-------------|
| `hello.py` | Simple Python app that prints “Hello, DevOps!” |
| `Dockerfile` | Builds a Python container image for `hello.py` |
| `scripts/sysinfo.sh` | Bash script to show basic system information |
| `.github/workflows/ci.yml` | GitHub Actions pipeline triggered on push |
| `nomad/hello.nomad` | Nomad job file for running the Docker container |
| `monitoring/loki_setup.txt` | Steps to start Grafana Loki locally |
| `monitoring/promtail-config.yml` | Configuration for Promtail log shipping |
| `README.md` | Documentation and execution guide |

---

## Quick Local Setup Instructions

### 1️⃣ Run the Linux script
```bash
bash scripts/sysinfo.sh
```

### 2. Build and run Docker image locally

```bash
docker build -t devops-final:latest .
docker run --rm devops-final:latest
```

**Expected Output:**

```bash
Hello, DevOps!
```

### 3. (Optional) Push image to Docker Hub

```bash
docker tag devops-final:latest YOUR_DOCKERHUB_USERNAME/devops-final:latest
docker push YOUR_DOCKERHUB_USERNAME/devops-final:latest
```

If pushed, update `nomad/hello.nomad` image to `YOUR_DOCKERHUB_USERNAME/devops-final:latest`.

```ini
image = "YOUR_DOCKERHUB_USERNAME/devops-final:latest"
```


### 4️⃣ Start Grafana Loki & Promtail (Local Monitoring)

```bash
# Start Loki
docker run -d --name loki -p 3100:3100 grafana/loki:3.0.0

# Start Promtail (adjust path as needed)
docker run -d --name promtail \
  -v $(pwd)/monitoring/promtail-config.yml:/etc/promtail/promtail-config.yml \
  -v /var/log:/var/log \
  grafana/promtail:latest --config.file=/etc/promtail/promtail-config.yml
```

✅ Check Loki readiness:

```bash
curl http://localhost:3100/ready
```

### 5️⃣ Run Nomad Job (Optional)

If Nomad agent is available:

```bash
nomad agent -dev &
nomad job run nomad/hello.nomad
nomad job status hello
```

## Proof Screenshots

|Step|Screenshot|Description|
|---|---|---|
|1️⃣|`Mahesh_repo_files.png`|Repository structure|
|2️⃣|`Mahesh_sysinfo.png`|Linux sysinfo script output|
|3️⃣|`Mahesh_docker_build.png`|Docker build success|
|4️⃣|`Mahesh_docker_run.png`|“Hello, DevOps!” printed|
|5️⃣|`Mahesh_actions_summary.png`|GitHub Actions passed ✅|
|6️⃣|`Mahesh_action_log.png`|GitHub Actions log output|
|7️⃣|`Mahesh_loki_ready.png`|Loki service ready|
|8️⃣|`Mahesh_nomad_job.png`|Nomad job running (optional)|

## Conclusion

This repository demonstrates hands-on DevOps practices from infrastructure provisioning to CI/CD and monitoring.  
It reflects real-world workflows expected in a Cloud & DevOps Engineer role.

**Author:** Mahesh Shukla  
**Internship Role:** Cloud & DevOps Intern  
**Email:** maheshcloudsec1@gmail.com  
**Time Zone:** IST (UTC +5:30)