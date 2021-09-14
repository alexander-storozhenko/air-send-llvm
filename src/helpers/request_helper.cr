require "http"
require "json"

module RequestHelper
    def http_api_get!(base, path, version)
        p build_api_endpoint(base, path, version)
        response = HTTP::Client.get(build_api_endpoint(base, path, version))
        p response
        {content: JSON.parse(response.body.lines.first), code: response.status_code}
    end

    def http_api_post!(base, path, files, texts, version)
        send_form_data!(build_api_endpoint(base, path, version), files, texts)
    end

    def response_success?(response)
        return response.class != Response::Error
    end

    macro response_default_fileds
        property status_code
    end

    private def build_api_endpoint(base, path, version)
        "#{base}/api/#{version}/#{path}"
    end

    private def send_form_data!(url, file_fields, text_fields)
        IO.pipe do |reader, writer|
            channel = Channel(String).new(1)

            spawn do
                HTTP::FormData.build(writer) do |formdata|
                    channel.send(formdata.content_type)
                    
                    text_fields.each do |key, value|
                        formdata.field(key.to_s, value.to_s)
                    end
                   
                    file_fields.each do |name, path|
                        name = name.to_s
                        form_file = open_form_file(formdata, name, path)
                        formdata.file(name, form_file[:file], form_file[:metadata], form_file[:headers])
                    end
                end

                writer.close
            end
            
            headers = HTTP::Headers{"Content-Type" => channel.receive}     
            response = HTTP::Client.post(url, body: reader, headers: headers)

            {content: JSON.parse(response.body.lines.first), code: response.status_code}
       end
    end

    private def open_form_file(formdata, name, path)
        file = File.open(path)
        metadata = HTTP::FormData::FileMetadata.new(filename: "test.txt")
        headers = HTTP::Headers{"Content-Type" => "multipart/form-data"}

        {file: file, metadata: metadata, headers: headers}
    end
end