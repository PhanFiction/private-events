require "test_helper"

class UserControllerTest < ActionDispatch::IntegrationTest
 test "should sign up with email, password, and username" do
    # Set up the sign up data
    email = "user@example.com"
    password = "password123"
    username = "john_doe"

    # Simulate the sign up request
    post "/users", params: {
      user: {
        email: email,
        password: password,
        password_confirmation: password,
        username: username
      }
    }

    # Verify the response
    assert_response :redirect
    assert_redirected_to root_url

    # Verify the user was created
    user = User.find_by(email: email)
    assert_not_nil user
    assert_equal username, user.username

    # Verify the user is logged in
    assert_signed_in user
  end
end
