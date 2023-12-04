class Event < ApplicationRecord
  has_many :users
  belongs_to :restaurant
  belongs_to :user
  has_many :group_events, dependent: :destroy
  has_many :groups, through: :group_events
end
