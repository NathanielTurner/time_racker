class ProgrammersController < ApplicationController
  def new
    @programmer = Programmer.new
  end

  def index
    @programmers = Programmer.all
  end

  def create
    @programmer = Programmer.new(programmer_params)
    respond_to do |format|
      if @programmer.save
        format.html { redirect_to  programmers_path, flash: {success: 'Programmer was successfuly created.'} }
      else
        format.html { render action: 'new' }
      end
    end
  end

  private
    def set_programmer
      @programmer = Programmer.find(params[:id])
    end

    def programmer_params
      params.require(:programmer).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
