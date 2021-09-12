class Store
    @@_instance : Store | Nil

    private def initialize
        @data = {} of String => String | Int32 
    end

    def self.instance
        return new if !@@_instance
    
        return instance
    end

    def add(data = {} of String => String | Int32 )
        @data.merge(data)
    end
end