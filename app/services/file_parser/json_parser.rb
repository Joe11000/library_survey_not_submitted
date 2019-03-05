require 'json'

module FileParser
  class JSONParser
    def self.call file 
      json_text = File.read(file)
      hash = JSON.parse(json_text)

      # return consistent result syntax as multi upload and single upload
      if(hash.dig('records').is_a? Array )
        return hash['records']
      else
        return [ hash['records'] ]
      end
    end
  end
end

# json can come in like either 
    # { 
    #   'records': { 
    #                'record': {title:, ... }
    #              }
    # }

# or

    # { 
    #   'records': { 
    #                'record': [
    #                             {title:, ... }, 
    #                             {title:, ... }
    #                           ]
    #              }
    # }

# returns 