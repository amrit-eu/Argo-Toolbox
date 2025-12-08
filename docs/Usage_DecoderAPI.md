## 🔎 Using the Coriolis Decoder

The decoder endpoint will be available by default on <http://localhost:8080/argo-toolbox/api/decoder> (POST method).

The endpoint to decode files for a specific float will be <http://localhost:8080/argo-toolbox/api/decoder/decode_float/{WMONUM}>, with the float's respective WMONUM inserted.
The files to decode need to be included in the body of a `multipart/form-data` type request alongside the metadata information about the float and optional configuration overrides.

### 🪐 JupyterLab examples

The JupyterLab instance provided by this repository is pre-configured with a notebook demonstrating usage of the Decoder API.
See the [JupyterLab usage instructions](Usage_JupyterLab.md) for details on how to access the instance.

### Constructing Float Configuration Information

Metadata and configuration information about the float whose data is to be decoded must be sent to the API as part of the request.
This is the same information contained in the float metadata file and float decoder configuration files (often named meta.json and info.json).
The configuration information is required by the decoder. The metadata information will be copied into the Meta NetCDF file generated during decoding.
Please see the [Coriolis Decoder Manual](https://github.com/euroargodev/Coriolis-data-processing-chain-for-Argo-floats/tree/main/decArgo_doc/decoder_user_manual)
for information on how to populate this information.

#### Reading Float Configuration Information from existing JSON files (Python)

```python
# Open the info and meta JSONS for the float we want to decode.
with open(r"path/to/info.json") as file:
    float_info = json.loads(file.read())

with open(r"path/to/meta.json") as file:
    meta_info = json.loads(file.read())
```

#### Manually Constructing Float Configuration Information (Python)

```python
import json
float_info = {
    "WMO": "6903014",
    "PTT": "300234068508780",
    "FLOAT_TYPE": "PROVOR",
    # add further float information
}

meta_info = {
    "ARGO_USER_MANUAL_VERSION": "3.1",
    "PLATFORM_NUMBER": "6903014",
    "PTT": "850878",
    "IMEI": "300234068508780",
    # add further metadata information
}

float_metadata = json.dumps({
    "float_info": float_info,
    "float_metadata_info": meta_info
})
```

#### Setting Decoder Options

Additional decoder input parameters can be provided to the Decoder API via an  optional `configuration_override` parameter.
This accepts the parameters usually contained in a decoder config json file, such as in the examples found here: 

https://github.com/euroargodev/Coriolis-data-processing-chain-for-Argo-floats/tree/main/decArgo_soft/config/configuration_sample_files

```python
# Example extra args, used to pass to the decoder and override the default configuration.
extra_args = {
    "DIR_OUTPUT_XML_FILE": "/mnt/data/output/xml/",
}
```

### Example API Requests

##### Python
```python
from pathlib import Path
import requests
import json

url = "http://localhost:8080/argo-toolbox/api/decoder/decode_float/6903014"
file_dir = r"path/to/source/files"

# Source files
files = [
    ("files", (str(Path(file_path).name), open(file_path, "rb"), "text/plain"))
    for file_path in Path(file_dir).glob("*.txt")
]

# Float configuration information
with open(r"mockfiles_6903014/info_json.json") as file:
    float_info = json.loads(file.read())

with open(r"mockfiles_6903014/meta_info.json") as file:
    meta_info = json.loads(file.read())
data = {
    "float_metadata": json.dumps(
        {
            "float_info": float_info,
            "float_meta_info": meta_info,
        }
    ),
    "configuration_override": json.dumps(extra_args),  # optional
}

# API request
response = requests.post(url, files=files, data=data)
```

##### CURL 
```bash
curl -X "POST" \
  "http://localhost:8080/argo-toolbox/api/decoder/decode_float/6903014" \
  -H "accept: application/json" \
  -H "Content-Type: multipart/form-data" \
  -F 'files=@co_20190527T085840Z_300234068508780_000001_000000_18220.txt;type=text/plain' \
  -F 'float_metadata={"float_info":{"WMO":"6903014","PTT":"300234068508780","FLOAT_TYPE":"PROVOR","DECODER_VERSION":"5.45", ...},"float_meta_info":{"ARGO_USER_MANUAL_VERSION":"3.1","PLATFORM_NUMBER":"6903014","PTT":"850878","IMEI":"300234068508780", ...}}' \
  -F 'configuration_override={"DIR_OUTPUT_XML_FILE":"/mnt/data/output/xml/"}'
```




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
