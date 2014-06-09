class CommentsController < ApplicationController
  before_filter :load_commentable

   def new
    @comment = @commentable.comments.new
   end

  def create
    @comment = @commentable.comments.new params[:comment]
    if @comment.save
      if params[:question_id]
        question = Question.find params[:question_id]
        redirect_to question_path(question)
      else
        answer = Answer.find params[:answer_id]
        question = Question.find(Answer.find(params[:answer_id]).question_id)
        redirect_to question_path(question)
      end
    else
      render :new
    end
  end

  private

  def load_commentable
    resource, id = request.path.split('/')[1, 2]
    p resource
    @commentable = resource.singularize.classify.constantize.find(id)
  end
end