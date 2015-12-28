class ProjectsController < ApplicationController
  def index
    @projects = Project.all
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
    allowed_params = params.require(:project).permit(
      :name, :description, :target_pledge_amount, :website, :pleding_ends_on
    )
    @project.update(allowed_params)
    redirect_to project_path(@project)
  end

  def new
    @project = Project.new
  end
end
