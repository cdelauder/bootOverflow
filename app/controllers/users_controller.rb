class UsersController < ApplicationController

  def index
    p session[:id]
    if session[:id]
      @user = User.find(session[:id])
      render 'index'
    else
      redirect_to new_session_path
    end
  end

  def new
    @user = User.new
  end

  def create
    p params[:user]
    @user = User.new params[:user]

    if @user.save

      redirect_to users_path
    else
       p "errors #{@user.errors.full_messages}"
      render :new
    end
  end
end

