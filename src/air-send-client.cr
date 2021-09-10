require "dotenv"
require "./requesters/message"

module Air::Send::Client
    VERSION = "0.1.0"
    Dotenv.load(path: ".env")

    puts "air-send v#{VERSION} (-signin, -signup, -help)"
end