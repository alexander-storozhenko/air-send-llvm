require "dotenv"
require "./options/parser"
require "./commands/parser"
require "macros"
module AirSend
    VERSION = "0.1.0"
    Dotenv.load(path: ".env")

    puts "air-send v#{VERSION} (--signin, --signup, --help)"
    
    Commands::Parser.new.start_loop
end