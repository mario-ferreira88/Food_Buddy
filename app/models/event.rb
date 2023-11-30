class Event < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  has_many :group_events, dependent: :destroy
  has_many :groups, through: :group_events
end
