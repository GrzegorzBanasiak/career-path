class AnswersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]
  layout 'answer', only: [:new]

  def new
    @form = Form.find(params[:form_id])
    @questions = @form.questions.includes(:question_options)
    @answer = @form.answers.build
  end

  def create
    puts params
    puts 'dupaaa alpaka'
    redirect_to root_path
  end

  def show

  end

  private

end
