class AnswersController < ApplicationController
  def new
    @question = Question.find params[:question_id]
    @answer = @question.answers.new
  end

  def create
    @question = Question.find params[:question_id]
    @answer = @question.answers.new params[:answer]
    if @answer.save
      redirect_to questions_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end