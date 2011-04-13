class Ticket < ActiveRecord::Base
  belongs_to :project
  
  Priorities = ["Low", "Normal", "High", "Urgent"]
  Statuses = ["New", "Open", "Solved", "Rejected", "Finish"]
  
  def Ticket.filter(project, user, ticket_type)
    querystr = ""
    if user
      querystr.concat("assignee = #{user} AND ")
    end
    
    if ticket_type.to_i == 0
      querystr.concat("ticket_type = 0 AND ")
    else
      querystr.concat("ticket_type = 1 AND ")
    end
    
    querystr.concat("project_id = #{project}")
    @tickets = Ticket.where(querystr)
  end
  
end
