class ReportsController < ApplicationController

  # GET /reports/new
  def new
    @record = Record.new
  end
  
  # POST /reports
  # POST /reports.json
  def create
    records = if file_upload_params[:file] # file upload
                case file_upload_params[:file].content_type 
                  when 'application/xml' then  FileParser::XMLParser.call( file_upload_params[:file].path )
                  when 'text/csv' then FileParser::CSVParser.call( file_upload_params[:file].path )
                  when 'application/json' then FileParser::JSONParser.call( file_upload_params[:file].path ) 
                end
              else # non file upload
                form_submission_params['records'].is_a?(Array) ? form_submission_params['records'] : [ form_submission_params['records'] ]
              end

    begin
      @report = ReportCreator.new(records).results
      
      respond_to do |format|
        format.html { render :index }
        format.json { render json: @report, status: :ok }
      end
    rescue => exception
      respond_to do |format|
        redirect_to :new, error: "Invalid Information", status: :unprocessable_entity
        
        format.json { render status: :unprocessable_entity }
      end    
    end  
  end
  
  
  private

  def form_submission_params
    params.permit({ records: [:title, :author, :dewey_decimal_code, :book_read_status]})
  end

  def file_upload_params
    params.require(:records).permit(:file)
  end
end
