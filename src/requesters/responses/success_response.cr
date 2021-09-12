require "./base_response"

module Response
    class Success < Base
        def initialize(@status_code : Int32)
            super(@status_code)
        end
    end
end