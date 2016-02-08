class Admin::UsersController < Admin::AdminController
  before_action :set_user, only: %i(show edit update destroy)

  def index
    @users = User.page(params[:page]).order(id: :desc)
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to [:admin, @user], notice: 'ユーザ情報を更新しました。'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_url, notice: 'ユーザ情報を削除しました。'
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :nickname, :profile_image, :remove_profile_image)
    end
end
