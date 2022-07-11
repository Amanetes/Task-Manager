# frozen_string_literal: true

class TaskStatus < ApplicationRecord
  has_many :tasks, dependent: :restrict_with_error
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
