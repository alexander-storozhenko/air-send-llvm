require "../requesters/folder_requester"

module Logic
	class Folder

		def list
			jwt = Store.instance.get(:jwt)
			Requester::Folder.new.index(jwt)
		end
	end
end
