module SessionsHelper

  #logs in the user
  def log_in(user)
    session[:user_id] = user.id
  end

  #returns the current user
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  #current user check
  def logged_in?
    !current_user.nil?
  end

end
