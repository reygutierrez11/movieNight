class PagesController < ApplicationController
  def home
    @posts = Post.all
    @suggestions = Suggestion.all
  end

end
