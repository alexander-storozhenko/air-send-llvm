module CommandsHelper
    macro return_found(method)
        result = {{method}}
        return result if result
    end

    def first_main_option(string : String)
        all_options(string).first
    end

    def first_main_option_raw(string : String)
        all_options_raw(string).first
    end

    def first_suboption(string : String)
        all_suboptions(string).first
    end

    def suboption_count(option_string : String)
        all_suboptions(option_string).size
    end

    def has_suboption?(option_string)
        suboption_count(option_string) > 0
    end

    def all_suboptions(string)
        string.gsub(/\s+/, " ").split(" ").skip(1)
    end

    def all_options_raw(string)
        string.strip.chomp.split("-").reject{|e| e.empty? }
    end

    def all_options(string)
        all_options_raw(string).map{|e| e.split(" ").first }
    end
end