class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find params[:id]
  end

  def new
    @question = Question.new
  end

  def create
    @user = User.find(current_user)
    # CR @question = current_user.questions.build
    @question = @user.questions.new(params[:question])
    if current_user && @question.save
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  def destroy
    @question = Question.find(params[:id])
    if current_user  # CR this is unneccessary if you use a before filter for authentication
      @question.destroy
      redirect_to questions_path
    else
      redirect_to new_sessions_path
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if current_user && @question.update_attributes(params[:question])
      redirect_to question_path(@question)
    else
      redirect_to new_sessions_path
    end
  end

end
