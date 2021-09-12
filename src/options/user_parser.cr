require "validator"
require "../logics/user_logic"

module Option
    module UserParser

        macro parse_user_option(parser)
            parser.on "-up", "sign_up" do
                Logic::User.new.signup
            end
            parser.on "-in", "sign_in" do
                Logic::User.new.signin
            end
        end
    end
end