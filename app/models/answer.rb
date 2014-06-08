class Answer < ActiveRecord::Base
  attr_accessible :content

  belongs_to :question
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  validates :content, presence: true
end