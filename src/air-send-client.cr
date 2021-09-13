require "dotenv"
require "./options/parser"
require "./commands/parser"
require "macros"
module AirSend::Client
    VERSION = "0.1.0"
    Dotenv.load(path: ".env")

    puts "air-send v#{VERSION} (--signin, --signup, --help)"
    
    # Commands::Parser.new.start_loop
    macro test(m) 
        {{m.id}}.new.start_loop
    end
    


    test("Commands::Parser")

    # Option::Parser.new.parse
    # p Store.instance.add({"a" => 1})


end