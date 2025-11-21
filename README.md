# Argo Toolbox API
A step‑by‑step guide to install, run, and explore the **Toolbox API** locally.
This documentation is tailored for **non‑technical users**, with simple instructions and no prior Docker experience required.

The APIs are delivered as container images and can be run locally using a container runtime (Docker or Podman).

At the end of the setup, the apis will be running in their docker containers and you will be able to call the various endpoints.

## 🧰 Prerequisites

Regardless of the operating system, you will need **Docker** and **Git**.

A desktop UI to create,manage and run all your docker containers.

<ul>Pick any one option for local testing.

+ Option A — Podman Desktop (recommended): If you have not installed, download and install Podman Desktop, open it, and use the GUI to run the container (instructions below).

+ Option B — Docker Desktop: If you have not installed, download and install Docker Desktop, open it, and use the GUI to run the containers (instructions below).
</ul>

### 1.🦭 **podman desktop**

You can install Podman Desktop on.
- Windows:  [podman desktop](https://podman-desktop.io/).
- macOS : [podman desktop](https://podman-desktop.io/docs/installation/macos-install)
- linux : [podman desktop](https://podman-desktop.io/docs/installation/linux-install)

If you prefer using docker desktop then follow steps to install docker desktop(step 2) else move on to step 3.

---
### 2.🐳 Docker desktop

### 3. 😺 **git**

####  3.1. Install Git
---
## 🖥️ Detailed local Deployment Guide

### 6. 🚀 Launch Services (No Terminal Expertise Needed)

You can run the Toolbox API locally using either podman Desktop or Docker Desktop.
Pick the option that matches what you installed on your computer.

💼 Before running the containers you will need the following.

+ Clone of the Argo toolbox repository.
+ All the configuration setup correctly.
+ Docker desktop or podman desktop installed.

if you do not have the repository containing the toolbox please clone it.
### 📥 6.1  Clone the Repository

---
### 6.2. ⚙️ Configure the Environment

---

### 6.2. 🎢 Spin up containers
#### 6.2.1 If using podman desktop
 1. Launch podman desktop
 2. You will notice a compose.yml in the toolbox.
 Run the following command in a terminal to pull all the required images.
 ```bash
 $ podman compose --file compose.yaml up --detach
 ```
 3. You can view all the containers in the podman desktop. The desktop detects the compose labels and displays the container group or group of containers.
 for example
 ![alt text](assets\images\podman.png)
 4. If the containers have not started click on the 'play'⏯️ icon against the container.
 5. Alternatively to stop any container click on the 'stop'⏹️ icon
 6. If you wish to delete a container or a group of containers, click the delete icon(🗑) for that container.
7. Viewing logs or accessing a container terminal.
    Click on the container you want to inspect.
<ul>
Four tabs will appear:  Summary, Logs, Inspect, and Terminal.

  - Click Logs to view the container’s log output.
  - Click Terminal if you want to open a shell inside the container to interact with it directly.
 </ul>

#### 6.2.2 If using docker desktop

#### 6.2.3  Command Line (for advanced users)
