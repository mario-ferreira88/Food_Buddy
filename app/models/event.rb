class Event < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant, optional: true

  def progress
    return 10 unless name
    return 30 unless date
    return 80 unless restaurant

    100
  end
end
