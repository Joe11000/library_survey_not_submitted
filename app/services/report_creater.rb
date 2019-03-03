class ReportCreater
  
  # array of record attributes
  def initialize records:
    @records = records
  end

  def call 
    get_breakdown_of_pages_read_per_category
  end

  private 
    attr_accessor :records

    def get_breakdown_of_pages_read_per_category
      total_counter = 0
      results = dewey_decimal_system_categories
      
      regex = /(^\d+)\..*/
      records.each do |record|
        dewey_decimal_category = record.dewey_decimal_code.match(regex)[1].to_i.round -2
        
        pages_read_from_record = calculate_pages_read(record.pages, record.book_read_status)
        total_counter += pages_read_from_record
        results[dewey_decimal_category] += pages_read_from_record
      end

      return {
                category_breakdown: results, 
                total_pages_read: total_counter
              }
    end

    def dewey_decimal_system_categories
      {
        '000' => { 'name': 'Computer Science, Information & General Works', 'pages_read': 0 },
        '100' => { 'name': 'Philosophy & Psychology', 'pages_read': 0 },
        '200' => { 'name': 'Religion', 'pages_read': 0 },
        '300' => { 'name': 'Social Sciences', 'pages_read': 0 },
        '400' => { 'name': 'Language', 'pages_read': 0 },
        '500' => { 'name': 'Pure Science', 'pages_read': 0 },
        '600' => { 'name': 'Applied Science', 'pages_read': 0 },
        '700' => { 'name': 'Arts & Recreation', 'pages_read': 0 },
        '800' => { 'name': 'Literature', 'pages_read': 0 },
        '900' => { 'name': 'History & Geography', 'pages_read': 0 }
      }
    end


    def calculate_pages_read num_of_pages, status 
      if status == 'Fully'
        return num_of_pages 
      elsif status == 'Partially'
        return record.pages / 2
      else
        return 0
      end
    end
end