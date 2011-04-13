class AddTypeToTickets < ActiveRecord::Migration
  def self.up
    add_column :tickets, :type, :integer
  end

  def self.down
    remove_column :tickets, :type
  end
end
