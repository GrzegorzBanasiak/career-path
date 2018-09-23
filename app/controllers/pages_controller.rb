class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  layout "mainpage", only: [:index]

  def index
      go_to_panel_if_user_signed_in
  end

  def about;end

  private

    def go_to_panel_if_user_signed_in
      if user_signed_in?
        redirect_to panel_index_path
      end
    end

end
