class FixColumnDefault < ActiveRecord::Migration

  def change

  	change_column :phone_numbers, :contact_id, :integer, :default => 0

  	change_column :email_addresses, :contact_id, :integer, :default => 0

  	change_column :street_addresses, :contact_id, :integer, :default => 0

  end

end
