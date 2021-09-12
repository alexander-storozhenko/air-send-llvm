module Response
    class Base
        protected property status_code

        def initialize(@status_code : Int32)
        end
    end
end