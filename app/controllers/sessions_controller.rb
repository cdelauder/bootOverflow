class SessionsController < ApplicationController
<<<<<<< HEAD

=======
>>>>>>> master
  def new
    @user = User.new
  end

  def create
<<<<<<< HEAD
    @user = User.new(params[:user])
    if User.find(@user)
      redirect_to user_path
    else
      render 'new'
    end
  end
end
=======
    @user = User.find_by_email params[:email]

    if @user && @user.authenticate(params[:password])
      login @user
      redirect_to users_path
    else
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path
  end
end
>>>>>>> master
