class CreateBrandImages < ActiveRecord::Migration[5.2]
  def change
    create_table :brand_images do |t|
      t.string :link
      t.references :brand, foreign_key: true

      t.timestamps
    end
  end
end
