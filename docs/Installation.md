## 🖥️ Local Installation Guide
This section provides installation instructions for Windows, Mac, and Linux. Follow the steps relevant to your operating system.

### 🛠 Prerequisites

Regardless of the operating system, you will need to install **Git** and a **containerisation platform** like Docker or Podman.

A containerised application is packaged into a single, lightweight unit with everything it needs to run so it works the same
on any computer. This also allows the application to run in an isolated environment without needing a full virtual machine,
making it easier to share, move, and run reliably.

Podman Desktop or Docker Desktop are two available options of containerisation platforms. They both provide desktop UIs to create, manage and run app containers.
Choose one of these options and follow the steps below to download and install it.

#### 1. 🫙 Containerization Platform
###### Option 1: 🦭 Podman Desktop

You can install Podman Desktop on:

- Windows: [Podman Desktop](https://podman-desktop.io/).
- MacOS : [Podman Desktop](https://podman-desktop.io/docs/installation/macos-install)
- Linux : [Podman Desktop](https://podman-desktop.io/docs/installation/linux-install)

---

###### Option 2: 🐳 Docker Desktop

Administrator privileges are required to install Docker Desktop, but it may be installed so that it can be run
by a non-administrator user. See the following article for more information: [How do I run Docker Desktop without administrator privileges?](https://docs.docker.com/desktop/troubleshoot-and-support/faqs/general/#how-do-i-run-docker-desktop-without-administrator-privileges)

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

Open Terminal (Linux and Mac) or Windows Terminal, Powershell, or Command Prompt (Windows) and run:

```bash
git clone https://github.com/amrit-eu/Argo-Toolbox.git
cd Argo-Toolbox
```

This downloads the Toolbox code onto your computer.

---

### ⚙️ 4. Configure the Environment

1. In the project folder, locate the `.env.demo` file.
2. Copy the file and rename the copy to `.env`.
3. The `.env` file contains a working default configuration. If you wish to customise the configurations, open `.env` using your favorite text editor and adjust values according to your needs. Configuration options are described in the `.env.docs` file.
4. Modify the value of `COMPOSE_PROFILES` to enable or disable services as needed.

   ⚠️ Warning ⚠️ An issue prevents the local webserver from starting if the Jupyter service is not running. For the moment, please keep `jupyter` in the list of services in `COMPOSE_PROFILES`.

The webserver will always be enabled as it is necessary to access other services.

The `argo_nginx.conf.template` file provides webserver configuration and **must not** be changed.

---

### ▶️ Launch Services

You can run the Toolbox API locally using either Podman Desktop or Docker Desktop.
Pick the option that matches what you installed on your computer.

💼 Before running the containers you will need the following:

- Docker Desktop or Podman Desktop installed (see step 1 in the installation guide)
- A clone of the [Argo Toolbox](https://github.com/amrit-eu/Argo-Toolbox) repository (see steps 2 and 3 in the installation guide)
- A `.env` file to configure the environment for the services (see step 4 in the installation guide)

#### If using Podman Desktop

1. Launch Podman Desktop
2. The Argo Toolbox repository contains a `compose.yaml` file. Open a terminal and navigate to the folder containing this file.
3. Run the following command in the terminal to pull all the required images.

   ```bash
   podman compose --file compose.yaml up --detach
   ```

4. You can view all the containers in the Podman Desktop UI. This detects the compose labels and displays the group of containers.
   ![Podman UI example screenshot](/assets/images/podman.png)
5. If the containers have not started, click on the 'play' (▶️) icon against the container.
6. To stop any container, click on the 'stop' (⏹️) icon
7. If you wish to delete a container or a group of containers, click the 'delete' icon (🗑) for that container.
8. To view logs or access a container terminal:
    - Click on the container you want to inspect.

   Four tabs will appear: Summary, Logs, Inspect, and Terminal.

    - Click Logs to view the container’s log output.
    - Click Terminal if you want to open a shell inside the container to interact with it directly.

#### If using Docker Desktop

1. Launch Docker Desktop and wait for the startup process to complete.

2. Open the _Containers_ view

   In the left sidebar, click:

   **Containers → [your-repo-name]**

   You should see a list of services defined in `compose.yaml`.

3. Start all services

   Next to the project name, click **▶ Start**

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

   To stop everything safely, click **⏹ Stop**

6. Restart if needed

   You can restart the entire stack by clicking **⟳ Restart**

#### 💡 Optional: Launch services from Command Line (for advanced users)

If you prefer using a terminal:

**Launch all services:**

```bash
podman compose up -d
```
```bash
docker compose up -d
```


View service status:

```bash
podman compose ps
```
```bash
docker compose ps
```

You should see output similar to:
![Compose ps command example terminal output](/assets/images/image-2.png)

**Stop services:**

```bash
podman compose down
```
```bash
docker compose down
```
---
### 🛑 Troubleshooting 

#### View logs

```bash
podman compose logs -f
```
```bash
docker compose logs -f
```

This will display the logs of all the containers. The flag `-f` will keep streaming the output as logs appear.
Alternatively, access the logs for a single container using

```bash
podman logs -f <container-name>
```
```bash
docker logs -f <container-name>
```

#### Restart everything

```bash
podman compose down
podman compose up -d
```
```bash
docker compose down
docker compose up -d
```

#### Check container status

```bash
podman compose ps
```
```bash
docker compose ps
```