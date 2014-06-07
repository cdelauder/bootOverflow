require 'spec_helper'

describe QuestionsController do
  context '#index' do
    it 'should display a list of all questions' do
      get 'index'
      expect(assigns(:questions)).to eq(Question.all)
    end
  end

  context '#show' do
    let(:user) {email: 'a@a.com', password: 'a', password_confirmation: 'a'}
    let (:question) {title: "This thing here", content: "this is content", user_id: 1}
    it 'should display a single question' do
      Question.create(:question)
      get 'show', :id => :user.id
      expect(assigns(:question)).to eq(Question.last)
    end
  end

  context '#delete' do
    it 'should delete a question' do
      Question.create(:question)
      post 'destroy', :id => :user.id
      expect(Question.last).to not_eq(question)
    end
  end
endz