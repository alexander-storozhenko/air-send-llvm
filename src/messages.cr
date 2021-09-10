require "http/client"

module Air::Send::Client
    module Messages
        def self.send(content)
            response = HTTP::Client.get "http://www.example.com"
            puts response.status_code 
        end
    end
end