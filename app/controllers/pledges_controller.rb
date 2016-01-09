class PledgesController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @pledges = @project.pledges
  end

  def new
    @project = Project.find(params[:project_id])
    @pledge = @project.pledges.new
  end
end
