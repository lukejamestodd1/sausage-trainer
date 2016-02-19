class UsersController < ApplicationController

  def create
    @user = User.new()
    @user.username = params[:username]
    @user.email = params[:email]
    @user.password = params[:password]
    @user.instructor = params[:instructor]
    @user.student = params[:student]
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/home'
    else
      redirect_to '/login'
    end
  end

end
