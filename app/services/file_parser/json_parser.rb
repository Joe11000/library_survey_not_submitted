require 'json'

module FileParser
  class JSONParser
    def self.call file 
      json_text = File.read(file)
      hash = JSON.parse(json_text)

      # return consistent result syntax as multi upload and single upload
      if(hash.dig('records', 'record').is_a? Array )
        return hash['records']['record']
      else
        return [ hash['records']['record'] ]
      end
    end
  end
end