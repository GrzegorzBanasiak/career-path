class FormsController < ApplicationController
  before_action :find_form, only: [:edit]

  def index;end

  def new
    @form = current_user.forms.build
  end

  def create
    @form = current_user.forms.build(form_params)

    if @form.save
      redirect_to edit_form_path(@form)
    end
  end

  def edit

  end


  private
    def form_params
      params.require(:form).permit(:position, :company, :location, :description)
    end

    def find_form
      @form = Form.find(params[:id])
    end
end
