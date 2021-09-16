module Response
    class Folder < Base
        property list
        
        def initialize(@list : String, @status_code : Int32)
            super(@status_code)
        end
    end
end