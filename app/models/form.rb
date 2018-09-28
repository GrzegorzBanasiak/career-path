class Form < ApplicationRecord
  belongs_to :user
  has_many :questions
  has_many :question_options
end
