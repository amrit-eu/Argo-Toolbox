# Argo Toolbox API

A step‑by‑step guide to install, run, and explore the **Toolbox API** locally on a Windows laptop.  
This documentation is tailored for **non‑technical users**, with simple instructions and no prior Docker experience required.

---

## 🚀 Local Deployment Guide (Windows)

### 🛠 Prerequisites

#### 🐋 Install Docker Desktop

Docker Desktop allows you to run container-based applications.

👉 Download for Windows: <https://www.docker.com/products/docker-desktop/>  
✔ Install with default settings  
✔ Restart your computer if prompted  
✔ Ensure Docker shows **Running**

---

### 🔧 Install Git

Git is used to download ("clone") the Toolbox repository.

👉 Download Git: <https://git-scm.com/download/win>  
✔ Install using default settings  
✔ Open **Git Bash** to verify the installation

---

### 📥 Clone the Repository

Open **Git Bash** or **PowerShell**, then run:

```bash
git clone https://github.com/<org>/<repo>.git
cd <repo>
```

This downloads the Toolbox code onto your computer.

---

### Configure the Environment

The Toolbox API uses an environment file to configure the services.

1. In the project folder, locate:

   ```bash
   .env.demo
   ```

2. Create a copy named:

   ```bash
   .env
   ```

3. If you are comfortable with Docker and wish to customise the configurations, Open `.env` using your favorite text editor.
4. You can adjust values for your needs (look at `.env.docs` file that describe configurations).

---

### 🚀 Launch Services

Everything is managed through **Docker Compose**.

Start all services:

```bash
docker compose up -d
```

Check that they’re running:

```bash
docker compose ps
```

Stop everything:

```bash
docker compose down
```

---

### 🧪 Using JupyterLab

JupyterLab gives you an interactive Python workspace.

#### Open JupyterLab

Navigate to: <http://localhost:8888>

It should open automatically in your browser.

---

#### 📂 Example Notebooks

The project includes notebooks demonstrating:

- Working with Git LFS data
- Decoding source files
- Validating Argo NetCDF files

##### 🔄 Pull large Git LFS data

```bash
git lfs install
git lfs pull
```

---

#### 📦 Installing extra Python packages

Inside JupyterLab:

1. Open a **Terminal**
2. Run:

```bash
pip install <package-name>
```

Packages are installed **inside the container**, not on your Windows system.

---

### 🌐 Accessing the API

#### 📄 Swagger UI (interactive)

Open: <http://localhost:8080/docs>

You can test endpoints directly in the browser.

---

#### 💻 API Usage Examples

##### 🐍 Python

```python
import requests
print(requests.get("http://localhost:8080/<endpoint>").json())
```

##### 📘 R

```r
library(httr)
content(GET("http://localhost:8080/<endpoint>"))
```

##### 🟡 MATLAB

```matlab
response = webread("http://localhost:8080/<endpoint>")
```

##### 🔵 Julia

```julia
using HTTP, JSON
JSON.parse(String(HTTP.get("http://localhost:8080/<endpoint>").body))
```

##### 🐚 curl (Bash / Zsh)

```bash
curl http://localhost:8080/<endpoint>
```

##### PowerShell

```powershell
Invoke-WebRequest -Uri "http://localhost:8080/<endpoint>" |
    Select-Object -ExpandProperty Content
```

---

### 🛑 Troubleshooting

### View logs

```bash
docker compose logs -f
```

### Restart everything

```bash
docker compose down
docker compose up -d
```

### Check container status

```bash
docker compose ps
```

---

### 🐞 Reporting Issues

When reporting an issue, please include:

- Your Windows version
- Docker Desktop version
- Steps to reproduce
- Logs or error messages

Submit issues here:

👉 <https://github.com/amrit-eu/Argo-Toolbox/issues>

---

## 🚀 Local Deployment Guide (Linux)

This Docker Compose configuration allows you to run the Argo Toolbox API locally on your laptop, replacing the Kubernetes deployment for easier local development and testing.

### Prerequisites

- Docker (Docker Desktop for Windows)

### Quick start

Clone this repository, rename the `.env.demo` file in `.env` and do this command :

```bash
# Start all services
docker compose up -d
```

### Accessing Services

Once started, services are accessible at:

- **Decoder API**: <http://localhost:8080/argo-toolbox/api/decoder>
- **File Checker API**: <http://localhost:8080/argo-toolbox/api/file-checker>
- **Home page**: <http://localhost:8080/>

### Direct API Access (bypassing webserver)

By default :

- **Decoder API**: <http://localhost:8001/>
- **File Checker API**: <http://localhost:8000/>

### Configuration

The `argo_nginx.conf` is needed but should not be changed.
All configuration is done via an `.env` file:

```env
#file checker API configuration
FILECHECKERAPI_IMAGE=ghcr.io/oneargo/argoformatchecker/python-api
FILECHECKERAPI_IMAGE_TAG=latest
FILECHECKER_ENABLED=enabled #use 'enabled' or 'disabled' to enable/disable the service
FILECHECKER_PORT=8000

#decoder API configuration
ARGODECODERAPI_IMAGE=boilerplateapi # to change with decoder image
ARGODECODERAPI_IMAGE_TAG=latest
DECODER_ENABLED=enabled #use 'enabled' or 'disabled' to enable/disable the service
DECODER_PORT=8001

#webserveur NGINX configuration
WEBSERVER_ENABLED=enabled #use 'enabled' or 'disabled' to enable/disable the service
WEBSERVER_PORT=8080

#default profile to use with docker compose up.
COMPOSE_PROFILES=enabled #  DO NOT CHANGE
```

If WEBSERVER is disabled, the services (file checker & decoder) will be available directly with the ports defined (localhost:8000 by default for file checker and localhost:8001 for decoder).

---

## 🎉 You’re Ready

You now have a fully functional local environment running:

- The Toolbox API
- JupyterLab
- Example notebooks
- Multiple access methods

Perfect for “**PI on a Laptop**” workflows and offline analysis.