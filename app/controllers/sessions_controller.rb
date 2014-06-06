class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.authenticate(params[:email], params[:password])

    if user
      session[:user_id] = user.id
      redirect_to 'users#index'
    else
      redirect_to 'sessions#new'
  end

  def destroy
    session[:user_id] = nil
    redirect_to 'sessions#new'
  end
end
