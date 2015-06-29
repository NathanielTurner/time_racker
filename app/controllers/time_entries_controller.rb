class TimeEntriesController < ApplicationController

  def new
    @project_id = params[:project_id]
    @time_entry = TimeEntry.new()
  end

  def index
    @time_entries = TimeEntry.all
    @projects = Project.all
    @programmers = Programmer.all
  end

  def create
    if request.post?
      @time_entry = TimeEntry.new(time_entry_params)
      @time_entry.programmer_id = session[:user_id]
      if @time_entry.save
        flash[:notice] = 'Time entry was successfully recorded.'
        redirect_to  projects_path
      else
        flash.now[:notice] = 'Something prevented this time entry from being saved.'
        render action: 'new'
      end
    end
  end

  private

    def set_time_entry
      @time_entry = TimeEntry.find(params[:id])
    end

    def time_entry_params
      params.require(:time_entry).permit(:duration, :date, :project_id, :programmer_id)
    end
end
