require "../helpers/request_helper"

module Requester
    class Base
        include RequestHelper
    
        def api_get(path, version = "v1")
           with_catch_error(http_api_get!(base_url, path, version))
        end

        def api_post(path, body = nil, version = "v1")
            with_catch_error(http_api_post!(base_url, path, body.to_s, version))
        end

        private macro with_catch_error(method)
            begin 
                {{method}}
            rescue err: IO::TimeoutError
                { error: "Timeout error!", code: 408 }
            rescue err: Socket::Addrinfo::Error
                { error: "Not found!", code: 404 }
            rescue err: Socket::ConnectError
                { error: "Connection error!", code: 400 }
            end
        end

        private def base_url
            ENV["AIR_SEND_URL"]
        end
    end
end