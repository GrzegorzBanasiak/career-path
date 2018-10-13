class AnswerQuestion < ApplicationRecord
  belongs_to :answer
  belongs_to :question
  belongs_to :question_option, optional: true

  validates :answer_id,
            presence: true
  validates :question_option_id,
            presence: true, unless: :question_is_open
  validates :content,
            presence: true, if: :question_is_open


  def question_is_open
    !question.is_closed
  end
end
