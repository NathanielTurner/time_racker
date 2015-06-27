class ProjectsController < ApplicationController

  def new
    @project = Project.new
  end

  def index
    @projects = Project.all
  end

  def create
    @project = Project.new(project_params)
    respond_to do |format|
      if @project.save
        format.html { redirect_to projects_path,
            notice: {success: 'Project successfuly created'} }
      else
        format.html { render action: 'new',
            notice: {error: 'Something prevented project from being saved'}}
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
