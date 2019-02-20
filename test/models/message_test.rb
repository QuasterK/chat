require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "should have data" do
    message = Message.new
    assert_not message.save
  end

  test "should belong to user" do
    message = Message.new(data: 'some dummy data')
    assert_not message.save
  end

  test "should save message with data and user id" do
    user = User.first
    message = Message.new(data: 'some dummy data', user_id: user.id)
    assert message.save
  end

end
