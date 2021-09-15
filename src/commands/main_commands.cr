require "../logics/main_logic"
require "../helpers/commands_helper"

module Commands
    class Main
        include CommandsHelper

        def parse(string)
            case string.strip
            when "exit"
                Logic::Main.new.exit
            end
        end
    end
end