module ReportsHelper
  def book_read_status__options_for_select 
    Record.defined_enums["book_read_status"].to_a
  end
end
