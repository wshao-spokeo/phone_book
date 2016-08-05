class CreatePhoneNumberKinds < ActiveRecord::Migration
  def change
    create_table :phone_number_kinds do |t|
      t.string :kind

      t.timestamps null: false
    end
  end
end
