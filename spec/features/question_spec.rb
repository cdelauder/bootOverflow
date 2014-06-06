require 'spec_helper'

feature 'A user can create a question by clicking a link on the question index' do
  it 'create should have a form a user can fill out to post a question' do
    user = User.create(name: 'bob')
    current_user.stub(:current_user) {user}
    visit '/questions'
    click_on 'Post a new question'
    fill_in 'question_title', :with => "i don't know"
    fill_in 'question_content', :with => "please tell me things"
    click_on 'submit'
    expect(page).to have_content("please tell me things")
  end
end