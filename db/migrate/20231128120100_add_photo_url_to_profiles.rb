class AddPhotoUrlToProfiles < ActiveRecord::Migration[7.1]
  def change
    add_column :profiles, :photo_url, :string
  end
end
