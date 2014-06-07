class Answer < ActiveRecord::Base
  attr_accessible :content
  belongs_to :question
  validates :content, presence: true
end