class FaildataController < ApplicationController
  before_action :set_faildatum, only: [:show, :edit, :update, :destroy]

  # GET /faildata
  # GET /faildata.json
  def index
    @faildata = Faildatum.all.order(row_id: :asc)
    respond_to do |format|
      format.html
      format.csv { send_data @faildata.to_csv, filename: "failed_validation.csv"}
    end
end
  # GET /faildata/1
  # GET /faildata/1.json
  def show
  end

  # GET /faildata/new
  def new
    @faildatum = Faildatum.new
  end

  # GET /faildata/1/edit
  def edit
  end

  # POST /faildata
  # POST /faildata.json
  def create
    @faildatum = Faildatum.new(faildatum_params)

    respond_to do |format|
      if @faildatum.save
        format.html { redirect_to @faildatum, notice: 'Faildatum was successfully created.' }
        format.json { render :show, status: :created, location: @faildatum }
      else
        format.html { render :new }
        format.json { render json: @faildatum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /faildata/1
  # PATCH/PUT /faildata/1.json
  def update
    respond_to do |format|
      if @faildatum.update(faildatum_params)
        format.html { redirect_to @faildatum, notice: 'Faildatum was successfully updated.' }
        format.json { render :show, status: :ok, location: @faildatum }
      else
        format.html { render :edit }
        format.json { render json: @faildatum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /faildata/1
  # DELETE /faildata/1.json
  def destroy
    @faildatum.destroy
    respond_to do |format|
      format.html { redirect_to faildata_url, notice: 'Faildatum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  def import
    Faildatum.import(params[:file])
    redirect_to faildata_path, notice: "Faildata collection completed!"
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_faildatum
      @faildatum = Faildatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def faildatum_params
      params.require(:faildatum).permit(:row_id, :postcode)
    end
end
