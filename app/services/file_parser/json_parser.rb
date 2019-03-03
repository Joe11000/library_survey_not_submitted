require 'json'

module FileParser
  class JSONParser
    def self.call file 
      json_text = File.read(file)
      JSON.parse(json_text)
    end
  end
end