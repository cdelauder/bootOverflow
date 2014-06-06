class UsersController < ApplicationController

  def index
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

