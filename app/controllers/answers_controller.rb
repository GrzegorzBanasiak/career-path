class AnswersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]
  layout 'answer', only: [:new]

  def new
    @form = Form.find(params[:form_id])
  end

  def create

  end

  def show

  end

  private

end
