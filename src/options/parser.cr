require "option_parser"
require "./user_parser"
require "../logics/user_logic"
module Option
    class Parser
        include UserParser
    
        def parse
            parse_options
        end

        private def parse_options
            OptionParser.parse do |parser|
                parse_user_option(parser)
            end
        end
    end
end