class Event < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant, optional: true
  belongs_to :group, optional: true

  def progress
    return 10 unless name
    return 30 unless date
    return 80 unless restaurant

    100
  end

  def restaurants
    Restaurant.all # Return the ones that fit the event type and the people
  end
end
