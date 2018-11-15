class CommentsController < ApplicationController

    http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

    def create
        @article = Article.find(params[:article_id])
        # this gets a hold of the targeted article by id
        @comment = @article.comments.create(comment_params)
        # this method creates and saves the comment
        # and links the comment to a particular article

        redirect_to article_path(@article)
        # made new comment is saved they are redirected to the show page for the article
        
    end

    def destroy
        @article = Article.find(params[:article_id])
        # finds the targeted article by id
        @comment = @article.comments.find(params[:id])
        # finds the exact comment affiliated with the article
        @comment.destroy
        # removes the comment from the database
        redirect_to article_path(@article)
        # redirect you to the show action
    end

    private
        def comment_params
            params.require(:comment).permit(:commenter, :body)
        end
end
