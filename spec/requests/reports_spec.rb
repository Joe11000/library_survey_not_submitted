require 'rails_helper'

RSpec.describe "Reports", type: :request do
  describe 'form submission' do 
    describe "POST /reports" do
      describe 'single record upload' do 
        let(:file_location) { './spec/shared/json_files/single_record_upload.json' }
        let(:reports) { FileParser::JSONParser.call( file_location ) }

        it "" do
          post reports_path, params: { "records" => reports }

          expect(response).to have_http_status(200)
        end
      end
      describe 'multiple record upload' do 
        let(:file_location) { './spec/shared/json_files/multi_record_upload.json' }
        let(:reports) { FileParser::JSONParser.call( file_location ) }

        it "" do
          post reports_path, params: { "records" => reports }          

          expect(response).to have_http_status(200)
        end
      end
    end
  end

  describe 'non-form submission submission' do 
    describe 'POST file_upload' do 

      describe 'json file upload' do 
        
      end
      
      describe 'xml file upload' do 
      
      end
      
      describe 'csv file upload' do 
      
      end
    end
  end
end
