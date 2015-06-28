class SessionsController < ApplicationController

  def new
  end

  def create
    if request.post?
      user = Programmer.find_by(email: params[:session][:email])
      if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        redirect_to projects_path, notice: 'Logged in Successfully'
      else
        format.html  { render action: 'new', notice:
            'The email or password entered does not match our records.' }
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to signin_path, notice: 'Logged out Successfully'
  end

end
