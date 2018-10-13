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


  def set_params(answer_params)
    self.firstname     = answer_params[:firstname]
    self.secondname    = answer_params[:secondname]
    self.email         = answer_params[:email]
    self.phonenumber   = answer_params[:phonenumber]
    self.city          = answer_params[:city]
    self.is_consant    = answer_params[:is_consant] == "true"
  end
end
