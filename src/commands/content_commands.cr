require "../logics/content_logic"

module Commands
	class Content
		def parse(string)
            case string
            when "-send"
                Logic::Content.new.send
            end
        end
	end
end
