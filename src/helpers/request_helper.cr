require "http/client"

module RequestHelper
    def http_api_get!(base, path, version)
        HTTP::Client.get(build_api_endpoint(base, path, version))
    end

    def http_api_post!(base, path, body, version)
        HTTP::Client.post(build_api_endpoint(base, path, version), body)
    end

    private def build_api_endpoint(base, path, version)
        "#{base}/api/#{version}/#{path}"
    end
end