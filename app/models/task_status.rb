# frozen_string_literal: true

class TaskStatus < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
