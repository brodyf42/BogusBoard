class CommentsController < ApplicationController
    def create
        # check tha tassociated post exists
        post = Post.find(params[:post_id])
        redirect_to post_path if !post
        #check that associated user exists
        user_email = params[:user_email].strip.downcase
        user = User.find_by(email: user_email)
        redirect_to post_path(post.id) if !user
        # save comment and reload post thread
        body = params[:body]
        Comment.create(user_id: user.id, post_id: post.id, body: body)
        redirect_to post_path(post.id)
    end

    def destroy
        post = Post.find(params[:post_id])
        redirect_to post_path if !post
        @comment = Comment.find(params[:comment_id])
        @comment.destroy
        redirect_to post_path(post.id)
    end
end
