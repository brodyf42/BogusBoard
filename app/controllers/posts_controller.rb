class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all.order(created_at: :desc).take(10)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    user_email = params[:post][:user_email].strip.downcase
    user = User.find_by(email: user_email)
    if user.blank?
      flash.now[:error] = "You must provide an email address for a user that exists."
      @post = Post.new
      render :new and return
    end

    body = params[:post][:body]

    if body.empty?
      flash.now[:error] = "You cannot submit a post without a body."
      @post = Post.new
      render :new and return
    end

    @post = Post.new(user_id: user.id, body: body, active: true)

    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def edit
  end

  def update
    body = params[:post][:body]

    if body.empty?
      flash.now[:error] = "You cannot submit a post without a body."
      render :edit and return
    end

    if @post.update(body: body)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def find_post
    @post = Post.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to posts_path, notice: "That post could not be found"
  end
end
