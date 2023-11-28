class Profile < ApplicationRecord
  belongs_to :user

  validates :first_name, :last_name, :phone_number, :address, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
  has_one_attached :photo
end
