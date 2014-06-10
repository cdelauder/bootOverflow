require 'spec_helper'

describe QuestionsController do
  let!(:user) { create(:user) }
  let!(:question) { create(:question, user: user) }

  before :each do
    login(user)
  end

  context '#index' do
    it 'should display a list of all questions' do
      get 'index'
      expect(assigns(:questions)).to eq(Question.all)
    end
  end

  context '#show' do
    it 'should display a single question' do
      get 'show', :id => user.id
      expect(assigns(:question)).to eq(Question.last)
    end
  end

  context '#delete' do
    it 'should delete a question' do
      post 'destroy', :id => user.id
      expect(user.reload.questions).to be_empty
    end
  end
end