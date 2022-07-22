class Message < ApplicationRecord
  belongs_to :user
  belongs_to :dialog

  after_create_commit { broadcast_prepend_to "dialog_#{self.dialog.id}" }
  after_destroy_commit { broadcast_remove_to "dialog_#{self.dialog.id}" }
end
