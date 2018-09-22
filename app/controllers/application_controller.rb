class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  layout :set_if_devise


  private
    def set_if_devise
      if devise_controller?
        "mainpage"
      else
        "application"
      end
    end
end
