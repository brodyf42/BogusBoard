class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    def create
        user_email = params[:post][:user_email].strip.downcase
        user = User.find_by(email: user_email)
        if !user
            @post = Post.new
            render :new and return
        end

        body = params[:post][:body]
        @post = Post.new(user_id: user.id, body: body, active: true)

        if @post.save
            redirect_to @post
        else
            render :new
        end
    end
end
