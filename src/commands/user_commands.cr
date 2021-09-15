require "../logics/user_logic"
require "../helpers/commands_helper"

module Commands
    class User
        include CommandsHelper

        # TODO: subcommands support
        def parse(string)
            option = first_main_option(string)

            case option
            when "in"
                Logic::User.new.signin
            when "up"
                Logic::User.new.signup
            end
        end
    end
end