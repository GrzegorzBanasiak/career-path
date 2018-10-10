class QuestionOption < ApplicationRecord
  belongs_to :question
  has_many :answer_questions
  
  validates :content, presence: true
end
