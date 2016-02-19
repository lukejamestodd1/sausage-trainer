class SessionController < ApplicationController

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/home'
    else
      redirect_to '/login'
    end
  end

  def destroy
    reset_session
    redirect_to '/'
  end

end
