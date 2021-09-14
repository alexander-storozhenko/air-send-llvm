module IOHelper

    DEFAULT_COLOR = "\e[0m"
    ERROR_COLOR = "\e[31m"
    PRIMARY_COLOR = "\e[32m"

    def input
        get_string.chomp
    end

    def output(string, new_line = false)
        format_print(usual_color(string), new_line)
    end

    def output_success(string, new_line = false)
        format_print(success_color(string), new_line)
    end

    def output_error(string, new_line = false)
        format_print(error_color(string), new_line)
    end

    def exit_success(string)
        output_success(string, true)
        exit
    end

    def exit_error(string)
        output_error(string, true)
        exit
    end

    def get_file_name(file_path)
		file_path.split("/")[-1]
	end

    macro output_error_with_retry(string)
        output(error_color(error_format({{string}})), true)
        next
    end

    private def format_print(string, new_line)
        return puts string if new_line

        print string
    end

    private def get_string
        gets || ""
    end

    private macro error_format(error)
        "Error: #{{{error}}}"
    end

    # --------- COLORS ---------

    private macro error_color(string)
        "#{ERROR_COLOR}#{string}#{DEFAULT_COLOR}"
    end

    private macro usual_color(string)
        "#{DEFAULT_COLOR}#{string}#{DEFAULT_COLOR}"
    end

    private macro success_color(string)
        "#{PRIMARY_COLOR}#{string}#{DEFAULT_COLOR}"
    end
end