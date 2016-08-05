class AddPriorityToEmailAddress < ActiveRecord::Migration
  def change
    add_column :email_addresses, :priority, :integer
  end
end
