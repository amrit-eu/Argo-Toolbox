### 🔎 Using the Argo NetCDF File Checker

The file checker endpoint will be available by default on <http://localhost:8080/argo-toolbox/api/file-checker/check-files> (POST method).

The DAC for the files needs to be specified as a parameter and the files to check need to be included in the body of a `multipart/form-data` type request.
For example, post a file to `http://localhost:8080/argo-toolbox/api/file-checker/check-files?dac=coriolis`.

Example files can be found <https://github.com/OneArgo/ArgoFormatChecker/tree/main/demo/inputs>

```http request
curl -X 'POST' \
  'http://localhost:8080/argo-toolbox/api/file-checker/check-files?dac=coriolis' \
  -H 'accept: application/json' \
  -H 'Content-Type: multipart/form-data' \
  -F 'files=@2903996_meta.nc'
```

#### JupyterLab example

The JupyterLab instance provided by this repository is pre-configured with a notebook demonstrating usage of the File Checker API.
See the [JupyterLab usage instructions](Usage_JupyterLab.md) for details on how to access the instance.


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

#### 🐚 Curl

Curl commands can be executed for example in a Terminal (Linux/Mac), PowerShell/Command Prompt (Windows) or in the JupyterLab terminal.

```bash
curl http://localhost:8080/<endpoint>
```

#### PowerShell

```powershell
Invoke-WebRequest -Uri "http://localhost:8080/<endpoint>" |
    Select-Object -ExpandProperty Content
```