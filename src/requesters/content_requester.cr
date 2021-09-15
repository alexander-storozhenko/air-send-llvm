require "./base_requester"
require "./responses/success_response"

module Requester
	class Content < Base
        private property root = "contents"

		def send(content, jwt)
			response = api_post(build_subpath(root, ""), content, {"Access-Token" => jwt})

            return_response(response, Response::Success)
		end

		def all_in_folder(folder_name)
			response = api_get(build_subpath(root, "all_in_folder/#{folder_name}"))
		
			return_response(response, Response::Success)
		end
	end
end
