class PagesController < ApplicationController
  def home
    @posts = user_signed_in? && current_user.moderator? ? Post.all.sorted : Post.published.sorted
    @screenings = Screening.where(
      start_time: Time.now.beginning_of_month.beginning_of_week..Time.now.end_of_month.end_of_week)
  end

  def nome
    @screenings = Screening.where(
      start_time: Time.now.beginning_of_month.beginning_of_week..Time.now.end_of_month.end_of_week)
  end
  
  def fome
    @reviews = Review.all
    @october = Review.where(created_at: Time.now.beginning_of_month..Time.now.end_of_month)
    @november = Review.where(created_at: Time.now.beginning_of_month..Time.now.end_of_month)
  end

  def vaulted
    @suggestions = Suggestion.all
    @sugg_boxes = SuggBox.all
  end

end
