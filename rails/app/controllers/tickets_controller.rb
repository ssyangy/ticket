class TicketsController < ApplicationController
  # GET /tickets
  # GET /tickets.xml
  def index
    @tickets = Ticket.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tickets }
    end
  end

  def backlog
    @tickets = Ticket.where("assignee = ? and project_id = ?", current_user.id, session[:project])
  end


  # GET /tickets/1
  # GET /tickets/1.xml
  def show
    @ticket = Ticket.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ticket }
    end
  end

  # GET /tickets/new
  # GET /tickets/new.xml
  def new
    @ticket = Ticket.new
    @ticket.priority = Ticket::Priorities[1]
    @ticket.status = Ticket::Statuses[0]

    @project = Project.find(session[:project])
    @members = @project.members
    @milestones = @project.milestones

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ticket }
    end
  end

  # GET /tickets/1/edit
  def edit
    @ticket = Ticket.find(params[:id])
    @project = Project.find(session[:project])
    @members = @project.members
    @milestones = @project.milestones
  end

  # POST /tickets
  # POST /tickets.xml
  def create
    @project = Project.find(session[:project])
    @ticket = Ticket.new(:content => params[:ticket][:content], :owner => current_user.id, :priority => params[:ticket][:priority], 
                        :status => params[:ticket][:status], :assignee => params[:ticket][:assignee], :project_id => session[:project],
                        :milestone_id => params[:ticket][:milestone_id], :est_start => params[:ticket][:est_start], :est_end => params[:ticket][:est_end])

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to(@project, :notice => 'Ticket was successfully created.') }
        format.xml  { render :xml => @ticket, :status => :created, :location => @ticket }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ticket.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tickets/1
  # PUT /tickets/1.xml
  def update
    @ticket = Ticket.find(params[:id])
    @project = Project.find(@ticket.project_id)

    respond_to do |format|
      if @ticket.update_attributes(params[:ticket])
        format.html { redirect_to(@project, :notice => 'Ticket was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ticket.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.xml
  def destroy
    @ticket = Ticket.find(params[:id])
    @project = Project.find(@ticket.project_id)
    @ticket.destroy

    respond_to do |format|
      format.html { redirect_to(@project) }
      format.xml  { head :ok }
    end
  end
end
