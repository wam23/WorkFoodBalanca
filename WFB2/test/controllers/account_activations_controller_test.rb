require "test_helper"

class AccountActivationsControllerTest < ActionDispatch::IntegrationTest
  test "should get PasswordResets" do
    get account_activations_PasswordResets_url
    assert_response :success
  end

  test "should get Sessions" do
    get account_activations_Sessions_url
    assert_response :success
  end

  test "should get StaticPages" do
    get account_activations_StaticPages_url
    assert_response :success
  end
end
