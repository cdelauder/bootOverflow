class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :username, :email, :cohort, :password, :password_confirmation
  has_many :questions
end