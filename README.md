# Argo Toolbox API

A step‑by‑step guide to install, run, and explore the **Toolbox API** locally.  
This documentation is tailored for **non‑technical users**, with simple instructions and no prior Docker experience required.

---

## 🚀 Local Deployment Guide

This section provides installation instructions for Windows, Mac, and Linux. Follow the steps relevant to your operating system.

### 🛠 Prerequisites

Regardless of the operating system, you will need **Docker** and **Git**.

#### 1. Install Docker

- **Windows and Mac:**
  - Download Docker Desktop: [Docker Desktop](https://www.docker.com/products/docker-desktop/)
  - Install with default settings and restart if prompted.
  - Ensure Docker shows **Running**.

- **Linux:**
  - Update package index:
  
    ```bash
    sudo apt update
    ```

  - Install Docker:
  
    ```bash
    sudo apt install docker.io
    ```

  - Enable Docker:
  
    ```bash
    sudo systemctl enable docker
    sudo systemctl start docker
    ```

  - Verify installation:
  
    ```bash
    docker --version
    ```

---

#### 2. Install Git

- **Windows:**
  - Download Git: [Git for Windows](https://git-scm.com/download/win)
  - Install using default settings and verify in **Git Bash**.

- **Mac:**
  - Download Git: [Git for Mac](https://git-scm.com/download/mac)
  - Install using default settings and verify in **Terminal**.

- **Linux:**
  - Install Git:
  
    ```bash
    sudo apt install git
    ```

  - Verify installation:
  
    ```bash
    git --version
    ```

---

### 📥 Clone the Repository

Open Terminal (Linux and Mac) or PowerShell (Windows) and run:

```bash
git clone https://github.com/amrit-eu/Argo-Toolbox.git
cd Argo-Toolbox
```

This downloads the Toolbox code onto your computer.

---

### ⚙️ Configure the Environment

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

### ▶ Launch Services (via Docker Desktop – No Terminal Needed)

All services can be launched directly from **Docker Desktop**, without using the command line.

---

1. Open Docker Desktop

    Launch Docker Desktop and wait until it shows:

    ```text
    Docker Desktop — Running
    ```

2. Open the *Containers* view

    In the left sidebar, click:

    **Containers → [your-repo-name]**

    You should see a list of services defined in `compose.yaml`.

3. Start all services

    Next to the project name, click:

    👉 **▶ Start**

    Docker Desktop will:

    - pull the container images (first time only)
    - start all services listed in `compose.yaml`
    - show green “Running” indicators

4. Check that everything is running

    Each service should display:

    - a **green dot**
    - a **Running** status

    You can click any container to view logs, ports, and details.

5. Stop all services

    To stop everything safely, click:

    👉 **⏹ Stop**

6. Restart if needed

    You can restart the entire stack by clicking:

    👉 **⟳ Restart**

#### 💡 Optional: Command Line (for advanced users)

If you prefer using a terminal:

```bash
docker compose up -d
docker compose ps
docker compose down
```

---

<<<<<<< HEAD
## 🚀 Local Deployment Guide (Mac)

TBD...

---

## 🚀 Local Deployment Guide (Linux)

This Docker Compose configuration allows you to run the Argo Toolbox API locally on your laptop, replacing the Kubernetes deployment for easier local development and testing.

### Prerequisites

- Docker (Docker Desktop for Windows)

### Quick start

Clone this repository, rename the `demo.env` file in `.env` and do this command :

```bash
# Start all services
docker compose up -d
```

### Accessing Services

Once started, services are accessible at:

- **Decoder API**: <http://localhost:8080/argo-toolbox/api/decoder>
- **File Checker API**: <http://localhost:8080/argo-toolbox/api/file-checker>
- **JupyterLab**: <http://localhost:8080/argo-toolbox/jupyterlab>
- **Home page**: <http://localhost:8080/>


### Configuration

The `argo_nginx.conf` is needed but should not be changed.
All configuration is done via an `.env` file:

```env
#file checker API configuration
FILECHECKERAPI_IMAGE=ghcr.io/oneargo/argoformatchecker/python-api
FILECHECKERAPI_IMAGE_TAG=latest

#decoder API configuration
ARGODECODERAPI_IMAGE=boilerplateapi # to change with decoder image
ARGODECODERAPI_IMAGE_TAG=latest
DECODER_USER_UID=1000
DECODER_USER_GID=1000

#jupyterlab configuration :
JUPYTERLAB_IMAGE=quay.io/jupyter/datascience-notebook
JUPYTERLAB_IMAGE_TAG=python-3.13
JUPYTER_USER_UID=1000

#webserveur NGINX configuration
WEBSERVER_HOST="127.0.0.1"
WEBSERVER_PORT=8080

#default profile to use with docker compose up.
COMPOSE_PROFILES=enabled #  DO NOT CHANGE
```

If WEBSERVER is disabled, the services (file checker & decoder) will be available directly with the ports defined (localhost:8000 by default for file checker and localhost:8001 for decoder).

---

=======
>>>>>>> c3fdb13 (feat(docs): Readme)
### 🛑 Troubleshooting

#### View logs

```bash
docker compose logs -f
```

#### Restart everything

```bash
docker compose down
docker compose up -d
```

#### Check container status

```bash
docker compose ps
```

---

## 🧪 Using JupyterLab

JupyterLab gives you an interactive Python workspace.

### Open JupyterLab

Navigate to: <http://localhost:8888>

It should open automatically in your browser.

---

### 📂 Example Notebooks

The project includes notebooks demonstrating:

- Working with Git LFS data
- Decoding source files
- Validating Argo NetCDF files

#### 🔄 Pull large Git LFS data

```bash
git lfs install
git lfs pull
```

---

### 📦 Installing extra Python packages

Inside JupyterLab:

1. Open a **Terminal**
2. Run:

```bash
pip install <package-name>
```

Packages are installed **inside the container**, not on your Windows system.

---

## 🌐 Accessing the API

### 📄 Swagger UI (interactive)

Open: <http://localhost:8080/docs>

You can test endpoints directly in the browser.

---

### 💻 API Usage Examples

#### 🐍 Python

```python
import requests
print(requests.get("http://localhost:8080/<endpoint>").json())
```

#### 📘 R

```r
library(httr)
content(GET("http://localhost:8080/<endpoint>"))
```

#### 🟡 MATLAB

```matlab
response = webread("http://localhost:8080/<endpoint>")
```

#### 🔵 Julia

```julia
using HTTP, JSON
JSON.parse(String(HTTP.get("http://localhost:8080/<endpoint>").body))
```

#### 🐚 curl (Bash / Zsh)

```bash
curl http://localhost:8080/<endpoint>
```

#### PowerShell

```powershell
Invoke-WebRequest -Uri "http://localhost:8080/<endpoint>" |
    Select-Object -ExpandProperty Content
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

## 🎉 You’re Ready

You now have a fully functional local environment running:

- The Toolbox API
- JupyterLab
- Example notebooks
- Multiple access methods

Perfect for “**PI on a Laptop**” workflows and offline analysis.