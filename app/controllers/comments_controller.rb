class CommentsController < ApplicationController
    def create
        # @comment = Comment.new
        # comment.content = params[:input_content]
        # comment.note_id = params[:note_id]
        # comment.save
       
        @comment = Comment.new  
        @comment.content = params[:comment][:content]
        @comment.user_id = params[:comment][:user_id]
        @comment.save
        
         redirect_to @memo
    end

    def destroy
        
        @comment.destroy
        redirect_to @memo#memo_path(@comment)
        
    end
end
