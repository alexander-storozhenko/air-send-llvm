require "./user_commands"
require "./content_commands"

module Commands
    class Parser
        private property user_commands
        private property content_commands

        def initialize
            @user_commands = User.new
            @content_commands = Content.new
        end

        def start_loop
            loop { parse((gets || "").chomp) }
        end
        
        private def parse(string : String)
            return_found(@user_commands.parse(string))
            return_found(@content_commands.parse(string))
        end

        private macro return_found(method)
            result = {{method}}
            return result if result
        end
    end
end