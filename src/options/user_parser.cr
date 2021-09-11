require "validator"
require "../logics/user_logic"

module Option
    module UserParser

        def parse_user_option(parser)
            parser.on "-signin", "-sign_in" do
                Logic::User.new.signin
            end
        end
    end
end