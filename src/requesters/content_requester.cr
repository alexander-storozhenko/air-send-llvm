require "./base_requester"
require "./responses/success_response"

module Requester
	class Content < Base
        private property root = "contents"

		def send(content)
			response = api_post(build_subpath(root, ""), content)

            return_response(response, Response::Success)
		end
	end
end
