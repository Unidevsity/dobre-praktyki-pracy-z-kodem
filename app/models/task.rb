class Task < ApplicationRecord
  after_create_commit { broadcast_append_to :tasks }
  belongs_to :user

  validates :title, presence: true
end
