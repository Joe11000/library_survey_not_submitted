require 'rails_helper'

RSpec.describe 'Reports', type: :request do


  describe 'POST /reports' do 
    describe 'User wants a json response body after' do 
      let!(:expected_single_record_report) do
        JSON.parse(file_fixture('response_bodies/json_files/single_record_report.json').read).deep_stringify_keys
      end
    
      let!(:expected_multi_record_report) do
        JSON.parse(file_fixture('response_bodies/json_files/multi_record_report.json').read).deep_stringify_keys
      end

      describe 'uploading a' do 
        describe 'json file' do 
          it 'with single record' do 
            upload_file = fixture_file_upload('request_bodies/json_files/single_record_upload.json', 'application/json')

            params =  {
                        'records' => { 'file' => upload_file }
                      }

            headers = {
                        'ACCEPT' => 'application/json',     
                        'CONTENT_TYPE' => 'application/json'
                      }
            
            post reports_path , params: params, headers: headers
            expect(JSON.parse(response.body)).to eq expected_single_record_report
          end

          it 'with multiple records' do 
            upload_file = fixture_file_upload('request_bodies/json_files/multi_record_upload.json', 'application/json')

            params =  {
                        'records' => { 'file' => upload_file }
                      }

            headers = {
                        'ACCEPT' => 'application/json',    
                        'CONTENT_TYPE' => 'application/json'
                      }
            
            post reports_path , params: params, headers: headers
            expect(JSON.parse(response.body)).to eq expected_multi_record_report
        	end
        end
        
        describe 'xml file' do 
          it 'with a single record upload' do 
            upload_file = fixture_file_upload('request_bodies/xml_files/single_record_upload.xml', 'text/xml')

            params =  {
                        'records' => { 'file' => upload_file }
                      }

            headers = {
                        'ACCEPT' => 'application/json',    
                        'CONTENT_TYPE' => 'text/xml'
                      }
            
            post reports_path , params: params, headers: headers
            expect(JSON.parse(response.body)).to eq expected_single_record_report
					end
					
					it 'with multiple records' do 
            upload_file = fixture_file_upload('request_bodies/xml_files/multi_record_upload.xml', 'text/xml')

            params =  {
              'records' => { 'file' => upload_file }
            }

            headers = {
                        'ACCEPT' => 'application/json',    
                        'CONTENT_TYPE' => 'text/xml'
                      }
            
            post reports_path , params: params, headers: headers
            expect(JSON.parse(response.body)).to eq expected_multi_record_report
        	end
        end
        
        describe 'csv file' do 
          it 'with a single record' do 
            upload_file = fixture_file_upload('request_bodies/csv_files/single_record_upload.csv', 'text/csv')

            params =  {
                        'records' => { 'file' => upload_file }
                      }

            headers = {
                        'ACCEPT' => 'application/json',     
                        'CONTENT_TYPE' => 'text/csv'
                      }
            
            post reports_path , params: params, headers: headers
            expect(JSON.parse(response.body)).to eq expected_single_record_report
					end
					
					it 'with multiple records' do 
            upload_file = fixture_file_upload('request_bodies/csv_files/multi_record_upload.csv', 'text/csv')

            params =  {
              'records' => { 'file' => upload_file }
            }

            headers = {
                        'ACCEPT' => 'application/json',     
                        'CONTENT_TYPE' => 'text/csv'
                      }
            
            post reports_path , params: params, headers: headers
            expect(JSON.parse(response.body)).to eq expected_multi_record_report
        	end
        end
      end
    end

    describe 'User wants html body after upload' do 
	    # Covered in spec/system/report_uploader_spec.rb
    end
  end
end