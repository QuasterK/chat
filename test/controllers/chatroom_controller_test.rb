require 'test_helper'

class ChatroomControllerTest < ActionDispatch::IntegrationTest
  test "the truth" do
    assert true
  end
  def setup
    @messages = Message.all
    @user = User.create(nick: "john", email: "john@example.com", password: "password", password_confirmation: "password")
  end
  # index test
  test "should not show index for unlogged user" do
    get root_path
    assert_response :redirect
  end

  # create test

  test "should create message" do
    message = Message.new(data: 'create', user_id: @user.id)
    assert message.save
  end

end
