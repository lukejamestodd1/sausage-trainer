class PagesController < ApplicationController

  def splash
    if logged_in?
      @user = current_user
      redirect_to '/home'
    end
    render :splash
  end

  def login
    render :login
  end

  def sign_up
    render :sign_up
  end

  def home
    if logged_in?
      render :home, layout: 'home'
    else
      redirect_to '/'
    end
  end
end
