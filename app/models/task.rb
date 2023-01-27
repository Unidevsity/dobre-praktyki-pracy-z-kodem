class Task < ApplicationRecord
  after_create_commit { broadcast_append_to :tasks }

end
