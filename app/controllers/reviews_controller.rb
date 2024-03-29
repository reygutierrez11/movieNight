class ReviewsController < ApplicationController
  def index
    @review = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end
  
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)

    if @review.save
      redirect_to @review
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def review_params
      params.require(:review).permit(:title, :author , :body, :score, :movie_id)
    end
end
