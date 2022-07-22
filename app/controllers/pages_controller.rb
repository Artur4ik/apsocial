class PagesController < ApplicationController
  def index
    redirect_to(user_path(id: current_user.id)) if user_signed_in?
  end
end
