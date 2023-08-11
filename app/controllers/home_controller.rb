class HomeController < ApplicationController
  def index
    return unless current_user

    redirect_to '/'
  end
end
