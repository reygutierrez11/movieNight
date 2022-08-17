class SuggestionsController < ApplicationController

  def index
    @suggestions = Suggestion.all
  end

  def show
    @suggestion = Suggestion.find(params[:id])
  end

  def new
    @suggestion = Suggestion.new
  end

  def create
    @suggestion = Suggestion.new(suggestion_params)

    if @suggestion.save
      redirect_to @suggestion
    else
      render :new, status: :unprocessable_entity
    end
  end


  def destroy
    @Suggestion = Suggestion.find(params[:id])
    @Suggestion.destroy

    redirect_to root_path, status: :see_other
  end

  private
  def suggestion_params
    params.require(:suggestion).permit(:movie, :author)
  end

end
