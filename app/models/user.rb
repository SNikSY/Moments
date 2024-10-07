class User < ApplicationRecord
     has_secure_password
   
     # Подписки, где текущий пользователь подписан на других
  has_many :active_follows, class_name: 'Follow', foreign_key: 'follower_id'
  has_many :following, through: :active_follows, source: :following

  # Подписки, где другие пользователи подписаны на текущего
  has_many :passive_follows, class_name: 'Follow', foreign_key: 'following_id'
  has_many :followers, through: :passive_follows, source: :follower

     has_many :moments
     has_many :comments
     has_many :likes
     has_many :notifications
   
     validates :username, presence: true, uniqueness: true
     validates :email, presence: true, uniqueness: true
   end
   