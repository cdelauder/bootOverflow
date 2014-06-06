require 'spec_helper'

describe QuestionsController do
  context '#index' do
    it 'should display a list of all questions' do
      get 'index'
      expect(assigns(:questions)).to eq(Question.all)
    end
  end

  context '#show' do
    it 'should display a single question' do
      question = Question.create(title: "This thing here", content: "this is content", user_id: 1)
      get 'show', :id => question
      expect(assigns(:question)).to eq(Question.last)
    end
  end

  context '#delete' do
    it 'should delete a question' do
      question = Question.create(title: "Another Question", content: "Test", user_id: 1)
      post 'destroy', :id => question
      expect(Question.last).to not_eq(question)
    end
  end
end