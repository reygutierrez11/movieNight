class SuggestionsController < ApplicationController

  def index
    @suggestions = Suggestion.all
  end

  def show
    @suggestion = Suggestion.find(params[:id])
  end

  def new
    @suggestions = Suggestion.all
    @suggestion = Suggestion.new
  end

  def create
    @suggestion = Suggestion.new(suggestion_params)

    if @suggestion.save
      redirect_to new_suggestion_path 
    else
      render :new, status: :unprocessable_entity
    end
  end


  def destroy
    @Suggestion = Suggestion.find(params[:id])
    @Suggestion.destroy

    redirect_to root_path, status: :see_other
  end

  def like
    @suggestion = Suggestion.find(params[:id])
    @suggestion.liked_by current_user
    redirect_back_or_to index
  end

  def dislike
    @suggestion = Suggestion.find(params[:id])
    @suggestion.disliked_by current_user
  end

  private
  def suggestion_params
    params.require(:suggestion).permit(:movie, :author)
  end

end
