class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :moment, optional: true

  validates :notification_type, presence: true
end
