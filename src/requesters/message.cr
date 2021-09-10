require "./base"

module Requester
    class Message < Base
        def send(content)
            api_post("messages", content)
        end

        def debug
            api_get("messages/all_in_chat/1")
        end
    end 
end


