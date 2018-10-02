class Form < ApplicationRecord
  belongs_to :user
  has_many :questions
  has_many :answers


  validates :position,
            length: {minimum: 5, maximum: 150}
  validates :location,
            length: {minimum: 3, maximum: 150}
  validates :company,
            length: {minimum: 2, maximum: 150}
  validates :consent,
            length: {minimum: 10}

end
