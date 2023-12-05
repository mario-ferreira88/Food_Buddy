class Restaurant < ApplicationRecord
  has_one_attached :photo
  has_many :restaurant_categories, dependent: :destroy
  has_many :categories, through: :restaurant_categories
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
