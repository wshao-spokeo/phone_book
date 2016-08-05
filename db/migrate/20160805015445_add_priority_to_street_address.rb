class AddPriorityToStreetAddress < ActiveRecord::Migration
  def change
    add_column :street_addresses, :priority, :integer
  end
end
