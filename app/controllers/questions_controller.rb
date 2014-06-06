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
    @question = Question.new(question_params, user_id: current_user)
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


  private

  def question_params
    params.require(:question).permit(:title, :content)
  end

end