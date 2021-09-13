require "../logics/content_logic"
require "../helpers/commands_helper"

module Commands
	class Content
		include CommandsHelper
		
		def parse(string)
            
            cmd = find_with_option(string)

            raise "Suboption not exists!" if cmd == nil
            
            case cmd.as(NamedTuple)[:option]
            when "-send"
                Logic::Content.new.send(cmd.as(NamedTuple)[:sub])
            end
        end
	end
end
