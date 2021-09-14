require "./io_helper"
require "./request_helper"

module LogicHelper
    include IOHelper
    include RequestHelper

    macro output_result(response, success_string)
        if response_success?(response)
            break output_success({{success_string}}, true)
        else 
            next output_error(response.as(Response::Error).error, true)
        end
    end
end