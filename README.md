# Argo Toolbox API

A step‑by‑step guide to install, run, and explore the **Toolbox API** locally.  
This documentation is tailored for **non‑technical users**, with simple instructions and no prior Docker experience required.

---
## 🚀 Quickstart

If you already have Docker and Git configured on your local machine, you can just follow these steps:

- Clone this git repository:

  ```bash
  git clone https://github.com/amrit-eu/Argo-Toolbox.git
  cd Argo-Toolbox
  ```

- Rename file `.env.demo` in `.env`.

- Run Docker Compose to launch services:

  ```bash
  docker compose up -d
  ```
  
---
## 🖥️ Local Installation Guide

If the prerequisites mentioned above are not installed on your system, see the [Installation Guide](docs/Installation.md) for detailed instructions.

---

## Accessing Services

Once started, services are accessible at the port configured as `WEBSERVER_PORT` in the `.env` file, port 8080 by default:

- **Decoder API**: <http://localhost:8080/argo-toolbox/api/decoder/docs>
- **File Checker API**: <http://localhost:8080/argo-toolbox/api/file-checker/docs>
- **JupyterLab**: <http://localhost:8080/argo-toolbox/jupyterlab>
- **Home page**: <http://localhost:8080/>

    Available routes will be displayed in JSON format.
    
    ![Screenshot of API home page](/assets/images/image-3.png)
    
    You can test endpoints directly in the browser.

### 🔢 Using the Decoder

Details on using the Decoder API can be found in the [Decoder API documentation](docs/Usage_DecoderAPI.md).

### 🔎 Using the Argo NetCDF File Checker

Details on using the NetCDF File Checker API can be found in the [File Checker API documentation](docs/).

### 🧪 Using JupyterLab

This repository can be used to run a JupyterLab instance with example notebooks demonstrating how to access the Decoder and File Checker APIs.
See the [JupyterLab documentation](docs/Usage_JupyterLab.md) for details.

---

### 🐞 Reporting Issues

When reporting an issue, please include:

- Your Windows version
- Docker Desktop/Podman Desktop version
- Steps to reproduce
- Logs or error messages

Submit issues here:

👉 <https://github.com/amrit-eu/Argo-Toolbox/issues>
