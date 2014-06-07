class Comment < ActiveRecord::Base
  attr_accessible :body
  belongs_to :commentable, polymorphic: true
  validates :body, presence: true
end