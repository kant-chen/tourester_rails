class CreateOrderLists < ActiveRecord::Migration[5.2]
  def change
    create_table :order_list do |t|
      t.integer :order_seq
      t.string :product_id
      t.float :unit_price
      t.float :qty
      t.float :amount
      t.float :tax
      t.string :status
      t.timestamps
    end
  end
end
