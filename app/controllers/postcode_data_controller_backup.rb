class PostcodeDataController < ApplicationController
  before_action :set_postcode_datum, only: [:show, :edit, :update, :destroy]

  # GET /postcode_data
  # GET /postcode_data.json
  def index
    @postcode_data = PostcodeDatum.all.order(id: :desc).paginate(:page => params[:page], :per_page => 30)
  end



  # GET /postcode_data/1
  # GET /postcode_data/1.json
  def show
  end

  # GET /postcode_data/new
  def new
    @postcode_datum = PostcodeDatum.new
  end

  # GET /postcode_data/1/edit
  def edit
  end

  # POST /postcode_data
  # POST /postcode_data.json
  def create
    @postcode_datum = PostcodeDatum.new(postcode_datum_params)

    respond_to do |format|
      if @postcode_datum.save
        format.html { redirect_to @postcode_datum, notice: 'Postcode datum was successfully created.' }
        format.json { render :show, status: :created, location: @postcode_datum }
      else
        format.html { render :new }
        format.json { render json: @postcode_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /postcode_data/1
  # PATCH/PUT /postcode_data/1.json
  def update
    respond_to do |format|
      if @postcode_datum.update(postcode_datum_params)
        format.html { redirect_to @postcode_datum, notice: 'Postcode datum was successfully updated.' }
        format.json { render :show, status: :ok, location: @postcode_datum }
      else
        format.html { render :edit }
        format.json { render json: @postcode_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /postcode_data/1
  # DELETE /postcode_data/1.json
  def destroy
    @postcode_datum.destroy
    respond_to do |format|
      format.html { redirect_to postcode_data_url, notice: 'Postcode datum was successfully destroyed.' }
      format.json { head :no_content }
    end
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
