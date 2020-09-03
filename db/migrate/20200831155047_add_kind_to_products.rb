class AddKindToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :clothing, :boolean, default: false
  end
end
