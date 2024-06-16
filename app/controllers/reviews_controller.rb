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
    @movie = Movie.last

    if @review.save
      @review = Review.new()
      render "reviews/_new", content_type: "text/html", locals: { review: @new_review }
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def review_params
      params.require(:review).permit(:title, :author, :body, :score, :movie_id)
    end
end
