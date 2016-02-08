class DiariesController < ApplicationController
  before_action :set_diary, only: %i(show edit update destroy)
  before_action :authenticate_user!, only: %i(new edit create update destroy)

  def index
    @diaries = Diary.page(params[:page]).order(id: :desc).includes(:user)
  end

  def show
  end

  def new
    @diary = current_user.diaries.build
  end

  def edit
  end

  def create
    @diary = current_user.diaries.build(diary_params)

    if @diary.save
      redirect_to @diary, notice: '日記を投稿しました。'
    else
      render :new
    end
  end

  def update
    if @diary.update(diary_params)
      redirect_to @diary, notice: '日記を更新しました。'
    else
      render :edit
    end
  end

  def destroy
    @diary.destroy
    redirect_to diaries_url, notice: '日記を削除しました。'
  end

  private

    def set_diary
      @diary = Diary.find(params[:id])
    end

    def diary_params
      params.require(:diary).permit(:title, :body, :diary_image)
    end
end
