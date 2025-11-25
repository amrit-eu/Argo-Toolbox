# Argo Toolbox API

A step‑by‑step guide to install, run, and explore the **Toolbox API** locally.  
This documentation is tailored for **non‑technical users**, with simple instructions and no prior Docker experience required.

---

## 🚀 Quickstart

If you already have Docker and Git configured on your local machine, you can just follow these steps:

- clone this git repository :

  ```bash
  git clone https://github.com/amrit-eu/Argo-Toolbox.git
  cd Argo-Toolbox
  ```

- rename file `.env.demo` in `.env`.

- run docker compose to launch services:

  ```bash
  docker compose up -d
  ```

## 🖥️ Detailed Local Installation Guide

This section provides installation instructions for Windows, Mac, and Linux. Follow the steps relevant to your operating system.

### 🛠 Prerequisites

Regardless of the operating system, you will need to install **Git** and a **containerisation platform** like Docker or Podman.

A containerised application is packaged with everything it needs to run into a single, lightweight unit so it works the same 
on any computer. This also allows the application to run in an isolated environment without needing a full virtual machine, 
making it easier to share, move, and run reliably.

Podman Desktop or Docker Desktop are two available options of containerisation platforms with desktop UIs to create, manage and run app containers.
Choose one of these options and follow the steps below to download and install it.

#### 1. 🫙 Containerization Platform
##### Option 1: 🦭 Podman Desktop

You can install Podman Desktop on:

