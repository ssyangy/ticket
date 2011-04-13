class RenameTypeColumnofTicket < ActiveRecord::Migration
  def self.up
    rename_column :tickets, :type, :ticket_type
  end

  def self.down
    rename_column :tickets, :ticket_type, :type
  end
end
