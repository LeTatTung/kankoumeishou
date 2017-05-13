class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  def load_data_static
    if user_signed_in?
      @followings = current_user.active_relationships.build
      @popular_images = current_user.images
    end
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit :email,
      :name, :password, :password_confirmation, :sex, :avatar}
  end

  private
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t "please-log-in"
      redirect_to log_in_url
    end
  end

  def logged_in?
    current_user.present?
  end

end
