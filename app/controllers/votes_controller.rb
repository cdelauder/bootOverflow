class VotesController < ApplicationController
  before_filter :load_votable

  def new
    @vote = @votable.votes.new
    p @vote
  end

  def create
    @vote = @votable.votes.new params[:vote]
    params[:question_id] ? id = params[:question_id] : id = params[:answer_id]
    if current_user && @vote.save
      redirect_to question_path(id)
    else
      redirect_to question_path(id)
    end
  end

  def destroy
    @vote = @votable.votes.find(params[:id])
    params[:question_id] ? id = params[:question_id] : id = params[:answer_id]
    if current_user
      @vote.destroy
      redirect_to question_path(id)
    else
      redirect_to question_path(id)
    end
  end

  private

  def load_votable
    resource, id = request.path.split('/')[1, 2]
    p resource
    @votable = resource.singularize.classify.constantize.find(id)
  end

end