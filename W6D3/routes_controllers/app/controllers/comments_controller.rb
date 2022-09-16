class CommentsController < ApplicationController
    def index
        if params[:author_id]
            @comments = Comment.find_by(author_id: params[:author_id])
        else
            @comments = Comment.find_by(artwork_id: params[:artwork_id])
        end
        render json: @comments
    end
    
    private
    
    def comment_params
        params.require(:comment).permit(:author_id, :artwork_id)
    end
end


# params = {  book => { author is > 1 , artwork > 3 }  }


