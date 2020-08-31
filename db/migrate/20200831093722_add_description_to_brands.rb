class AddDescriptionToBrands < ActiveRecord::Migration[5.2]
  def change
    add_column :brands, :description, :text
  end
end
