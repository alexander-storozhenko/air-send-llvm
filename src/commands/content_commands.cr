require "../logics/content_logic"
require "../helpers/commands_helper"
require "../store"

module Commands
	class Content
		include CommandsHelper
		
		def parse(string)
           parse_with_options(string)
        end

        private def parse_with_options(string)
            option = first_main_option(string)
            option_with_sub = first_main_option_raw(string)

            case option
            when "send"
                raise "Must be path to file!" if !has_suboption?(option_with_sub)
                sub = first_suboption(option_with_sub)

                Logic::Content.new.send(sub)
            when "allf"
                raise "Must be file name!" if !has_suboption?(option_with_sub)
                sub = first_suboption(option_with_sub)

                Logic::Content.new.all_in_folder(sub)
            end
        end
	end
end
