class Comment < ApplicationRecord
  belongs_to :moment, foreign_key: 'moment_id'
  belongs_to :user

  validates :content, presence: true
end
