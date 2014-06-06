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

  end
end