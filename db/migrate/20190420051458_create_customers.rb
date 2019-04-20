class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customer do |t|
      t.string :customer_name
      t.string :email
      t.string :status
      t.timestamps
    end
  end
end
