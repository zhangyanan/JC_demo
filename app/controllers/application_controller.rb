class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    User.find session[:user_id] rescue nil
  end
  def set_session_user user
    session[:user_id] = user.id
    session[:p] = []
  end
end
