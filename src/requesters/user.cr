require "./base"

module Requester
    class User < Base
        private property root = "users"

        def signin(content)
            api_post(build_subpath(root, "sign_in"), content)
        end

        def signup(content)
            api_post(build_subpath(root, "sign_up"), content)
        end
    end 
end


