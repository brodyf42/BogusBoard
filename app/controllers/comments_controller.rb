class CommentsController < ApplicationController
    def create
        # check that associated post exists
        post = Post.find(params[:post_id])
        redirect_to post_path if !post
        #check that associated user exists
        user_email = params[:user_email].strip.downcase
        user = User.find_by(email: user_email)
        if !user
            flash[:error] = "You must provide an email address for a user that exists."
            redirect_to post_path(post.id) and return
        end
        # check that body is not empty
        body = params[:body]
        if body.empty?
            flash[:error] = "You cannot submit a comment without a body."
            redirect_to post_path(post.id) and return
        end
        # save comment and reload post thread
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
