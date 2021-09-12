require "./base_response"

module Response
    class Error < Base
        property error
        
        def initialize(@status_code : Int32, @error : String)
            super(@status_code)
        end
    end
end