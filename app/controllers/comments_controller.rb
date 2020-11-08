class CommentsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        if params[:post_id]
            if @post = Post.find_by_id(params[:post_id])
                @comments = @post.comments
            else
                flash[:alert] = "That post does not exist." if params[:post_id]
                @comments = Comment.all
            end
        else
            @comments = Comment.all
            # binding.pry
        end
    end

    def show
        redirect_to posts_path
    end

    def new
        if params[:post_id] && @post = Post.find_by_id(params[:post_id])
            @comment = @post.comments.build
            binding.pry
        else
            flash[:alert] = "That post does not exist." if params[:post_id]
            @comment = Comment.new
        end
    end

    def edit
        @comment = Comment.find_by_id(params[:id])
    end
    def create
        @comment = current_user.comments.build(comment_params)
        # binding.pry
        if @comment.save
            redirect_to comments_path
        else
            render :new
        end
    end
    def update
        @comment = Comment.find_by_id(params[:id])
    end
    def destroy
    end
    private
    def comment_params
        params.require(:comment).permit(:content, :post_id)
    end
end
