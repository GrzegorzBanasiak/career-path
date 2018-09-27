class FormsController < ApplicationController
  before_action :find_form, only: [:edit, :update]

  def index
    @forms = current_user.forms.all
  end

  def new
    @form = current_user.forms.build
  end

  def create
    @form = current_user.forms.build(form_params)

    if @form.save
      redirect_to edit_form_path(@form, anchor: 'new-form-option-title')
    end
  end

  def edit
    @questions = @form.questions.all
  end

  def update
    @form.update_attributes(form_params)
    redirect_to (edit_form_path(@form))
  end

  private
    def form_params
      params.require(:form).permit(:position, :company, :location, :description)
    end

    def find_form
      @form = Form.find(params[:id])
    end
end
