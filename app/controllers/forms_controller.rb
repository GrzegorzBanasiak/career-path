class FormsController < ApplicationController

  def index;end

  def new
    @form = current_user.forms.build
  end

  def create
    @form = current_user.forms.build(form_params)

    if @form.save
      redirect_to forms_path
    end
  end


  private
    def form_params
      params.require(:form).permit(:position, :company, :location, :description)
    end
end
