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
        format.html { redirect_to  signin_path, flash[:notice] =
            'The account was successfully created.' }
      else
        format.html { render action: 'new' flash.now[:notice] =
            'Something prevented this account from being created.' }
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
