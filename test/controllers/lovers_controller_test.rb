require 'test_helper'

class LoversControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lover = lovers(:one)
  end

  test "should get index" do
    get lovers_url
    assert_response :success
  end

  test "should get new" do
    get new_lover_url
    assert_response :success
  end

  test "should create lover" do
    assert_difference('Lover.count') do
      post lovers_url, params: { lover: { email: @lover.email, password: @lover.password } }
    end

    assert_redirected_to lover_url(Lover.last)
  end

  test "should show lover" do
    get lover_url(@lover)
    assert_response :success
  end

  test "should get edit" do
    get edit_lover_url(@lover)
    assert_response :success
  end

  test "should update lover" do
    patch lover_url(@lover), params: { lover: { email: @lover.email, password: @lover.password } }
    assert_redirected_to lover_url(@lover)
  end

  test "should destroy lover" do
    assert_difference('Lover.count', -1) do
      delete lover_url(@lover)
    end

    assert_redirected_to lovers_url
  end
end
