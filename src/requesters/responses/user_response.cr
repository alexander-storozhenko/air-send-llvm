require "./base_response"

module Response
    class User < Base
        property jwt
        
        def initialize(@jwt : String, @status_code : Int32)
            super(@status_code)
        end
    end
end