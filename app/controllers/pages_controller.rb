class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  layout "mainpage", only: [:index]

  def index;end
  def about;end

end
