require 'test_helper'

class AgePreferencesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @age_preference = age_preferences(:one)
  end

  test "should get index" do
    get age_preferences_url
    assert_response :success
  end

  test "should get new" do
    get new_age_preference_url
    assert_response :success
  end

  test "should create age_preference" do
    assert_difference('AgePreference.count') do
      post age_preferences_url, params: { age_preference: { end_age: @age_preference.end_age, start_age: @age_preference.start_age } }
    end

    assert_redirected_to age_preference_url(AgePreference.last)
  end

  test "should show age_preference" do
    get age_preference_url(@age_preference)
    assert_response :success
  end

  test "should get edit" do
    get edit_age_preference_url(@age_preference)
    assert_response :success
  end

  test "should update age_preference" do
    patch age_preference_url(@age_preference), params: { age_preference: { end_age: @age_preference.end_age, start_age: @age_preference.start_age } }
    assert_redirected_to age_preference_url(@age_preference)
  end

  test "should destroy age_preference" do
    assert_difference('AgePreference.count', -1) do
      delete age_preference_url(@age_preference)
    end

    assert_redirected_to age_preferences_url
  end
end
