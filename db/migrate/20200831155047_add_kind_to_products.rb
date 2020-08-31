class AddKindToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :kind, :boolean, default: false
  end
end
