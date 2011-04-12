class DashboardController < ApplicationController
  def index
    session[:nav] = DASHBOARD
    @todo = Todo.new
    
    @todos = User.find(current_user.id).todos
  end
end
