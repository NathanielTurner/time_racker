class ProjectsController < ApplicationController

  def new
    @project = Project.new
  end

  def index
    @projects = Project.all
  end

  def create
    if request.post?
      @project = Project.new(project_params)
      if @project.save
        flash[:notice] = 'Project was successfully created'
        redirect_to projects_path
      else
        flash.now[:notice] = 'Something prevented project from being saved'
        render action: 'new'
      end
    end
  end

  private
    def set_project
      @projects = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :time_limit)
    end

end
