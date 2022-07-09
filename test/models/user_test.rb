# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      password: 'foobar',
      password_confirmation: 'foobar'
    )
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'first name should be present' do
    @user.first_name = ''
    assert_not @user.valid?
  end

  test 'last name should be present' do
    @user.last_name = ''
    assert_not @user.valid?
  end

  test 'email should be unique' do
    duplicate_user = @user.dup
    @user.save!
    assert { !duplicate_user.valid? }
  end
end
