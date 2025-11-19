# Argo Toolbox API

A step‑by‑step guide to install, run, and explore the **Toolbox API** locally.  
This documentation is tailored for **non‑technical users**, with simple instructions and no prior Docker experience required.

---

## 🚀 Quick start

If you already have Docker and Git configured on your local machine, you can just follow these steps:

- clone this git repository :

  ```bash
  git clone https://github.com/amrit-eu/Argo-Toolbox.git
  cd Argo-Toolbox
  ```

- rename file `.env.demo` in `.env`.

- run docker compose to launches services :

  ```bash
  docker compose up -d
  ```

## 🖥️ Detailed local Deployment Guide

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

4. You can adjust values for your needs (look at `.env.demo` file that describe configurations).

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

#Configure which service to enable (decoder,checker,jupyter) separated by a comma. will be run with 'docker compose up'
COMPOSE_PROFILES=decoder,checker,jupyter
```

Webserver will always be enabled as it is necessary to access others services.

Warning : An issue prevents the web server from starting if the Jupyter service is not running. For the moment keep `jupyter` in the list of services in `COMPOSE_PROFILES`.

The `argo_nginx.conf.template` file is needed and **must not** be changed.

---

### ▶ Launch Services (via Docker Desktop – No Terminal Needed)

All services can be launched directly from **Docker Desktop**, without using the command line.

---

1. Open Docker Desktop

   Launch Docker Desktop and wait until it shows:

   ```text
   Docker Desktop — Running
   ```

2. Open the _Containers_ view

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

##### 🚀 Launch services

If you prefer using a terminal:

```bash
docker compose up -d
docker compose ps
docker compose down
```

---

##### 🛑 Troubleshooting docker

###### View logs

```bash
docker compose logs -f
```

###### Restart everything

```bash
docker compose down
docker compose up -d
```

###### Check container status

```bash
docker compose ps
```

---

## Accessing Services

Once started, services are accessible at (considering the port configured in `.env` file, 8080 in .env.demo provided):

- **Decoder API**: <http://localhost:8080/argo-toolbox/api/decoder>
- **File Checker API**: <http://localhost:8080/argo-toolbox/api/file-checker>
- **JupyterLab**: <http://localhost:8080/argo-toolbox/jupyterlab>
- **Home page**: <http://localhost:8080/>

### Using Decoder

To be completed....

### Using Argo Netcdf File Checker

The file checker endpoint will then be available on <http://localhost:8080/argo-toolbox/api/file-checker/check-files> (POST method).

The DAC for the files needs to be specified as a parameter. The files to check need to be included in the body of a `multipart/form-data` type request, e.g.:
For example, post a file to `http://localhost:8080/argo-toolbox/api/file-checker/check-files?dac=coriolis` . Example files can be found <https://github.com/OneArgo/ArgoFormatChecker/tree/main/demo/inputs>

```http request
curl -X 'POST' \
  'http://localhost:8080/argo-toolbox/api/file-checker/check-files?dac=coriolis' \
  -H 'accept: application/json' \
  -H 'Content-Type: multipart/form-data' \
  -F 'files=@2903996_meta.nc'
```

### 🧪 Using JupyterLab

JupyterLab gives you an interactive Python workspace.

#### Open JupyterLab

Navigate to: <http://localhost:8080/argo-toolbox/jupyterlab>

It should open automatically in your browser.

![alt text](image.png)

#### 📂 Example Notebooks

The project includes in examples/notebooks notebooks demonstrating:

- Working with Git LFS data
- Decoding source files
- Validating Argo NetCDF files

#### 🔄 Pull large Git LFS data

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

## 🌐 Accessing the API

### 📄 Endpoints

Open: <http://localhost:8080>

Available routes will be displayed in JSON format.

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
