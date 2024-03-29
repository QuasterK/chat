class SessionController < ApplicationController

  def new
    @user = User.find_by(email: params[:email])
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
      user.update_column(:status, true)
    else
      flash.now[:danger] = 'Invalid email or password combination'
      render :new
    end
  end

  def destroy
    user = User.find_by(id: current_user.id)
    user.update_column(:status, false)
    session.delete(:user_id)
    @current_user = nil
    redirect_to signup_path
  end

end
