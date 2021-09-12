require "./user_commands"

module Commands
    class Parser
        private property user_commands

        def initialize
            @user_commands = User.new     
        end

        def start_loop
            loop do
                string = gets || ""
                parse(string.chomp)
            end
        end
        
        def parse(string : String)
            return_found(@user_commands.parse_all(string))
        end

        private macro return_found(method)
            result = {{method}}
            return result if result
        end
    end
end