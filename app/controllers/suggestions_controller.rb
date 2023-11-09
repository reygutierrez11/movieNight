class SuggestionsController < ApplicationController
  helper_method :change_box

  def index
    @suggestions = Suggestion.all
  end

  def show
    @suggestion = Suggestion.find(params[:id])
  end

  def new
    @sugg_boxes = SuggBox.all
    @suggestions = Suggestion.all
    @suggestion = Suggestion.new
  end

  def create
    @suggestion = Suggestion.new(suggestion_params)

    if @suggestion.save
      redirect_to new_suggestion_path, status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def change_box
    @suggestion = Suggestion.find(params[:id])
    if @suggestion.sugg_box_id == 5
      destination_box_id = 6
    elsif @suggestion.sugg_box_id == 6
      destination_box_id = 5
    end
    @suggestion.move_suggestions_to_new_box(destination_box_id)
    redirect_to new_suggestion_path, status: :see_other
  end

  def destroy
    @Suggestion = Suggestion.find(params[:id])
    if current_user.email == @Suggestion.user
      @Suggestion.destroy
    end
    redirect_to new_suggestion_path, status: :see_other
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

  def clear
    Suggestion.move_old_weekly_suggestions
    redirect_back_or_to index
  end

  private
  def suggestion_params
    params.require(:suggestion).permit(:movie, :author, :user, :sugg_box_id)
  end

end
