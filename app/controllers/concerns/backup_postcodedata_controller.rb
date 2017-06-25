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


  # GET /postcodedata/1
  # GET /postcodedata/1.json
  def show
  end

  # GET /postcodedata/new
  def new
    @postcodedatum = Postcodedatum.new
  end

  # GET /postcodedata/1/edit
  def edit
  end

  # POST /postcodedata
  # POST /postcodedata.json
  def create
    @postcodedatum = Postcodedatum.new(postcodedatum_params)

    respond_to do |format|
      if @postcodedatum.save
        format.html { redirect_to @postcodedatum, notice: 'Postcodedatum was successfully created.' }
        format.json { render :show, status: :created, location: @postcodedatum }
      else
        format.html { render :new }
        format.json { render json: @postcodedatum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /postcodedata/1
  # PATCH/PUT /postcodedata/1.json
  def update
    respond_to do |format|
      if @postcodedatum.update(postcodedatum_params)
        format.html { redirect_to @postcodedatum, notice: 'Postcodedatum was successfully updated.' }
        format.json { render :show, status: :ok, location: @postcodedatum }
      else
        format.html { render :edit }
        format.json { render json: @postcodedatum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /postcodedata/1
  # DELETE /postcodedata/1.json
  def destroy
    @postcodedatum.destroy
    respond_to do |format|
      format.html { redirect_to postcodedata_url, notice: 'Postcodedatum was successfully destroyed.' }
      format.json { head :no_content }
    end
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
