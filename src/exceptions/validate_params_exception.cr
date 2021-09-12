    class ValidateParamsException < Exception
        def initialize(params = [] of String)
            @message = "Invalid #{params.join(",")}"
        end        
    end
