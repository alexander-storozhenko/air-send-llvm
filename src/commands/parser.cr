require "./main_commands"
require "./user_commands"
require "./content_commands"
require "./folder_commands"
require "./init"
require "../helpers/commands_helper"
require "../helpers/io_helper"

module Commands
    class Parser
        include Init
        include CommandsHelper
        include IOHelper

        properties

        def initialize
            initialize_commands
        end

        def start_loop
            loop { parse((input_cmd).chomp) }
        end
        
        private def parse(string : String)
            return_found(@folder_commands.as(Folder).parse(string))
            return_found(@main_commands.as(Main).parse(string))
            return_found(@user_commands.as(User).parse(string))
            return_found(@content_commands.as(Content).parse(string))
        end
    end
end
