require "../requesters/content_requester"
require "../store"
module Logic
	class Content
		include IOHelper
		include RequestHelper

		def send(file_path)
			jwt = Store.instance.get(:jwt)

			file_name = get_file_name(file_path)
			response = Requester::Content.new.send({texts: {text: file_name}, files: {file: file_path}}, jwt)

			output_result(response, "File sended!")
		end

		def all_in_folder(folder_name)
			response = Requester::Content.new.all_in_folder(folder_name)
			
			output_result(response, "Files in folder #{folder_name}:")
		end

		macro output_result(response, success_string)
            if response_success?(response)
                output_success({{success_string}}, true)
            else 
                output_error(response.as(Response::Error).error, true)
            end
        end 
	end
end
