class TimeEntriesController < ApplicationController

  def new
    @time_entry = TimeEntry.new

  end

  def index
    @time_entries = TimeEntry.all

  end

  def create
    @time_entry = TimeEntry.new(time_entry_params)

    respond_to do |format|
      if @time_entry.save
        format.html { redirect_to  time_entries_path, flash: {success: 'Time entry was successfuly recorded.'} }
      else
        format.html { render action: 'new', flash: {error: 'There was an error recording this time entry. Check your input and try again. If error persists, Contact example@example.com'} }
      end  
    end

  end

end
