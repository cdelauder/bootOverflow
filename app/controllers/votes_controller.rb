class VotesController < ApplicationController
  before_filter :load_votable

  def new
    @vote = @votable.votes.new
  end

  def create
    @vote = @votable.votes.new params[:vote]
    # CR use a single partial and create a private controller method to determine Question or Answer
    p params
    if params[:question_id]
      @question = Question.find(params[:question_id])
      if current_user && @vote.save
        render :partial => 'votes/votes_questions', :locals => {:question => @question}
      end
    else
      @answer = Answer.find(params[:answer_id])
      if current_user && @vote.save
        render :partial => 'votes/votes_answers', :locals => {:answer => @answer}
      end
    end
  end

  def destroy
    @vote = @votable.votes.find(params[:id])
    if params[:question_id]
      @question = Question.find(params[:question_id])
      if current_user
        @vote.destroy
        render :partial => 'votes/votes_questions', :locals => {:question => @question}
      end
    elsif params[:answer_id]
      @answer = Answer.find(params[:answer_id])
      if current_user
        @vote.destroy
        render :partial => 'votes/votes_answers', :locals => {:answer => @answer}
      end
    end
  end

  private

  def load_votable
    resource, id = request.path.split('/')[1, 2]
    p resource
    @votable = resource.singularize.classify.constantize.find(id)
  end

end
