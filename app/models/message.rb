class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  after_create_commit {broadcast_prepend_to "messages"}
end
