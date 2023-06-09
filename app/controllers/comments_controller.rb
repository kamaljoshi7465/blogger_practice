class CommentsController < ApplicationController
    def create 
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        redirect_to article_path(@article)
    end

    def show 
        @comment = Article.find(params[:article_id]).comments.find(params[:id])
    end
    private 
    def comment_params
        params.require(:comment).permit(:author_name, :body)
    end
end
