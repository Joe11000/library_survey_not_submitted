require 'rails_helper'

RSpec.describe ReportCreator do

  context 'returns an array of hashes(records) for a' do
    context 'multirecord file upload' do
      let(:params) {
          [{"author" => "Programmer 1",
               "book_read_status" => "fully",
               "dewey_decimal_code" => "020.563DUC",
               "pages" => "1",
               "title" => "Computer Science 1"},
               {"author" => "Programmer 1",
               "book_read_status" => "partially",
               "dewey_decimal_code" => "021.563DUC",
               "pages" => "2",
               "title" => "Computer Science 2"},
               {"author" => "Philosopher 1",
               "book_read_status" => "fully",
               "dewey_decimal_code" => "120.563DUC",
               "pages" => "1",
               "title" => "Philosophy &amp; Psychology 1"},
               {"author" => "Philosopher 2",
               "book_read_status" => "partially",
               "dewey_decimal_code" => "121.563DUC",
               "pages" => "2",
               "title" => "Philosophy &amp; Psychology 2"},
               {"author" => "Religioner 1",
               "book_read_status" => "fully",
               "dewey_decimal_code" => "220.563DUC",
               "pages" => "1",
               "title" => "Religion 1"},
               {"author" => "Religion 2",
               "book_read_status" => "partially",
               "dewey_decimal_code" => "221.563DUC",
               "pages" => "2",
               "title" => "Religion 2"},
               {"author" => "Social Sciencer 1",
               "book_read_status" => "fully",
               "dewey_decimal_code" => "320.563DUC",
               "pages" => "1",
               "title" => "Social Sciences 1"},
               {"author" => "Social Sciencer 2",
               "book_read_status" => "partially",
               "dewey_decimal_code" => "321.563DUC",
               "pages" => "2",
               "title" => "Social Sciences 2"},
               {"author" => "Languager 1",
               "book_read_status" => "fully",
               "dewey_decimal_code" => "420.563DUC",
               "pages" => "1",
               "title" => "Language 1"},
               {"author" => "Languager 2",
               "book_read_status" => "partially",
               "dewey_decimal_code" => "421.563DUC",
               "pages" => "2",
               "title" => "Language 2"},
               {"author" => "Pure Sciencer 1",
               "book_read_status" => "fully",
               "dewey_decimal_code" => "520.563DUC",
               "pages" => "1",
               "title" => "Pure Science 1"},
               {"author" => "Pure Sciencer 2",
               "book_read_status" => "partially",
               "dewey_decimal_code" => "521.563DUC",
               "pages" => "2",
               "title" => "Pure Science 2"},
               {"author" => "Applied Sciencer 1",
               "book_read_status" => "fully",
               "dewey_decimal_code" => "620.563DUC",
               "pages" => "1",
               "title" => "Applied Science 1"},
               {"author" => "Applied Sciencer 2",
               "book_read_status" => "partially",
               "dewey_decimal_code" => "621.563DUC",
               "pages" => "2",
               "title" => "Applied Science 2"},
               {"author" => "Arts &amp; Recreationer 1",
               "book_read_status" => "fully",
               "dewey_decimal_code" => "720.563DUC",
               "pages" => "1",
               "title" => "Arts &amp; Recreation 1"},
               {"author" => "Arts &amp; Recreationer 2",
               "book_read_status" => "partially",
               "dewey_decimal_code" => "721.563DUC",
               "pages" => "2",
               "title" => "Arts &amp; Recreation 2"},
               {"author" => "Literaturer 1",
               "book_read_status" => "fully",
               "dewey_decimal_code" => "820.563DUC",
               "pages" => "1",
               "title" => "Literature 1"},
               {"author" => "Literaturer 2",
               "book_read_status" => "partially",
               "dewey_decimal_code" => "821.563DUC",
               "pages" => "2",
               "title" => "Literature 2"},
               {"author" => "History &amp; Geographer 1",
               "book_read_status" => "fully",
               "dewey_decimal_code" => "920.563DUC",
               "pages" => "1",
               "title" => "History &amp; Geography 1"},
               {"author" => "History &amp; Geographer 2",
               "book_read_status" => "partially",
               "dewey_decimal_code" => "921.563DUC",
               "pages" => "2",
               "title" => "History &amp; Geography 2"}]
      }
      let(:expected_result) {
        {
          'category_breakdown' => {
            '000' => { 'name' => 'Computer Science, Information & General Works', 'pages_read' => 2 },
            '100' => { 'name' => 'Philosophy & Psychology', 'pages_read' => 2 },
            '200' => { 'name' => 'Religion', 'pages_read' => 2 },
            '300' => { 'name' => 'Social Sciences', 'pages_read' => 2 },
            '400' => { 'name' => 'Language', 'pages_read' => 2 },
            '500' => { 'name' => 'Pure Science', 'pages_read' => 2 },
            '600' => { 'name' => 'Applied Science', 'pages_read' => 2 },
            '700' => { 'name' => 'Arts & Recreation', 'pages_read' => 2 },
            '800' => { 'name' => 'Literature', 'pages_read' => 2 },
            '900' => { 'name' => 'History & Geography', 'pages_read' => 2 }
          },
          'total_pages_read' => 20
        }
      }

      it 'returns a hash of records for a multirecord upload' do
        expect( ReportCreator.new(params).results ).to eq expected_result
      end
    end

    context 'single record upload' do
      let(:params) {
          [
            {
              "author" => "Programmer 1",
               "book_read_status" => "fully",
               "dewey_decimal_code" => "020.563DUC",
               "pages" => "1",
               "title" => "Computer Science 1"
            }
          ]
      }
      let(:expected_result) {
        {
          'category_breakdown' => {
            '000' => { 'name' => 'Computer Science, Information & General Works', 'pages_read' => 1 },
          },
          'total_pages_read' => 1
        }
      }

      it 'returns a hash of records for a single upload' do
        expect( ReportCreator.new(params).results ).to eq expected_result
      end
    end
  end
end


