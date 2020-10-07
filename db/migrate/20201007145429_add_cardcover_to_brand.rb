class AddCardcoverToBrand < ActiveRecord::Migration[5.2]
  def change
    add_column :brands, :cardcover, :string
  end
end
