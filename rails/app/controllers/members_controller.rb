class MembersController < ApplicationController

  def new
  end

  def index
  end
  
  def create
    @project = Project.find(params[:member][:project_id])
    @user = User.find_by_login(params[:member][:user])
    if @user
      @member = Member.new(:project_id => @project.id, :user_id => @user.id)
      @member.save
      redirect_to admin_project_url(@project)
    else
      render :text => 'user does not exist'
    end
  end

  def destroy
  end
  
end
