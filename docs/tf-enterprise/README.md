# Terraform Enterprise

## 🖥️ Hardware & Storage Requirements

These specs ensure adequate resources for both the Terraform Enterprise application itself and the Terraform plans/apply workflows:

* **CPU**: ≥ 4 CPU cores
* **Memory (RAM)**: ≥ 8 GB
* **Disk Space**:

  * **Root volume**: ≥ 10 GB
  * **Docker directory** (`/var/lib/docker`): ≥ 40 GB

---

## 📦 Deployment Overview

* The `8 GB` RAM and `4-core` CPU requirement applies regardless of whether you:

  * Run with **External Services Mode** (external database/object storage)
  * Or **Mounted Disk Mode** (self-managed, using local Docker volumes)
* The space allocated to Docker must comfortably handle images, containers, logs, and ephemeral data from runs.

---

## ✅ Recommended Configuration Table

| Component             | Minimum Spec    |
| --------------------- | --------------- |
| CPU                   | 4 cores         |
| RAM                   | 8 GB            |
| Root Disk             | 10 GB           |
| Docker Data Directory | 40 GB (or more) |

These resources support Terraform operations, web UI, background services, and Docker runtime. For production workloads with multiple concurrent runs or heavy pipelines, consider allocating additional CPU, RAM, and IOPS.

---

## 📈 Scaling Beyond Minimum

While HashiCorp’s minimum specs are sufficient for small teams or test setups:

* **💡 Scale up CPU/RAM** if you expect higher concurrency or complex runs.
* **Increase disk IOPS** if you observe slow Docker operations or high I/O on runs.

---

### In Summary

To deploy Terraform Enterprise via Replicated:

* **4 CPU cores**, **8 GB RAM**, **10 GB root disk**, and **40 GB Docker disk** are required at minimum.

You can scale further for production-grade environments. Let me know if you'd like optimized sizing guidance based on workload patterns or concurrency requirements!

---

### Reference

- [Terraform Enterprise Hardware Requirements](https://developer.hashicorp.com/terraform/enterprise/deploy/replicated/requirements/hardware)
