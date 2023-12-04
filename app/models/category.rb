class Category < ApplicationRecord
  has_many :profile_categories
  has_many :restaurant_categories
end
