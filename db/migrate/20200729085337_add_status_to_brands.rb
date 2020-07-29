class AddStatusToBrands < ActiveRecord::Migration[5.2]
  def change
    add_column :brands, :status, :string, default: 'normal'
  end
end
