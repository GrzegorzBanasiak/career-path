class PagesController < ApplicationController
  layout "mainpage", only: [:index]

  def index;end
  def about;end

end
