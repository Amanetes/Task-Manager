# frozen_string_literal: true

require 'test_helper'

class Web::SessionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
  end

  test 'should GET sessions#new' do
    get new_session_path
    assert_response :success
  end

  test 'should POST sessions#create' do
    sign_in_as(@user)
    assert_response :redirect
    assert { signed_in? }
  end

  test 'should DELETE sessions#destroy' do
    sign_in_as(@user)
    delete session_path(@user)
    assert_redirected_to root_url
    assert { !signed_in? }
  end
end
