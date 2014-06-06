class User < ActiveRecord::Base
  def index
    if session[:id]
      @user = User.find(session[:id])
    else
      redirect_to new_sessions_path
    end
  end
end