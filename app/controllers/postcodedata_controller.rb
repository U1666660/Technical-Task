class PostcodedataController < ApplicationController
  before_action :set_postcodedatum, only: [:show, :edit, :update, :destroy]

  # GET /postcodedata
  # GET /postcodedata.json
  def index
    @postcodedata = Postcodedatum.all.order(row_id: :asc)
    respond_to do |format|
      format.html
      format.csv { send_data @postcodedata.to_csv, filename: "succeeded_validation.csv" }
    end

  end

  def new
    @postcodedata = Postcodedatum.new
  end

  def create
    @postcodedatum = Postcodedatum.new(postcodedatum_params)

    respond_to do |format|
      if @postcodedatum.save
        format.html { redirect_to @postcodedatum, notice: 'Ready to download now!' }
        format.json { render :show, status: :created, location: @postcodedatum }
      else
        format.html { render :new }
        format.json { render json: @postcodedatum.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @postcodedatum.update(postcodedatum_params)
        format.html { redirect_to @postcodedatum, notice: 'Postcode datum was successfully updated.' }
        format.json { render :show, status: :ok, location: @postcodedatum }
      else
        format.html { render :edit }
        format.json { render json: @postcodedatum.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @postcodedatum.destroy
    respond_to do |format|
      format.html { redirect_to @postcodedatum, notice: 'Failed postcode was successfully destroyed.' }
      format.json { head :no_content }
    end
  end




  def import
    Postcodedatum.import(params[:file])
    redirect_to postcodedata_path, notice: "Postcode data validation is complete!"
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
