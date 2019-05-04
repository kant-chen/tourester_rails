class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :product_name1
      t.string :product_name2
      t.float :unit_price
      t.float :stock_qty
      t.string :status
      t.timestamps
    end
  end
end
