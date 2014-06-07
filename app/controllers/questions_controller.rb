class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @user = User.find(current_user)
    @question = @user.questions.new(params[:question])
    if @question.save
      redirect_to questions_path(@question)
    else
      render :new
    end
  end

  def destroy
    @question = Question.find(params[:id])
    if current_user
      @question.destroy
      redirect_to questions_path
    else
      redirect_to new_sessions_path
    end
  end

end