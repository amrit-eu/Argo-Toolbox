import matlab.net.*
import matlab.net.http.*
import matlab.net.http.io.*

url = "http://host.docker.internal:8080/argo-toolbox/api/decoder/decode_float/6903014";
file_dir = "/home/data";
float_info = jsondecode(fileread(fullfile(file_dir, "info_json.json")));
meta_info  = (fileread(fullfile(file_dir, "meta_info.json")));
extra_args = struct( ...
    "DIR_OUTPUT_XML_FILE", "/mnt/data/output/xml/" ...
);
float_metadata = jsonencode(struct( ...
    "float_info", float_info, ...
    "float_meta_info", meta_info));
configuration_override = jsonencode(extra_args);

txt_files = dir(fullfile(file_dir, "*.txt"));
file_paths = fullfile({txt_files.folder}, {txt_files.name});
files_provider = FileProvider(file_paths);

provider = MultipartFormProvider( ...
    "files", files_provider, ...
    "float_metadata", StringProvider(float_metadata), ...
    "configuration_override", StringProvider(configuration_override) ...
);

req = RequestMessage(matlab.net.http.RequestMethod.POST, [], provider);
resp = req.send(url);

fprintf("HTTP status: %s\n", string(resp.StatusCode));

if resp.StatusCode == 200
    zipData = uint8(resp.Body.Data);
    fid = fopen("/home/data/output.zip", "wb");
    fwrite(fid, zipData, "uint8");
    fclose(fid);
    disp("ZIP file saved as output.zip");
else
    disp("Request failed:");
    disp(resp.Body.string);
end