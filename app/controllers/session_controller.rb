class SessionController < ApplicationController

  def new
    @user = User.find_by(email: params[:email])
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to users_path
    else
      flash.now[:danger] = 'Invalid email or password combination'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to signup_path
  end

end
