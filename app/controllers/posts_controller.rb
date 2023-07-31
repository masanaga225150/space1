class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_post, only: [:edit, :update, :show]

  def index
    @posts = Post.all
  end

  def edit
    @posts = Post.all
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def new
    @post = Post.new
    @posts = Post.all
  end

  def create
     @post = current_user.posts.build(post_params)
     @genre = Genre.find(params[:post][:genre_id])
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @posts = Post.all
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.user == current_user
      @post.destroy
      redirect_to post_path(@post)
    end
  end

  private

  def post_params
    params.require(:post).permit(:genre_id, :title, :text, :image)
  end

  def set_post
    @post = Post.find_by(id: params[:id])
    if @post.nil?
      # IDが見つからなかった場合は、エラーを発生させる
      flash[:error] = "指定された投稿が見つかりませんでした。"
      redirect_to root_path
    end
  end

end
