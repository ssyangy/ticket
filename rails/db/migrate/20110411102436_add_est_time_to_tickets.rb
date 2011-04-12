class AddEstTimeToTickets < ActiveRecord::Migration
  def self.up
    add_column :tickets, :est_start, :date
    add_column :tickets, :est_end, :date
  end

  def self.down
    remove_column :tickets, :est_start
    remove_column :tickets, :est_end
  end
end
