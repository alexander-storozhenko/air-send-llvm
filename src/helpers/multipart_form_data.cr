class MultiPartFormData
    property io : IO::Memory
    property size : Int32
    def initialize(name, filename, file, boundary=nil)
      @boundary = boundary || "boundary"
      first = [boundary_line, content_disposition(name, filename), "", ""].join("\r\n")
      last = ["", boundary_last, ""].join("\r\n")
      @io = IO::Memory.new
      @io << IO::Memory.new(first)
      IO.copy(file, @io)
      @io << IO::Memory.new(last)
      @size = @io.size
    end
    def content_type
      "multipart/form-data; boundary=#{@boundary}"
    end
    def boundary_line
      "--#{@boundary}"
    end
    def boundary_last
      "--#{@boundary}--"
    end
    def content_disposition(name, filename)
      "content-disposition: form-data; name=\"#{name}\"; filename=\"#{filename}\""
    end
    def size
      @size
    end
  end