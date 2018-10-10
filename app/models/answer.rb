class Answer < ApplicationRecord
  belongs_to :form
  has_many :answer_questions
end
