class Profile < ApplicationRecord
  belongs_to :user
<<<<<<< HEAD

  validates :first_name, :last_name, :phone_number, :address, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
=======
  has_one_attached :photo
>>>>>>> master
end
