

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