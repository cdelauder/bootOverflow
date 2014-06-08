class VotesController < ApplicationController
  before_filter :load_votable

  def new
    @vote = @votable.votes.new
    p @vote
  end

  def create
    @vote = @votable.votes.new params[:vote]
    if current_user && @vote.save
      redirect_to question_path(params[:question_id])
    else
      redirect_to question_path(params[:question_id])
    end
  end

  def destroy
    p params
    @vote = @votable.votes.find(params[:id])
    if current_user
      @vote.destroy
      redirect_to question_path(params[:question_id])
    else
      redirect_to question_path(params[:question_id])
    end
  end

  private

  def load_votable
    resource, id = request.path.split('/')[1, 2]
    p resource
    @votable = resource.singularize.classify.constantize.find(id)
  end

end