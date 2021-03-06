require 'csv'    

module FileParser
  class CSVRecordParser
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
