class PostsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        @posts = Post.all
    end

    def show
        @post = Post.find_by_id(params[:id])
        if @post
            @post
        else
            flash[:alert] = "Post does not exist"
            redirect_to posts_path
        end
    end

    def new
        # binding.pry
        @post = Post.new
    end

    def edit
    end

    def create
        @post = current_user.posts.build(post_params)
        @post.category = Category.find_by(name: "Uncategorized")
        # binding.pry
        if @post.save
            redirect_to posts_path
        else
            render :new
        end
    end

    def update
    end
    
    def destroy
    end

    private

    def post_params
        params.require(:post).permit(:title, :content)
    end
end
