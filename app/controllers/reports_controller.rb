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
          records = params['records'].is_a?(Array) ? params['records'] : [ params['records'] ]
          @report = ReportCreator.new(records).results
          render :index 
        rescue => exception
          redirect_to :new, error: "Invalid Format Information", status: :unprocessable_entity
        end
      end
    end
  end

  def file_upload
    records = nil;

    records = if(params[:file].content_type == 'application/xml')
                FileParser::XMLParser.call( params[:file].path )
              elsif params[:file].content_type == 'text/csv'
                FileParser::CSVParser.call( params[:file].path )
              elsif params[:file].content_type == 'application/json'
                FileParser::JSONParser.call( params[:file].path ) 
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
    params.require(:records).permit!
  end
end

# GET /reports
# GET /reports.json
# def index
#   @reports = Report.all
# end

# # GET /reports/1
# # GET /reports/1.json
# def show
# end

# # GET /reports/1/edit
# def edit
# end

# PATCH/PUT /reports/1
# PATCH/PUT /reports/1.json
# def update
#   respond_to do |format|
#     if @report.update(report_params)
#       format.html { redirect_to @report, notice: 'Report was successfully updated.' }
#       format.json { render :show, status: :ok, location: @report }
#     else
#       format.html { render :edit }
#       format.json { render json: @report.errors, status: :unprocessable_entity }
#     end
#   end
# end

# # DELETE /reports/1
# # DELETE /reports/1.json
# def destroy
#   @report.destroy
#   respond_to do |format|
#     format.html { redirect_to reports_url, notice: 'Report was successfully destroyed.' }
#     format.json { head :no_content }
#   end
# end

  # Use callbacks to share common setup or constraints between actions.
  # def set_report
  #   @report = Report.find(params[:id])
  # end