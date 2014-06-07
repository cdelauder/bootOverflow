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
    @question = Question.find params[:question_id]
    @answer = @question.answers.find params[:id]
  end

  def update
    @question =Question.find params[:question_id]
    @answer = @question.answers.find params[:id]

    if @answer.update_attributes params[:answer]
      redirect_to questions_path
    else
      render :edit
    end
  end

  def destroy
    p params[:question_id]
    p params[:id]

    question = Question.find params[:question_id]
    answer = question.answers.find params[:id]

    answer.destroy
    redirect_to questions_path
  end
end