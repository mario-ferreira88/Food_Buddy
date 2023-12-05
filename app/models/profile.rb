class Profile < ApplicationRecord
  belongs_to :user
  has_many :profile_categories, dependent: :destroy
  has_many :categories, through: :profile_categories
  has_one_attached :photo

  # validates :first_name, :last_name, :phone_number, :address, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
