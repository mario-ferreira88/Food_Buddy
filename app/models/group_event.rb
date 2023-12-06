class GroupEvent < Event
  belongs_to :group, optional: true # Use the singular association here
  # belongs_to :event

  def self.progress_back
    {
      30 => 10,
      50 => 30,
      80 => 50,
      100 => 80
    }
  end

  def progress
    return 10 unless name
    return 30 unless date
    return 50 unless group # Use the singular association here
    return 80 unless restaurant

    100
  end
end
