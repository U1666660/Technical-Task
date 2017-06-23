class PostcodeDataController < ApplicationController
  before_action :set_postcode_datum, only: [:show, :edit, :update, :destroy]

  # GET /postcode_data
  # GET /postcode_data.json
  def index
    @postcode_data = PostcodeDatum.all.order(row_id: :asc).paginate(:page => params[:page], :per_page => 30)
  end

def import
  PostcodeDatum.import(params[:file])
  redirect_to postcode_data_path, notice: "Postcode Data Uploaded successfully!"
end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_postcode_datum
      @postcode_datum = PostcodeDatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def postcode_datum_params
      params.require(:postcode_datum).permit(:row_id, :postcode)
    end
end
