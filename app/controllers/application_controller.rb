class ApplicationController < ActionController::Base

  def require_signin
    unless user_signed_in?
      redirect_to new_user_session_path, alert: 'Please sign in first'
    end
  end
end

