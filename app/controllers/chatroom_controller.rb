class ChatroomController < ApplicationController
  before_action :login_required
  def index
    @messages = Message.all
  end
end
