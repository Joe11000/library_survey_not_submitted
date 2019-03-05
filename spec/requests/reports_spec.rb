require 'rails_helper'

RSpec.describe "Reports", type: :request do
  
  
  describe "POST /reports" do 
    describe "User wants a json response body after" do 
      def get_single_record 
        FileParser::JSONParser.call( Rails.root.join( 'spec', 'fixtures', 'request_bodies', 'json_files', 'single_record_upload.json' ) )
      end

      describe 'uploading a' do 
        describe 'json file' do 
          it 'with single record' do 
              json_file_location = Rails.root.join( 'spec', 'fixtures', 'request_bodies', 'json_files', 'single_record_upload.json' )
              mime_type = 'application/json'
              upload_file = Rack::Test::UploadedFile.new(json_file_location, mime_type)

              params =  {
                          'records' => { 'file' => upload_file }
                        }

              expected_result = {
                                  "category_breakdown" => {
                                      "000" => {
                                          "name" => "Computer Science, Information & General Works",
                                          "pages_read" => 1
                                      }
                                  },
                                  "total_pages_read" => 1
                                }
              headers = {
                          "ACCEPT" => "application/json",     # This is what Rails 4 accepts
                          "CONTENT_TYPE" => "application/json"
                        }
              
              post reports_path , params: params, headers: headers
              expect(JSON.parse(response.body)).to eq expected_result
          end

          it 'with multiple records' do 
            json_file_location = Rails.root.join( 'spec',  'fixtures', 'request_bodies', 'json_files', 'multi_record_upload.json' )
            mime_type = 'application/json'
            upload_file = Rack::Test::UploadedFile.new(json_file_location, mime_type)
            
            params =  {
              'records' => { 'file' => upload_file }
            }

            expected_result =  {
                                  "category_breakdown": {
                                      "100": {
                                          "name": "Philosophy & Psychology",
                                          "pages_read": 2
                                      },
                                      "200": {
                                          "name": "Religion",
                                          "pages_read": 2
                                      },
                                      "300": {
                                          "name": "Social Sciences",
                                          "pages_read": 2
                                      },
                                      "400": {
                                          "name": "Language",
                                          "pages_read": 2
                                      },
                                      "500": {
                                          "name": "Pure Science",
                                          "pages_read": 2
                                      },
                                      "600": {
                                          "name": "Applied Science",
                                          "pages_read": 2
                                      },
                                      "700": {
                                          "name": "Arts & Recreation",
                                          "pages_read": 2
                                      },
                                      "800": {
                                          "name": "Literature",
                                          "pages_read": 2
                                      },
                                      "900": {
                                          "name": "History & Geography",
                                          "pages_read": 2
                                      },
                                      "000": {
                                          "name": "Computer Science, Information & General Works",
                                          "pages_read": 2
                                      }
                                  },
                                  "total_pages_read": 20
                              }
            
            headers = {
                        "ACCEPT" => "application/json",     # This is what Rails 4 accepts
                        "CONTENT_TYPE" => "application/json"
                      }
            
            post reports_path , params: params, headers: headers
            expect(JSON.parse(response.body)).to eq expected_result.deep_stringify_keys
        end
      end
        
        describe 'xml file' do 
          it 'with a single record upload' do 
            xml_file_location = Rails.root.join( 'spec',  'fixtures', 'request_bodies', 'xml_files', 'single_record_upload.xml' )
            mime_type = 'text/xml'
            upload_file = Rack::Test::UploadedFile.new(xml_file_location, mime_type)

            params =  {
                        'records' => { 'file' => upload_file }
                      }

            expected_result = {
                                "category_breakdown" => {
                                    "000" => {
                                        "name" => "Computer Science, Information & General Works",
                                        "pages_read" => 1
                                    }
                                },
                                "total_pages_read" => 1
                              }
            headers = {
                        "ACCEPT" => "application/json",     # This is what Rails 4 accepts
                        "CONTENT_TYPE" => "text/xml"
                      }
            
            post reports_path , params: params, headers: headers
            expect(JSON.parse(response.body)).to eq expected_result
          end
        end
        
        describe 'csv file' do 
          it 'with a single record' do 
            csv_file_location = Rails.root.join( 'spec',  'fixtures', 'request_bodies', 'csv_files', 'single_record_upload.csv' )
            mime_type = 'text/csv'
            upload_file = Rack::Test::UploadedFile.new(csv_file_location, mime_type)

            params =  {
                        'records' => { 'file' => upload_file }
                      }

            expected_result = {
                                "category_breakdown" => {
                                    "000" => {
                                        "name" => "Computer Science, Information & General Works",
                                        "pages_read" => 1
                                    }
                                },
                                "total_pages_read" => 1
                              }
            headers = {
                        "ACCEPT" => "application/json",     # This is what Rails 4 accepts
                        "CONTENT_TYPE" => "text/csv"
                      }
            
            post reports_path , params: params, headers: headers
            expect(JSON.parse(response.body)).to eq expected_result
          end
        end
      end
    end

    describe "User wants html body after upload" do 

    end
  end
end