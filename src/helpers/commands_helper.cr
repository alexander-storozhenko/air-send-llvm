module CommandsHelper
    macro return_found(method)
        result = {{method}}
        return result if result
    end

    def find_with_option(string)
        res = /-\S+ \S+/.match string

        return if res == nil
        splitted = res.as(Regex::MatchData).string.split(' ')
       
        {option: splitted[0], sub: splitted[1]}
    end
end