- Windows: [Podman Desktop](https://podman-desktop.io/).
- MacOS : [Podman Desktop](https://podman-desktop.io/docs/installation/macos-install)
- Linux : [Podman Desktop](https://podman-desktop.io/docs/installation/linux-install)

---

##### Option 2: 🐳 Docker Desktop

- **Windows and Mac:**

  - Download Docker Desktop: [Docker Desktop](https://www.docker.com/products/docker-desktop/)
  - Install with default settings and restart if prompted.
  - Ensure Docker shows **Running**.

- **Linux:**

  - Follow official installation guide : <https://docs.docker.com/engine/install/#supported-platforms>

---

#### 2. Install Git

- **Windows:**

  - Download Git: [Git for Windows](https://git-scm.com/download/win)
  - Install using default settings and verify in **Git Bash**.

- **Mac:**

  - Download Git: [Git for Mac](https://git-scm.com/download/mac)
  - Install using default settings and verify in **Terminal**.

- **Linux:**

  - Follow official installation guide : <https://git-scm.com/install/linux>

---

### 📥 3. Clone the Repository

Open Terminal (Linux and Mac) or Windows Terminal/Powershell/Command Prompt (Windows) and run:

```bash
git clone https://github.com/amrit-eu/Argo-Toolbox.git
cd Argo-Toolbox
```

This downloads the Toolbox code onto your computer.

---

### ⚙️ 4. Configure the Environment

1. In the project folder, locate the `.env.demo` file.
2. Copy the file and rename the copy `.env`.
3. The .env file contains a working default configuration. If you wish to customise the configurations, open `.env` using your favorite text editor and adjust values according to your needs (Configuration options are described in the `.env.docs` file).
4. Modify the value of `COMPOSE_PROFILES` to enable or disable services as needed.
   ⚠️ Warning ⚠️ An issue prevents the local webserver from starting if the Jupyter service is not running. For the moment, please keep `jupyter` in the list of services in `COMPOSE_PROFILES`.

The webserver will always be enabled as it is necessary to access other services.

The `argo_nginx.conf.template` file is needed and **must not** be changed.

---

### ▶ Launch Services (No Terminal Expertise Needed)

You can run the Toolbox API locally using either Podman Desktop or Docker Desktop.
Pick the option that matches what you installed on your computer.

💼 Before running the containers you will need the following:

- Docker Desktop or Podman Desktop installed (see step 1 in the installation guide)
- A clone of the [Argo Toolbox](https://github.com/amrit-eu/Argo-Toolbox) repository (see steps 2 and 3 in the installation guide)
- A `.env` file to configure the environment for the services (see step 4 in the installation guide)

---

#### If using Podman Desktop

1. Launch Podman Desktop
2. The Argo Toolbox repository contains a `compose.yaml` file. Open a terminal and navigate to the folder containing this file. 
3. Run the following command in the terminal to pull all the required images.

   ```bash
   podman compose --file compose.yaml up --detach
   ```

4. You can view all the containers in the Podman Desktop UI. This detects the compose labels and displays the container group or group of containers.
   for example
   ![alt text](/assets/images/podman.png)
5. If the containers have not started click on the 'play'⏯️ icon against the container.
6. To stop any container click on the 'stop'⏹️ icon
7. If you wish to delete a container or a group of containers, click the delete icon(🗑) for that container.
8. To view logs or accessing a container terminal:
    - Click on the container you want to inspect.

   Four tabs will appear: Summary, Logs, Inspect, and Terminal.

   - Click Logs to view the container’s log output.
   - Click Terminal if you want to open a shell inside the container to interact with it directly.

#### If using Docker Desktop

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

   ![alt text](/assets/images/image-1.png)

5. Stop all services

   To stop everything safely, click:

   👉 **⏹ Stop**

6. Restart if needed

   You can restart the entire stack by clicking:

   👉 **⟳ Restart**

#### 💡 Optional: Command Line (for advanced users)

##### 🚀 Launch services

If you prefer using a terminal:

Launch all services :

```bash
docker compose up -d
```

View services status :

```bash
docker compose ps
```

You should see something like that :
![alt text](/assets/images/image-2.png)

Stop services :

```bash
docker compose down
```

---

##### 🛑 Troubleshooting Docker

###### View logs

```bash
docker compose logs -f
```

This will display the logs of all the containers and the flag -f will keep streaming the output as logs appear

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

- **Decoder API**: <http://localhost:8080/argo-toolbox/api/decoder/docs>
- **File Checker API**: <http://localhost:8080/argo-toolbox/api/file-checker/docs>
- **JupyterLab**: <http://localhost:8080/argo-toolbox/jupyterlab>
- **Home page**: <http://localhost:8080/>

### Using Decoder

To be completed....

### Using Argo Netcdf File Checker

The file checker endpoint will then be available on <http://localhost:8080/argo-toolbox/api/file-checker/check-files> (POST method).

The DAC for the files needs to be specified as a parameter and the files to check need to be included in the body of a `multipart/form-data` type request, e.g.

For example, post a file to `http://localhost:8080/argo-toolbox/api/file-checker/check-files?dac=coriolis`.

Example files can be found <https://github.com/OneArgo/ArgoFormatChecker/tree/main/demo/inputs>

```http request
curl -X 'POST' \
  'http://localhost:8080/argo-toolbox/api/file-checker/check-files?dac=coriolis' \
  -H 'accept: application/json' \
  -H 'Content-Type: multipart/form-data' \
  -F 'files=@2903996_meta.nc'
```

### 🧪 Using JupyterLab

JupyterLab gives you an interactive Python workspace.

The following assumes that the services (file checker, decoder) required for your various notebooks are started.

#### Open JupyterLab

Navigate to: <http://localhost:8080/argo-toolbox/jupyterlab>

In the case it asks you a password, you will need to consult the juypyterLab container's logs :

- go to Docker Desktop, containers and click on the Jupyterlab.

or

- use the following command :

```bash
docker compose logs -f jupyterlab
```

In the first lines of logs when the container started, you should see a link of the jupyterlab's path along with a token. Use this link to connect to Jupyterlab. Example (be aware that the token change at each run) :

![alt text](/assets/images/image-4.png)

Then It should open automatically in your browser :

![alt text](/assets/images/image.png)

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

![alt text](/assets/images/image-3.png)

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
- Docker Desktop/Podman Desktop version
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
