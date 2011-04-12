class MilestonesController < ApplicationController
  # GET /milestones
  # GET /milestones.xml
  def index
    @project = Project.find(session[:project])
    @milestones = @project.milestones

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @milestones }
    end
  end

  # GET /milestones/1
  # GET /milestones/1.xml
  def show
    @milestone = Milestone.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @milestone }
    end
  end

  # GET /milestones/new
  # GET /milestones/new.xml
  def new
    @project = Project.find(session[:project])
    @milestone = Milestone.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @milestone }
    end
  end

  # GET /milestones/1/edit
  def edit
    @milestone = Milestone.find(params[:id])
    @project = Project.find(@milestone.project_id)
  end

  # POST /milestones
  # POST /milestones.xml
  def create
    @project = Project.find(session[:project])
    @milestone = Milestone.new(:name => params[:milestone][:name], :desc => params[:milestone][:desc], :project_id => session[:project],
                              :due_date => params[:milestone][:due_date])

    respond_to do |format|
      if @milestone.save
        format.html { redirect_to(project_milestones_url(@milestone), :notice => 'Milestone was successfully created.') }
        format.xml  { render :xml => @milestone, :status => :created, :location => @milestone }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @milestone.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /milestones/1
  # PUT /milestones/1.xml
  def update
    @milestone = Milestone.find(params[:id])

    respond_to do |format|
      if @milestone.update_attributes(params[:milestone])
        format.html { redirect_to(project_milestones_url(@milestone), :notice => 'Milestone was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @milestone.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /milestones/1
  # DELETE /milestones/1.xml
  def destroy
    # check if milestone was referenced or not
    
    @milestone = Milestone.find(params[:id])
    @project = Project.find(@milestone.project_id)
    @milestone.destroy

    respond_to do |format|
      format.html { redirect_to(project_milestones_url(@project)) }
      format.xml  { head :ok }
    end
  end
end
