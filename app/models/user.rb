class User < ActiveRecord::Base
  attr_accessible :username, :email, :cohort, :password
end
