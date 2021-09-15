class Store
    @@_instance : Store | Nil

    getter data
    
    private def initialize
        @data = {} of String => String | Int32 
    end

    def self.instance
        @@_instance = new if @@_instance.nil?

        return @@_instance.as(Store)
    end

    def get(key)
        @data[key.to_s]
    end
    def add(data = {} of String => String | Int32 )
        @data = @data.merge(data)
    end
end