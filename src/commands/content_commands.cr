require "../logics/content_logic"
require "../helpers/commands_helper"

module Commands
	class Content
		include CommandsHelper
		
		def parse(string)
           parse_with_options(string)
        end

        private def parse_with_options(string)
            raise "Suboption not exists!" if (cmd = find_with_option(string)) == nil   
           
            case cmd.as(NamedTuple)[:option]
            when "-send"
                Logic::Content.new.send(cmd.as(NamedTuple)[:sub])
            when "-allf"
                Logic::Content.new.all_in_folder(cmd.as(NamedTuple)[:sub])
            end
        end
	end
end
