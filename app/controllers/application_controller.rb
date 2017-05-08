class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_filter :set_global_search_variable

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
  
  def set_global_search_variable
    @q = Image.search params[:q]
  end
end
