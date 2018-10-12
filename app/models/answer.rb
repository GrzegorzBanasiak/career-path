class Answer < ApplicationRecord
  belongs_to :form
  has_many :answer_questions, dependent: :destroy

  validates :firstname,
            length: {minimum: 2, maximum: 150}
  validates :secondname,
            length: {minimum: 2, maximum: 150}
  validates :email,
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create },
            presence: true
  validates :phonenumber,
            numericality: { only_integer: true },
            presence: true
  validates :city,
            length: {minimum: 2, maximum: 150}
  validates :is_consant,
            presence: true
end
