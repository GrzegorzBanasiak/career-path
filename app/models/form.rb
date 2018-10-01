class Form < ApplicationRecord
  belongs_to :user
  has_many :questions

  validates :position,
            presence: true,
            length: {minimum: 5, maximum: 150}
  validates :location,
            presence: true,
            length: {minimum: 3, maximum: 150}
  validates :company,
            presence: true,
            length: {minimum: 2, maximum: 150}
  validates :consent,
            presence: true,
            length: {minimum: 10}

end
