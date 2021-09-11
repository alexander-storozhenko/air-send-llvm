require "./request_helper"
require "./io_helper"

module LogicHelper
    include IOHelper
    include RequestHelper

    def output_result(response, success_string)
        if response_success?(response)
            exit_success(success_string)
        else 
            exit_error(response[:content]["error"])
        end
    end
end