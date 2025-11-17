# Argo Toolbox API

## Docker compose

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
- **JupyterLab**: <http://localhost:8080/argo-toolbox/jupyterlab>
- **Home page**: <http://localhost:8080/>

### Direct API Access (bypassing webserver)

By default :

- **Decoder API**: <http://localhost:8001/>
- **File Checker API**: <http://localhost:8000/>
- **JUPYTERLAB**: <http://localhost:8002/argo-toolbox/jupyterlab>

### Configuration

The `argo_nginx.conf` is needed but should not be changed.
All configuration is done via an `.env` file:

```env
#file checker API configuration
FILECHECKERAPI_IMAGE=ghcr.io/oneargo/argoformatchecker/python-api
FILECHECKERAPI_IMAGE_TAG=latest
FILECHECKER_PORT=8000

#decoder API configuration
ARGODECODERAPI_IMAGE=boilerplateapi # to change with decoder image
ARGODECODERAPI_IMAGE_TAG=latest
DECODER_PORT=8001
DECODER_USER_UID=1000
DECODER_USER_GID=1000

#jupyterlab configuration :
JUPYTERLAB_IMAGE=quay.io/jupyter/datascience-notebook
JUPYTERLAB_IMAGE_TAG=python-3.13
JUPYTER_PORT=8002 # if changed, change also in nginx conf
JUPYTER_USER_UID=1000

#webserveur NGINX configuration
WEBSERVER_PORT=8080

#Configure which service to enable (decoder,checker,jupter,webserver) separated by a comma. will be run with 'docker compose up'
COMPOSE_PROFILES=decoder,checker,jupyter,webserver 
```

If webserver is disabled, the services (file checker, decoder, jupyterlab) will be available directly with the ports defined (localhost:8000 by default for file checker and localhost:8001 for decoder and localhost:8002 for jupyterlab).

