class AnswersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create, :new]
  layout 'answer', only: [:new]

  def new
    @form = Form.find(params[:form_id])
    @questions = @form.questions.includes(:question_options)
    @answer = @form.answers.build
  end

  def create
    cvMaker = CvMaker.new(params)
    if cvMaker.is_all_ok
      puts "zwalidowany"
    else
      puts cvMaker.answer.errors.inspect
      render json:{ errors: cvMaker.answer.errors }
    end
  end

  def show

  end

  def thanks_page

  end

  private

end
