class CreateOrderds < ActiveRecord::Migration[5.2]
  def change
    create_table :orderd do |t|
      t.string :customer_id
      t.string :status
      t.timestamps
    end
  end
end
