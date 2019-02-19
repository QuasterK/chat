class SessionController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(email: params[:email])
    if @user
      redirect_to signup_path
    else
      redirect_to signup_path
    end
  end

end
