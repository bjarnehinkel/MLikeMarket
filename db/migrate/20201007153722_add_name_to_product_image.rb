class AddNameToProductImage < ActiveRecord::Migration[5.2]
  def change
    add_column :product_images, :name, :string
  end
end
