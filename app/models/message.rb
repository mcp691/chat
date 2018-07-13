class Message < ApplicationRecord

  belongs_to :room
  belongs_to :user

  after_create_commit { MessageUpdateJob.perform_later(self, self.user) }

end
