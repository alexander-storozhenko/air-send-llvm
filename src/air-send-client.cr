require "dotenv"
require "./requesters/message"

module AirSend::Client
    VERSION = "0.1.0"
    Dotenv.load(path: ".env")

    puts "air-send v#{VERSION} (-signin, -signup, -help)"

    Requester::Message.new.send({files: {file: "./test.py"}, texts: {to_chats: 1, text: "abc"}})
end