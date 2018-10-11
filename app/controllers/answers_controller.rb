class AnswersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create, :new]
  layout 'answer', only: [:new]

  def new
    @form = Form.find(params[:form_id])
    @questions = @form.questions.includes(:question_options)
    @answer = @form.answers.build
  end

  def create
    applicationCv = ApplicationCv.new(params)
    if applicationCv.is_all_ok
      puts "zwalidowany"
    else
      puts applicationCv.answer.errors.inspect
      render json:{ errors: applicationCv.answer.errors }
    end
  end

  def show

  end

  private

end
