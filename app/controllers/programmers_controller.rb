class ProgrammersController < ApplicationController
  def new
    @programmer = Programmer.new
  end

  def index
    @programmers = Programmer.all
  end

  def create
    if request.post?
      @programmer = Programmer.new(programmer_params)
      if @programmer.save
        flash[:notice] = 'The account was successfully created.'
        redirect_to  projects_path
      else
        flash.now[:notice] = 'Something prevented this account from being created.'
        render action: 'new'
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
