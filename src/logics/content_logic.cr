require "../requesters/content_requester"

module Logic
	class Content
		def send(file_path)
			Requester::Content.new.send({texts: {text: "file"}, files: {file: file_path}})
		end
	end
end
