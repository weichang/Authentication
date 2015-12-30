class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  
  private
  
  def current_user
    
     @current_user ||= User.find(session[:user_id]) if session[:user_id]
    
  end
  
  def check_login
    
    unless session[:user_id]
    
        redirect_to login_path
    end
  end
  
  def active?
    user = User.find(session[:user_id])
    if !user.is_active
      redirect_to login_path
    end
  end
  
end
