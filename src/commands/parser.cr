require "./main_commands"
require "./user_commands"
require "./content_commands"
require "./props"
require "../helpers/commands_helper"
require "../helpers/io_helper"

module Commands
    class Parser
        include Props
        include CommandsHelper
        include IOHelper

        def initialize
            @user_commands = User.new
            @content_commands = Content.new
            @main_commands = Main.new
        end

        def start_loop
            loop { parse((input_cmd).chomp) }
        end
        
        private def parse(string : String)
            return_found(@main_commands.as(Main).parse(string))
            return_found(@user_commands.as(User).parse(string))
            return_found(@content_commands.as(Content).parse(string))
        end
    end
end
