class AddbackgroundImageToProfile < ActiveRecord::Migration[7.1]
  def change
    add_column :profiles, :background_image, :string
  end
end
