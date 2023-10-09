class SuggBoxesController < ApplicationController
  before_action :set_sugg_box, only: %i[ show edit update destroy ]

  # GET /sugg_boxes or /sugg_boxes.json
  def index
    @sugg_boxes = SuggBox.all
  end

  # GET /sugg_boxes/1 or /sugg_boxes/1.json
  def show
  end

  # GET /sugg_boxes/new
  def new
    @sugg_box = SuggBox.new
  end

  # GET /sugg_boxes/1/edit
  def edit
  end

  # POST /sugg_boxes or /sugg_boxes.json
  def create
    @sugg_box = SuggBox.new(sugg_box_params)

    respond_to do |format|
      if @sugg_box.save
        format.html { redirect_to sugg_box_url(@sugg_box), notice: "Sugg box was successfully created." }
        format.json { render :show, status: :created, location: @sugg_box }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sugg_box.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sugg_boxes/1 or /sugg_boxes/1.json
  def update
    respond_to do |format|
      if @sugg_box.update(sugg_box_params)
        format.html { redirect_to sugg_box_url(@sugg_box), notice: "Sugg box was successfully updated." }
        format.json { render :show, status: :ok, location: @sugg_box }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sugg_box.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sugg_boxes/1 or /sugg_boxes/1.json
  def destroy
    @sugg_box.destroy

    respond_to do |format|
      format.html { redirect_to sugg_boxes_url, notice: "Sugg box was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sugg_box
      @sugg_box = SuggBox.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sugg_box_params
      params.fetch(:sugg_box, {})
    end
end
