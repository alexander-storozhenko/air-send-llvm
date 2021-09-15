require "../helpers/request_helper"

module Requester
    class Base
        include RequestHelper
    
        def api_get(path, version = "v1")
           with_catch_error(http_api_get!(base_url, path, version))
        end

        def api_post(path, body = {} of String => String, headers = {} of String => String, version = "v1")
            body = {files: {} of String => String, texts: {} of String => String}.merge(body)
            with_catch_error(http_api_post!(base_url, path, body[:files], body[:texts], headers, version))
        end

        macro return_response(response, klass, params)
            return Response::Error.new(status_code = response[:code], error = response[:content]["error"].to_s) if response[:code] >= 400

            {{klass}}.new({{params}}, status_code = response[:code])
        end

        macro return_response(response, klass)
            return Response::Error.new(status_code = response[:code], error = response[:content]["error"].to_s) if response[:code] >= 400

            {{klass}}.new(status_code = response[:code])
        end

        protected def build_subpath(root, subpath)
            "#{root}/#{subpath}"
        end

        private def base_url
            ENV["AIR_SEND_URL"]
        end
        
        private macro with_catch_error(method)
            begin 
                return {{method}}
            rescue err: IO::TimeoutError
                { content: "Timeout error!", code: 408 }
            rescue err: Socket::Addrinfo::Error
                { content: "Not found!", code: 404 }
            rescue err: Socket::ConnectError
                { content: "Connection error!", code: 400 }
            end
        end
    end
end