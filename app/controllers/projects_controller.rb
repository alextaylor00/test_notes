class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      flash[:success] = "Project created."
      redirect_to project_path(@project)

    else
      render "new"
    end
  end

  def update
  end

  def destroy
  end

  private
    def set_project_ivar
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name) # Whitelist the params to prevent the params from passing any dangerous attributes
    end

end
