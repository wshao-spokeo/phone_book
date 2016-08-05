class AddPriorityToPhoneNumber < ActiveRecord::Migration
  def change
    add_column :phone_numbers, :priority, :integer
  end
end
