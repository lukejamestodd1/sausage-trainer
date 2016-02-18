class PagesController < ApplicationController

  def splash
    if logged_in?
      @user = current_user
    end
    render :splash
  end
end
