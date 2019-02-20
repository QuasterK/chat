require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(email: 'email@email.pl', nick: 'nick')
  end

  test "should not save user without email" do
    @user.email = ''
    assert_not @user.save
  end

  test "should not save user without nick" do
    @user.nick = ''
    assert_not @user.save
  end

  test "should not save user if nick isn't uniq" do
    @user.save
    user2 = User.new(email: 'email2@email.pl', nick: 'nick')
    assert_not user2.save
  end

  test "should not save user if email isn't uniq" do
    @user.save
    user2 = User.new(email: 'email@email.pl', nick: 'nick2')
    assert_not user2.save
  end
  # password tests
  test "should not save user without password" do
    user = User.new(email: 'uniq@email.pl', nick: 'uniq')
    assert_not user.save
  end

  test "should not save user without same value of password and password_confirmation" do
    user = User.new(email: 'uniq@email.pl', nick: 'uniq', password: '123456', password_confirmation: 'wrong password')
    assert_not user.save
  end

  test "should save user with the same value of password and password_confirmation" do
    user = User.new(email: 'uniq@email.pl', nick: 'uniq', password: '123', password_confirmation: '123')
    assert user.save
  end

end
