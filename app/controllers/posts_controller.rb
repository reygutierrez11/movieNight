class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocesssable_entity
    end
  end

  def destroy
    @post.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def post_params
      params.require(:post).permit(:title, :body, :link, :published_at)
    end

    def set_post
      @post = user_signed_in? ? Post.find(params[:id]) : Post.published.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path
    end

end
