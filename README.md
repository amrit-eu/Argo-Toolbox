# Argo Toolbox API

## Docker compose

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

#Configure which service to enable (decoder,checker,jupyter) separated by a comma. will be run with 'docker compose up'
COMPOSE_PROFILES=decoder,checker,jupyter
```

webserver will always be enabled as it is necessary to access others services.

