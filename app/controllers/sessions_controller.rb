class SessionsController < ApplicationController
  def new
  end

  def create
   user= User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to chats_path
    else
      flash[:danger] = 'Incorrect password and email: Please check your login details again'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = 'Logged out'
    redirect_to new_session_path
  end
end
