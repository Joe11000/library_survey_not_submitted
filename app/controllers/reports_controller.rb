class ReportsController < ApplicationController
  # before_action :set_report, only: [:show, :edit, :update, :destroy]

  # GET /reports/new
  def new
    @record = Record.new
  end
  
  # POST /reports
  # POST /reports.json
  def create
    # byebug
    
     @records = {
                   category_breakdown: {
                                        '000' => { 'name' => 'Computer Science, Information & General Works', 'pages_read' => 1 },
                                        '100' => { 'name' => 'Philosophy & Psychology', 'pages_read' => 2 },
                                        '200' => { 'name' => 'Religion', 'pages_read' => 3 },
                                        '300' => { 'name' => 'Social Sciences', 'pages_read' => 4 },
                                        '400' => { 'name' => 'Language', 'pages_read' => 5 },
                                        '500' => { 'name' => 'Pure Science', 'pages_read' => 6 },
                                        '600' => { 'name' => 'Applied Science', 'pages_read' => 7 },
                                        '700' => { 'name' => 'Arts & Recreation', 'pages_read' => 8 },
                                        '800' => { 'name' => 'Literature', 'pages_read' => 9 },
                                        '900' => { 'name' => 'History & Geography', 'pages_read' => 10 }
                                      },
                   total_pages_read: 55
                 }

    respond_to do |format|
      format.html do 
        begin
          @report = ReportCreator.call(records)
          format.html { render :index }
        rescue => exception
          redirect_to :new, error: "Invalid Format Information", status: :unprocessable_entity
        else
          
        end
      end
    end
  end

  def file_upload
    byebug
    records = nil;

    records = if(params[:file].content_type == 'application/xml')
                FileParser::XMLParser.call( params[:file].path )
              elsif params[:file].content_type == 'text/csv'
                FileParser::CSVParser.call( params[:file].path )
              elsif params[:file].content_type == 'application/json'
                FileParser::JSONParser.call( params[:file].path ) 
              end

    @report = ReportCreator.call(records)

    render :index
  end
  
  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def report_params
    # params.require(:records).permit( [{:author, :book_read_status, :dewey_decimal_code, :pages, :title}])
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