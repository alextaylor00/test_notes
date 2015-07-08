class ProjectsController < ApplicationController
  before_action :set_project_ivar, only: [:show, :edit, :update, :destroy]

  helper NotesHelper # to show previews of text

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def edit
    render "index"
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
    render "index"
  end

  def destroy
    render "index"
  end

  private
    def set_project_ivar
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name) # Whitelist the params to prevent the params from passing any dangerous attributes
    end

end
