class AnswerQuestion < ApplicationRecord
  belongs_to :answer
  belongs_to :question
  belongs_to :question_option

  validates :answer_id,
            presence: true

end
