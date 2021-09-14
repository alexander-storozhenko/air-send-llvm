require "../helpers/logic_helper"
require "../helpers/io_helper"
require "../requesters/user_requester"
require "../requesters/responses/user_response"
require "../exceptions/validate_params_exception"
require "../store"

module Logic
    class User
        include IOHelper
        include RequestHelper

        private property response : Response::User | Response::Error

        def initialize
            @response = Response::User.new(jwt = "", status_code = -1)
        end

        def signin
            loop do 
                output "Email: "
                email = input
        
                output "Password: "
                password = input

                @response = Requester::User.new.signin({texts: {email: email, password: password}})
                
                output_result(@response, "You are signed in!")
            end

            Store.instance.add({"jwt" => @response.as(Response::User).jwt})
        end 

        def signup
            loop do 
                output "Email: "
                email = input
        
                raise ValidateParamsException.new(["Email"]) if !email || !Valid.email?(email)

                output "Password: "
                password = input

                @response = Requester::User.new.signup({texts: {email: email, password: password}})

                output_result(@response, "You are signed up!")

            rescue err : ValidateParamsException 
                next output_error(err.message, true) 
            end

            Store.instance.add({"jwt" => @response.as(Response::User).jwt})
        end

        macro output_result(response, success_string)
            if response_success?(response)
                break output_success({{success_string}}, true)
            else 
                next output_error(response.as(Response::Error).error, true)
            end
        end 
    end
end