# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :require_login
  protect_from_forgery with: :exception
  include SessionsHelper

  private

<<<<<<< HEAD
  def require_login
    unless logged_in?
      flash[:error] = 'You need to log in to access this section...'
      redirect_to '/login'
=======
    def require_login
      unless logged_in?
        flash[:error] = "You need to log in to access this section..."
        redirect_to "/login"
      end
>>>>>>> b0487b3a9b34e68ed1233ae3132324c23454adbb
    end
end
