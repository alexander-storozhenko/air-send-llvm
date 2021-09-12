require "./base_requester"
require "./responses/user_response"
require "./responses/error_response"

module Requester
    class User < Base
        private property root = "users"

        def signin(content)
            response = api_post(build_subpath(root, "sign_in"), content)

            return_response(response, Response::User, jwt = response[:content]["access_token"].to_s)
        end

        def signup(content)
            response = api_post(build_subpath(root, "sign_up"), content)

            return_response(response, Response::User, jwt = response[:content]["access_token"].to_s)
        end
    end 
end