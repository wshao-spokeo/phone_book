class CreateEmailAddresses < ActiveRecord::Migration
  def change
    create_table :email_addresses do |t|
      t.integer :owner_id
      t.string :content

      t.timestamps null: false
    end
  end
end
