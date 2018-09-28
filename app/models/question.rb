class Question < ApplicationRecord
  belongs_to :form
  has_many :question_options, dependent: :destroy
end
