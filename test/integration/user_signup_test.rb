require "test_helper"

class UserSignupTest < ActionDispatch::IntegrationTest
  
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: { name:  "",
                               email: "foo@bar",
                               password:              "foo",
                               password_confirmation: "bar" }
    end
    assert_template 'users/new'
  end
    
  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, user: { name:  "Example user",
                               email: "user@example.com",
                               password:              "password",
                               password_confirmation: "password" }
    end
    follow_redirect!
    assert_template 'users/show'
  end
end
