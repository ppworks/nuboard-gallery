class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show]
  before_action :set_post_for_save, only: [:edit, :update]

  def index
    @posts = current_user.posts.order('id DESC').page(params[:page])
  end

  def show
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, notice: 'created'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @post.attributes = post_params
    if @post.save
      redirect_to post_path(@post), notice: 'updated'
    else
      render 'edit'
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, post_images_attributes: [:image, :_destroy])
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def set_post_for_save
    @post = current_user.posts.find(params[:id])
  end
end
