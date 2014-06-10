FactoryGirl.define do
  sequence :username do |n| "bob#{n}" end
  sequence :email do |n| "bob#{n}@bob.com" end
  sequence :password do |n| "pass123{n}" end
  sequence :password_confirmation do |n| "pass123{n}" end

  factory :user do
    username
    email
    password
    password_confirmation
  end

  sequence :title do |n| "blahblahblah#{n}" end
  sequence :content do |n| "yadaydadyada#{n}" end

  factory :question do
    content
    title
    user
  end
end