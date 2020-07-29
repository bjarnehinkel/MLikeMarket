class AddComplimentToBrands < ActiveRecord::Migration[5.2]
  def change
    add_column :brands, :compliment, :string
  end
end
