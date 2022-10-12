class PagesController < ApplicationController
  def home
    @posts = Post.all
  end

  def nome
    @screenings = Screening.where(
      start_time: Time.now.beginning_of_month.beginning_of_week..Time.now.end_of_month.end_of_week)
  end
  
  def third
    @reviews = Review.all
  end

  def draw

  end

end
