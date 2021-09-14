require "./user_commands"
require "./content_commands"
require "./props"
require "../helpers/commands_helper"

module Commands
    class Parser
        include Props
        include CommandsHelper

        def initialize
            @user_commands = User.new
            @content_commands = Content.new
        end

        def start_loop
            loop { parse((gets || "").chomp) }
        end
        
        private def parse(string : String)
            return_found(@user_commands.as(User).parse(string))
            return_found(@content_commands.as(Content).parse(string))
        end
    end
end
