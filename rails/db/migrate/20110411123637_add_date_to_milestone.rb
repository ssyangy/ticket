class AddDateToMilestone < ActiveRecord::Migration
  def self.up
    add_column :milestones, :due_date, :date
  end

  def self.down
    remove_column :milestones, :due_date
  end
end
