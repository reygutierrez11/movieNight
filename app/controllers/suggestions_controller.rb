class SuggestionsController < ApplicationController
  helper_method :change_box

  def index
    @suggestions = Suggestion.all
  end

  def show
    @suggestion = Suggestion.find(params[:id])
    @movie = @suggestion.movie
  end

  def new
    @sugg_boxes = SuggBox.all
    @suggestion = Suggestion.new
    @suggestions = Suggestion.all
    @weekly_suggestions = @sugg_boxes.find_by_name("Weekly").suggestions
    @all_time_minus_weekly_suggestions = @sugg_boxes.find_by_name("All Encompassing").suggestions
    @recent_movie = Movie.last
    @review = Review.new
    @movie = Movie.last
  end

  def create
    @suggestion = Suggestion.new(suggestion_params) do |s|
      id = SuggBox.find_by_name("Weekly").id
      s.sugg_box_id = id
      s.add_quick_description
    end
    if @suggestion.save
      redirect_to new_suggestion_path, status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def change_box
    @suggestion = Suggestion.find(params[:id])
    if @suggestion.sugg_box.name == "All Encompassing" 
      destination_box_id = SuggBox.find_by_name("Weekly").id
    elsif @suggestion.sugg_box.name == "Weekly"
      destination_box_id = SuggBox.find_by_name("All Encompassing").id
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
    # redirect_back_or_to index
     
    # content_type is crucial here as it wasn't being received before
    render partial: "suggestion", content_type: "text/html", locals: { s: @suggestion }
  end

  def dislike
    @suggestion = Suggestion.find(params[:id])
    @suggestion.disliked_by current_user
  end

  def description 
    set_suggestion
  end

  def back
    set_suggestion
  end

  def clear
    Suggestion.move_old_weekly_suggestions
    redirect_back_or_to index
  end

  private
  def set_suggestion
    @suggestion = Suggestion.find(params[:id])
  end

  def suggestion_params
    params.require(:suggestion).permit(:movie, :author, :user, :sugg_box_id)
  end

end
