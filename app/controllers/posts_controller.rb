class PostsController < ApplicationController
  skip_before_filter :authorize, only: :index
  before_filter :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:success] = 'Post save success!'
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      flash[:success] = 'Post edit success!'
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:success] = 'Post destroyed!'
    redirect_to posts_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :subject, :date)
    end

    def find_post
      @post = current_user.posts.find(params[:id])
    end

    def current_user
      User.find_by(id: session[:user_id])
    end
end
