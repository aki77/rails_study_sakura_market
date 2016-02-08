class GoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_diary

  def create
    @good = @diary.goods.create!(user: current_user)

    respond_to do |format|
      format.html { redirect_to @diary, notice: 'Good!を付けました。' }
      format.js
    end
  end

  def destroy
    @good = @diary.goods.find_by!(user: current_user)
    @good.destroy!

    respond_to do |format|
      format.html { redirect_to @diary, notice: 'Good!を取り消しました。' }
      format.js
    end
  end

  private

    def set_diary
      @diary = Diary.find(params[:diary_id])
    end
end
