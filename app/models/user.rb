class User < ApplicationRecord
  has_one :profile, dependent: :destroy
  has_many :user_groups
  has_many :groups, through: :user_groups
  has_many :events
  has_many :profile_categories
  has_many :categories, through: :profile_categories

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
