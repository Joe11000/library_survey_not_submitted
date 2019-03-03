require 'rails_helper'

RSpec.describe "Reports", type: :request do
  describe 'form submission' do 
    describe "POST /reports" do
      it "" do
        params = Faker.build :record 
        byebug
        post reports_path, params: params

        expect(response).to have_http_status(200)
        expect(response.body).to 


    #  {
    #     'category_breakdown': {
    #                         '000' => { 'name': 'Computer Science, Information & General Works', 'pages_read': 0 }
    #                         '100' => { 'Philosophy & Psychology', 'pages_read': 0 },
    #                         '200' => { 'Religion', 'pages_read': 0 },
    #                         '300' => { 'Social Sciences', 'pages_read': 0 },
    #                         '400' => { 'Language', 'pages_read': 0 },
    #                         '500' => { 'Pure Science', 'pages_read': 0 },
    #                         '600' => { 'Applied Science', 'pages_read': 0 },
    #                         '700' => { 'Arts & Recreation', 'pages_read': 0 },
    #                         '800' => { 'Literature', 'pages_read': 0 },
    #                         '900' => { 'History & Geography', 'pages_read': 0 }
    #                       }, 
    #     'total_pages_read': 20
    #   }

        

      end
    end
  end

  describe 'json file upload' do 

  end

  describe 'xml file upload' do 

  end

  describe 'csv file upload' do 

  end
end


RSpec.describe ReportsController::ReportCreater do
  it '' do 
    byebug
  end
end
