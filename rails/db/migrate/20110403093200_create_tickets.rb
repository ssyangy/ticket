class CreateTickets < ActiveRecord::Migration
  def self.up
    create_table :tickets do |t|
      t.text :content
      t.integer :owner
      t.string :priority
      t.string :status
      t.integer :assignee

      t.timestamps
    end
  end

  def self.down
    drop_table :tickets
  end
end
