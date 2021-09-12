require "../logics/user_logic"

module Commands
    class User
        # TODO: subcommands support
        def parse_all(string)
            case string
            when "-in", "--signin"
                Logic::User.new.signin
            when "-up", "--signup"
                Logic::User.new.signup
            end
        end
    end
end