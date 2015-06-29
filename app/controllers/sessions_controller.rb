class SessionsController < ApplicationController

  def new
  end

  def create
    if request.post?
      user = Programmer.find_by(email: params[:session][:email])
      if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        flash[:notice] = 'Logged in Successfully'
        redirect_to projects_path
      else
        flash.now[:notice] = 'The email or password entered does not match our records.'
        render action: 'new'
      end
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Logged out Successfully'
    redirect_to signin_path
  end

end
