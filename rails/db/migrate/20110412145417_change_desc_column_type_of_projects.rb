class ChangeDescColumnTypeOfProjects < ActiveRecord::Migration
  def self.up
    change_column :projects, :desc, :text
  end

  def self.down
    change_column :projects, :desc, :string
  end
end
