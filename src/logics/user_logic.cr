require "../helpers/logic_helper"
require "../helpers/io_helper"
require "../requesters/user"

module Logic
    class User
        include LogicHelper
        include IOHelper

        def signin
            loop do 
                output "Email: "
                email = input
        
                output "Password: "
                password = input

                response = Requester::User.new.signin({texts: {email: email, password: password}})
                output_result(response, "You are signed in!")
            end
        end 
    end
end