require "../logics/folder_logic"

module Commands
	class Folder
        include CommandsHelper

		def parse(string)
			option = first_main_option(string)

			case option
			when "dirs"
				p Logic::Folder.new.list
			end
		end
	end
end
