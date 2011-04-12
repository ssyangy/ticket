class Ticket < ActiveRecord::Base
  belongs_to :project
  
  Priorities = ["Low", "Normal", "High", "Urgent"]
  Statuses = ["New", "Open", "Solved", "Rejected", "Finish"]
  
end
