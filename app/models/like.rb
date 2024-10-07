class Like < ApplicationRecord
  belongs_to :user
  belongs_to :moment

  validates :user_id, uniqueness: { scope: :moment_id }
end
