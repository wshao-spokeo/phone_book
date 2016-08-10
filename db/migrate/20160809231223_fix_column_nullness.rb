class FixColumnNullness < ActiveRecord::Migration

  def change

  	change_column :contacts, :first_name, :string, :null => false
  	change_column :contacts, :last_name, :string, :null => false

  	change_column :phone_number_kinds, :kind, :string, :null => false

  	change_column :phone_numbers, :contact_id, :integer, :null => false
  	change_column :phone_numbers, :content, :string, :null => false
  	change_column :phone_numbers, :kind_id, :integer, :null => false
  	change_column :phone_numbers, :priority, :integer, :null => false

  	change_column :email_addresses, :contact_id, :integer, :null => false
  	change_column :email_addresses, :content, :string, :null => false
  	change_column :email_addresses, :priority, :integer, :null => false

  	change_column :street_addresses, :contact_id, :integer, :null => false
  	change_column :street_addresses, :content, :string, :null => false
  	change_column :street_addresses, :priority, :integer, :null => false

  end

end
