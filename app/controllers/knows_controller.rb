class KnowsController < ApplicationController

  def index
    @posts = Post.all
  end

  def create
  end

end
