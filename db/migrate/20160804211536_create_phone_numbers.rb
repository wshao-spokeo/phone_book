class CreatePhoneNumbers < ActiveRecord::Migration
  def change
    create_table :phone_numbers do |t|
      t.integer :owner_id
      t.string :content
      t.integer :kind_id

      t.timestamps null: false
    end
  end
end
