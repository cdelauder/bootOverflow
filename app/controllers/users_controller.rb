class UsersController < ApplicationController

  def index
    if current_user
      @user = User.find(current_user)
      @questions = @user.questions
      render 'index'
    else
      redirect_to new_session_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new params[:user]
    if @user.save

      redirect_to root_path
    else
       p "errors #{@user.errors.full_messages}"
      render :new
    end
  end
end

