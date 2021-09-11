require "dotenv"
require "./requesters/message"
require "./requesters/user"

require "./options/parser"

module AirSend::Client
    VERSION = "0.1.0"
    Dotenv.load(path: ".env")

    puts "air-send v#{VERSION} (-signin, -signup, -help)"
    
    Option::Parser.new.parse
end