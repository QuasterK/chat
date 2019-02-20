class ChatroomController < ApplicationController
  before_action :login_required
  def index
    @messages = Message.all
  end

  def create
    message = Message.new(data: params[:data], user_id: current_user.id)
    if message.save
      ActionCable.server.broadcast "chatroom_channel",
                                    nick: current_user.nick,
                                    msg: message.data
    end
  end

end
