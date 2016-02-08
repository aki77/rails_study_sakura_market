class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  class Forbidden < ActionController::ActionControllerError; end

  def render_access_forbidden
    raise ApplicationController::Forbidden
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :nickname
      devise_parameter_sanitizer.for(:account_update) << :nickname << :profile_image << :remove_profile_image
    end

  private

    def set_diary
      @diary = Diary.find(params[:diary_id])
    end
end
