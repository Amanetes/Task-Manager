# frozen_string_literal: true

require 'test_helper'

class TaskStatusTest < ActiveSupport::TestCase
  def setup
    @status = TaskStatus.new(
      name: 'In testing'
    )
  end

  test 'status should be valid' do
    assert { @status.valid? }
  end

  test 'status should be unique' do
    duplicate_status = @status.dup
    @status.save!
    assert { !duplicate_status.valid? }
  end
end
