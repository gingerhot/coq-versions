require 'rest-client'
require 'json'

def get_versions()
  api_url = 'https://api.github.com/repos/coq/coq/releases'
  JSON.parse(RestClient.get api_url || []).sort_by {|r| r["created_at"]}.map do |r|
    r["tag_name"].sub(/^V/, "") || ""
  end
end

vers = get_versions
File.write("./versions.txt", vers.join("\n")) if vers.length > 0
