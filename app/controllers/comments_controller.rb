class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_diary
  before_action :set_comment, only: %i(destroy)

  def create
    @comment = @diary.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      DiaryMailer.comment_email(@comment).deliver_later
      flash[:notice] = 'コメントを投稿しました。'
    else
      flash[:alert] = 'コメントの投稿に失敗しました。'
    end

    redirect_to @diary
  end

  def destroy
    @comment.destroy!
    redirect_to @diary, notice: 'コメントを削除しました。'
  end

  private

    def set_comment
      @comment = @diary.comments.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body)
    end
end
