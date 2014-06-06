class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if User.find(@user)
      redirect_to user_path
    else
      render 'new'
    end
  end
end