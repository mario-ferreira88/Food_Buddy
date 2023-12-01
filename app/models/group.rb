class Group < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :user_groups, dependent: :destroy
  has_many :users, through: :user_groups
  has_many :group_events, dependent: :destroy
  has_many :events, through: :group_events
  has_one_attached :photo
end
