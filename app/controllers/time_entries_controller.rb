class TimeEntriesController < ApplicationController

  def new
    @time_entry = TimeEntry.new
  end

  def index
    @time_entries = TimeEntry.all
  end

  def create
    @time_entry = TimeEntry.new(time_entry_params)
    @time_entry.developer_id = session[:user_id]
    respond_to do |format|
      if @time_entry.save
        format.html { redirect_to  projects_path, notice:
            'Time entry was successfuly recorded.' }
      else
        format.html { render action: 'new', notice:
            'Something prevented this time entry from being saved.' }
      end
    end
  end

  private

    def set_time_entry
      @time_entry = TimeEntry.find(params[:id])
    end

    def time_entry_params
      params.require(:time_entry).permit(:duration, :date, :project_id)
    end
end
