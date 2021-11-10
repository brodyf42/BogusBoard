class PostsController < ApplicationController
    def index
        @posts = Post.all.order(created_at: :desc)
    end

    def show
        find_post
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

    def edit
        find_post
    end

    def update
        find_post
        body = params[:post][:body]
        if @post.update(body: body)
            redirect_to @post
        else
            render :edit
        end
    end

    def destroy
        find_post
        @post.destroy
        redirect_to posts_path
    end

    private
    def find_post
        @post = Post.find(params[:id])
    end
end
