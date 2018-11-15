class CommentsController < ApplicationController

    def create
        @article = Article.find(params[:article_id])
        # this gets a hold of the targeted article
        @comment = @article.comments.create(comment_params)
        # this method creates and saves the comment
        # and links the comment to a particular article

        redirect_to article_path(@article)
        # made new comment is saved they are redirected to the show page for the article
        
    end

    private
        def comment_params
            params.require(:comment).permit(:commenter, :body)
        end
end
