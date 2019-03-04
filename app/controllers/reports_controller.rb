class ReportsController < ApplicationController

  # GET /reports/new
  def new
    @record = Record.new
  end
  
  # POST /reports
  # POST /reports.json
  def create
    respond_to do |format|
      format.html do 
        begin
          # if only single record given, just encase it in an array to match the plural format
          records = report_params['records'].is_a?(Array) ? report_params['records'] : [ report_params['records'] ]
          @report = ReportCreator.new(records).results
          render :index 
        rescue => exception
          redirect_to :new, error: "Invalid Format Information", status: :unprocessable_entity
        end
      end
    end
  end

  def file_upload

    records = if(report_params[:file].content_type == 'application/xml')
                FileParser::XMLParser.call( report_params[:file].path )
              elsif report_params[:file].content_type == 'text/csv'
                FileParser::CSVParser.call( report_params[:file].path )
              elsif report_params[:file].content_type == 'application/json'
                FileParser::JSONParser.call( report_params[:file].path ) 
              end

    begin
      @report = ReportCreator.new(records).results
      
      respond_to do |format|
        format.html { render :index }
        format.json { render json: @report, status: :ok }
      end
    rescue => exception
      respond_to do |format|
        format.html { render :new, error: 'Invalid Records Entered' }
        format.json { render status: :unprocessable_entity }
      end    
    end  
  end
  
  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def report_params
    # params.require(:records).permit(:author, :book_read_status, :dewey_decimal_code, :pages, :title)
    params.permit({ reports: [:title, :author, :dewey_decimal_code, :book_read_status, :file]})
  end
end
