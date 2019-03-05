require 'csv'    

module FileParser
  class CSVParser
    def self.call file_location

      csv_text = File.read(file_location)
      csv = CSV.parse(csv_text, :headers => true)
      result = []
      csv.each do |row|
        result << row.to_hash
      end
      result
    end
  end
end


# csv can come in like either 
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