require "./base_requester"
require "./responses/folder_response"

module Requester
	class Folder < Base
		private property root = "folders"

		def index(jwt)
			response = api_get(build_subpath(root, ""), {"Access-Token" => jwt})
			
			return_response(response, Response::Folder, list = response[:content])
		end
	end
end
