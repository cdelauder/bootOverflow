class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find
  end
end
