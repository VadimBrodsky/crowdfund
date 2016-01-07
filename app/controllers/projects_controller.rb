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
    if @project.update(allowed_params)
      redirect_to project_path(@project), notice: 'Project Successfully Updated!'
    else
      render :edit
    end
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(allowed_params)
    if @project.save
      redirect_to project_path(@project), notice: 'Project Successfully Created!'
    else
      render :edit
    end
  end

  def destroy
    project = Project.find(params[:id])
    project.destroy
    redirect_to projects_path, alert: 'Project Successfully Deleted!'
  end

  private

  def allowed_params
    params.require(:project).permit(
      :name,
      :description,
      :target_pledge_amount,
      :website,
      :pledging_ends_on,
      :team_members,
      :image_file_name
    )
  end
end
