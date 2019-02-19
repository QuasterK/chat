class ChatroomController < ApplicationController
  before_action :login_required
  def index
    @messages = Message.all
  end

  def create
    message = Message.new(data: params[:data], user_id: current_user.id)
    message.save
    redirect_to root_path
  end

end
