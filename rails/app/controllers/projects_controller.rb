class ProjectsController < ApplicationController
  require 'pp'
  
  before_filter :require_user

private
  # GET /projects
  # GET /projects.xml
  def index
    @projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @projects }
    end
  end
  
public
  # GET /projects/1
  # GET /projects/1.xml
  def show
    @project = Project.find(params[:id])
    session[:project] = @project.id
    session[:nav] = @project.id

    pp "session[:user_type] = #{session[:user_type]}, session[:ticket_type] = #{session[:ticket_type]}"
    session[:user_type] = session[:user_type].nil?? 1 : session[:user_type]
    session[:ticket_type] = session[:ticket_type].nil?? 0 : session[:ticket_type]
    pp "session[:user_type] = #{session[:user_type]}, session[:ticket_type] = #{session[:ticket_type]}"
    
    @tickets = Ticket.filter(@project.id, current_user.id, session[:ticket_type])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.xml
  def new
    @project = Project.new
    session[:nav] = NAV_NEW_PROJECT

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.xml
  def create
    @project = Project.new(:name => params[:project][:name], :desc => params[:project][:desc], :owner => current_user.id)
    
    respond_to do |format|
      if @project.save
        format.html { redirect_to(@project, :notice => 'Project was successfully created.') }
        format.xml  { render :xml => @project, :status => :created, :location => @project }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.xml
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to(@project, :notice => 'Project was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.xml
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to(projects_url) }
      format.xml  { head :ok }
    end
  end
  
  
  def admin
    @project = Project.find(params[:id])
    @members = @project.members
    @new_member = Member.new
  end

end
