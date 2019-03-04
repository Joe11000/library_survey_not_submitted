require 'rails_helper'

RSpec.describe "Reports", type: :request do
  describe "html" do 
    describe 'form submission' do 
      describe "POST /reports" do
        describe 'single record upload' do 
          let(:file_location) { './spec/shared/json_files/single_record_upload.json' }
          let(:reports) { FileParser::JSONParser.call( file_location ) }

          it "" do
            headers = {"Accept" => 'application/json'}
            post reports_path, params: { "records" => reports }, headers: headers

            expect(response).to have_http_status(200)
            expect(response.body).to include "Total Pages Read"
          end
        end
        describe 'multiple record upload' do 
          let(:file_location) { './spec/shared/json_files/multi_record_upload.json' }
          let(:reports) { FileParser::JSONParser.call( file_location ) }

          it "" do
            headers = {"Accept" => 'application/json'}
            post reports_path, params: { "records" => reports }, headers: headers

            expect(response).to have_http_status(200)
            expect(response.body).to eq 
          end
        end
      end
    end

    describe 'file submission' do 
      describe 'json file upload' do 
        it '' do 
          get root_path
          

        end
      end
      
      describe 'xml file upload' do 
      
      end
      
      describe 'csv file upload' do 
      
      end
    end
  end
end
