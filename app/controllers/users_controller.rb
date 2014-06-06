class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    p "in user create"
    user_params = {
      username: params[:user][:username],
      email: params[:user][:email],
      cohort: params[:user][:cohort],
      password: params[:user][:password],
    }

    if params[:user][:password] == params[:user][:password_confirmation]
      @user = User.new( user_params )
      if @user.save
        redirect_to users_path
      else
        render :new
      end
    end
  end

end

