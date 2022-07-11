# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :creator, class_name: 'User', inverse_of: :tasks
  belongs_to :executor, class_name: 'User', inverse_of: :tasks
  belongs_to :status, class_name: 'TaskStatus', foreign_key: 'task_status_id', inverse_of: :tasks
end
