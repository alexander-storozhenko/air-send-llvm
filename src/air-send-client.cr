require "./messages"

module Air::Send::Client
  VERSION = "0.1.0"

  def init
    puts "air-send v#{VERSION} (-signin, -signup, -help)"
  end
end