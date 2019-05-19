class ApplicationController < ActionController::Base
  before_action :require_login
  protect_from_forgery with: :exception
  include SessionsHelper

  private

  def require_login
    unless logged_in?
      flash[:error] = "You need to log in to access this section..."
      redirect_to "/login"
    end
  end
end
