require "dotenv"
require "./requesters/message"
require "./requesters/user"

require "./options/parser"

module AirSend::Client
    VERSION = "0.1.0"
    Dotenv.load(path: ".env")

    puts "air-send v#{VERSION} (-signin, -signup, -help)"

    # puts Requester::User.new.signup({texts: {email: "dev1@kek", password: "123456"}})
    # puts Requester::User.new.signin({texts: {email: "dev1@kek", password: "123456"}})
    Option::Parser.new.parse
    puts "\e[31mKEK"
end