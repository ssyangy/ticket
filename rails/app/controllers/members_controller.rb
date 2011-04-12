class MembersController < ApplicationController

  def new
    @project = Project.find(session[:project])
    @member = Member.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @member }
    end
  end

  def index
    @project = Project.find(session[:project])
    @members = @project.members

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @members }
    end
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
