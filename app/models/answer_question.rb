class AnswerQuestion < ApplicationRecord
  belongs_to :answer
  belongs_to :question_option
end
