require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.first
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { nick: 'nick', email: 'email@gmail.com', password: 'password', password_confirmation: 'password'} }
    end

    assert_redirected_to login_url
  end

  test "should not get edit" do
    get edit_user_url(@user)
    assert_response :redirect
  end

  test "should not update user" do
    patch user_url(@user), params: { user: { email: @user.email, name: @user.name, nick: @user.nick, password_digest: @user.password_digest, surname: @user.surname } }
    assert_redirected_to login_url
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to login_url
  end
end
