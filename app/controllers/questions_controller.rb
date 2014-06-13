class QuestionsController < ApplicationController
  before_filter :set_current_question, only: [:destroy, :edit, :update, :show]

  def index
    @questions = Question.all
  end

  def show
  end

  def new
    @question = Question.new
  end

  def create
    @user = User.find(current_user)
    @question = @user.questions.new(question_params)
    if current_user && @question.save
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  def destroy
    if current_user
      @question.destroy
      redirect_to questions_path
    else
      redirect_to new_sessions_path
    end
  end

  def edit
  end

  def update
    if current_user && @question.update_attributes(question_params)
      redirect_to question_path(@question)
    else
      redirect_to new_sessions_path
    end
  end

  private

  def set_current_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :content)
  end

end

