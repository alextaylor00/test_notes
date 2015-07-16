class CommentsController < ApplicationController

  def create
    @note = Note.find(params[:note_id])
    @comment = @note.comments.build(comment_params)

    if @comment.save
      redirect_to @note
    else
      @comments_to_display = @note.comments.persisted
      render 'notes/show'
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:text)
    end


end
