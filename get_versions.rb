require 'rest-client'
require 'json'

def get_versions()
  api_url = 'https://api.github.com/repos/coq/coq/releases'
  JSON.parse(RestClient.get api_url || []).map do |i|
    i["tag_name"] || ""
  end
end

vers = get_versions
File.write("./versions.txt", vers.join("\n")) if vers.length > 0
