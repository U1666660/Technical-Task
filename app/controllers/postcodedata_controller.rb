class PostcodedataController < ApplicationController
  before_action :set_postcodedatum, only: [:show, :edit, :update, :destroy]

  # GET /postcodedata
  # GET /postcodedata.json
  def index
    @postcodedata = Postcodedatum.all.order(row_id: :asc).paginate(:page => params[:page], :per_page => 30)
  end


  def import
    Postcodedatum.import(params[:file])
    redirect_to postcodedata_path, notice: "Postcode Data Uploaded successfully!"
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_postcodedatum
      @postcodedatum = Postcodedatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def postcodedatum_params
      params.require(:postcodedatum).permit(:row_id, :postcode)
    end
end
