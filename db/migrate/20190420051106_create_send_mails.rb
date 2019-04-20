class CreateSendMails < ActiveRecord::Migration[5.2]
  def change
    create_table :send_mail do |t|
      t.string :to_add
      t.string :cc_add
      t.string :secret_add
      t.string :title
      t.string :article
      t.string :status
      t.timestamps
    end
  end
end
