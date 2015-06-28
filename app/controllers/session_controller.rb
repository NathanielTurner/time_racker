class SessionsController < ApplicationController

  def new
  end

  def create
    if request.post?
      user = Programmer.find_by_email(params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to projects_path, notice: 'Loged in Successfully'
      else
        format.html  { render action: 'new', flash.now[:notice] =
          'The email or password entered does not match our records.' }
      end
    end
  end

  def destroy
  end

end
