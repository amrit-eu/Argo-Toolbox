## 🧪 Using JupyterLab

JupyterLab gives you an interactive Python workspace.

The following assumes that the services (file checker, decoder) required for your various notebooks are started.

### Open JupyterLab

Navigate to: <http://localhost:8080/argo-toolbox/jupyterlab>

If a password is required, you will need to consult the JupyterLab container's logs.
In the first lines of logs when the container started, you should see a link to JupyterLab containing a token. Use this link to connect to JupyterLab. Be aware that the token will change with each run.

![JupyterLab container logs with token](/assets/images/image-4.png)

### Accessing container logs
#### Docker Desktop
- Go to the Docker Desktop UI > **Containers** > **jupyterlab** to view container logs

or

- Use the following command:
    ```bash
    docker logs jupyterlab
    ```

#### Podman Desktop
- Go to the Podman Desktop UI > **Containers** > **jupyterlab** > **Logs** to view container logs

or

- Use the following command:
    ```bash
    podman logs jupyterlab
    ```

### 📂 Example Notebooks

The project includes example Jupyter notebooks, found in the  in jupyter/examples/notebooks folder.
Included are examples demonstrating how to:

- Work with Git LFS data
- Decode source files
- Validate Argo NetCDF files

---

#### 🔄 Pull Git Large File Storage (LFS) data
This repository uses Git Large File Storage to store real-world example data files that you can test the Toolbox with.
Depending on your settings, this data may not be downloaded automatically when you first clone the repo.

To use Git LFS, you'll need to download and install a new program that's separate from Git. 
Installation instructions can be found here: [Installing Git Large File Storage](https://docs.github.com/en/repositories/working-with-files/managing-large-files/installing-git-large-file-storage).

To manually pull the example data for this repo, use the following commands:

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