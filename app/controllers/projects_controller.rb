class ProjectsController < ApplicationController
  def index
    @projects = Project.active
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    # fail
    @project = Project.find(params[:id])
    @project.update(allowed_params)
    redirect_to project_path(@project)
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.create(allowed_params)
    redirect_to project_path(@project)
  end

  def destroy
    project = Project.find(params[:id])
    project.destroy
    redirect_to projects_path
  end

  private

  def allowed_params
    params.require(:project).permit(
      :name, :description, :target_pledge_amount, :website, :pledging_ends_on)
  end

end
