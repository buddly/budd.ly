class MilestonesController < ApplicationController
  
  before_filter :get_goal
  
  # GET /milestones
  # GET /milestones.xml
  def index
    @milestones = @goal.milestones.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @milestones }
    end
  end

  # GET /milestones/1
  # GET /milestones/1.xml
  def show
    @milestone = @goal.milestones.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @milestone }
    end
  end

  # GET /milestones/new
  # GET /milestones/new.xml
  def new
    @milestone = @goal.milestones.new

    respond_to do |format|
      format.html { render :layout => !request.xhr? } # new.html.erb
      format.xml  { render :xml => @milestone }
    end
  end

  # GET /milestones/1/edit
  def edit
    @milestone = @goal.milestones.find(params[:id])
  end

  # POST /milestones
  # POST /milestones.xml
  def create
    @milestone = @goal.milestones.new(params[:milestone])

    respond_to do |format|
      if @milestone.save
        format.html { redirect_to([@goal, @milestone], :notice => 'Milestone was successfully created.') }
        format.js
      else
        format.html { render :action => "new" }
        format.js
      end
    end
  end

  # PUT /milestones/1
  # PUT /milestones/1.xml
  def update
    @milestone = @goal.milestones.find(params[:id])

    respond_to do |format|
      if @milestone.update_attributes(params[:milestone])
        format.html { redirect_to([@goal, @milestone], :notice => 'Milestone was successfully updated.') }
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
    @milestone = @goal.milestones.find(params[:id])
    @milestone.destroy

    respond_to do |format|
      format.html { redirect_to(goal_milestones_url(@goal)) }
      format.xml  { head :ok }
    end
  end
end
