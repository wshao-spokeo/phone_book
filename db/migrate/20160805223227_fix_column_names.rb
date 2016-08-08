class FixColumnNames < ActiveRecord::Migration
  def change

  	rename_column :phone_numbers, :owner_id, :contact_id
  	rename_column :email_addresses, :owner_id, :contact_id
  	rename_column :street_addresses, :owner_id, :contact_id

  	add_foreign_key :phone_numbers, :contacts
  	add_foreign_key :email_addresses, :contacts
  	add_foreign_key :street_addresses, :contacts

  end
end
