module FileParser
  class XMLParser
    def self.call file 
      xml_text = File.read(file)
      hash = Hash.from_xml(xml_text)
      
      # return consistent result syntax as 
      if(hash.dig('records', 'record').is_a? Array )
        return hash['records']['record']
      else
        return [ hash['records']['record'] ]
      end
    end
  end
end


# xml can come in like either 
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