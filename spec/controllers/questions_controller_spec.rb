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
      question = Question.create(title: "This thing here", content: "this is content")
      get 'show', :id => question
      expect(assigns(:question)).to eq(Question.last)
    end
  end
end