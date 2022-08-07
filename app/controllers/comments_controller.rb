class CommentsController < ApplicationController
  before_action :find_post, only: [:create, :destroy]

  def create
    Comment.create(post: @post, user: @user, body: @body) if valid_request?
    redirect_to_post
  end

  def destroy
    Comment.find_by(id: params[:comment_id])&.destroy
    redirect_to_post
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to post_path and return
  end

  def valid_request?
    @post.present? && valid_user? && valid_body?
  end

  def valid_user?
    @user = User.find_by(email: params[:user_email].strip.downcase)
    @user.present?.tap do |valid_user|
      flash[:error] = "You must provide an email address for a user that exists." unless valid_user
    end
  end

  def valid_body?
    @body = params[:body]
    @body.present?.tap do |valid_body|
      flash[:error] = "You cannot submit a comment without a body." unless valid_body
    end
  end

  def redirect_to_post
    redirect_to post_path(@post.id)
  end
end
