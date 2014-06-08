class AnswersController < ApplicationController
  def new
    @question = Question.find params[:question_id]
    @answer = @question.answers.new
  end

  def create
    @question = Question.find params[:question_id]
    @answer = @question.answers.new params[:answer]
    if @answer.save
      redirect_to question_path(@question)
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
      redirect_to question_path(@question)
    else
      render :edit
    end
  end

  def destroy
    question = Question.find params[:question_id]
    answer = question.answers.find params[:id]

    answer.destroy
    redirect_to question_path(question)
  end
end