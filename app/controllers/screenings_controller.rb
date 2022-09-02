class ScreeningsController < ApplicationController
  before_action :set_screening, only: %i[ show edit update destroy ]

  # GET /screenings or /screenings.json
  def index
    @screenings = Screening.all
  end

  # GET /screenings/1 or /screenings/1.json
  def show
  end

  # GET /screenings/new
  def new
    @screening = Screening.new
  end

  # GET /screenings/1/edit
  def edit
  end

  # POST /screenings or /screenings.json
  def create
    @screening = Screening.new(screening_params)

    respond_to do |format|
      if @screening.save
        format.html { redirect_to screening_url(@screening), notice: "Screening was successfully created." }
        format.json { render :show, status: :created, location: @screening }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @screening.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /screenings/1 or /screenings/1.json
  def update
    respond_to do |format|
      if @screening.update(screening_params)
        format.html { redirect_to screening_url(@screening), notice: "Screening was successfully updated." }
        format.json { render :show, status: :ok, location: @screening }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @screening.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /screenings/1 or /screenings/1.json
  def destroy
    @screening.destroy

    respond_to do |format|
      format.html { redirect_to screenings_url, notice: "Screening was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_screening
      @screening = Screening.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def screening_params
      params.require(:screening).permit(:title, :description, :start_time, :end_time)
    end
end
