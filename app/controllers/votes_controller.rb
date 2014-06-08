class VotesController < ApplicationController
  before_filter :load_votable

  def new
    @vote = @votable.votes.new
    p @vote
  end

  def create
    @vote = @votable.votes.new params[:vote]
    if @vote.save
      redirect_to questions_path
    else
      render :new
    end
  end

  def destroy
    @vote = @votable.votes.find(params[:votable_id])
    if current_user
      @vote.destroy
      render :new
    else
      render :new
    end
  end

  private

  def load_votable
    resource, id = request.path.split('/')[1, 2]
    p resource
    @votable = resource.singularize.classify.constantize.find(id)
  end

end