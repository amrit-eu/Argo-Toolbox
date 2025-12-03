The decoder endpoint will be available by default on <http://localhost:8080/argo-toolbox/api/decoder> (POST method).

The endpoint to decode files for a specific float will be <http://localhost:8080/argo-toolbox/api/decoder/decode_float/{WMONUM}>, with the float's respective WMONUM inserted.
The files to decode need to be included in the body of a `multipart/form-data` type request alongside the metadata information about the float and optional configuration overrides.

```http request
curl -X 'POST' TBD...
```

#### JupyterLab example

The JupyterLab instance provided by this repository is pre-configured with a notebook demonstrating usage of the Decoder API.
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

#### 🐚 curl (Bash / Zsh)

```bash
curl http://localhost:8080/<endpoint>
```

#### PowerShell

```powershell
Invoke-WebRequest -Uri "http://localhost:8080/<endpoint>" |
    Select-Object -ExpandProperty Content
```
