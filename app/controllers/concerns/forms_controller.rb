class FormsController < ApplicationController

  def index;end

  def new
    @form = current_user.forms.build
  end

end
