class DestinationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_destination, only: %i(update destroy)

  def new
    @destination = current_user.build_destination
  end

  def edit
    redirect_to new_destination_url unless current_user.destination.present?
    @destination = current_user.destination
  end

  def create
    @destination = current_user.build_destination(destination_params)

    if @destination.save
      redirect_to edit_destination_url, notice: '送付先情報を登録しました。'
    else
      render :new
    end
  end

  def update
    if @destination.update(destination_params)
      redirect_to edit_destination_url, notice: '送付先情報を更新しました。'
    else
      render :edit
    end
  end

  def destroy
    @destination.destroy
    redirect_to new_destination_url, notice: '送付先情報を削除しました。'
  end

  private

    def set_destination
      @destination = Destination.find_by!(user: current_user)
    end

    def destination_params
      params.require(:destination).permit(:name, :address)
    end
end
