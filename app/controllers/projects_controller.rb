class ProjectsController < ApplicationController
  def index
    @projects = ['Music Album', 'Hacker Keyboard', 'Text Editor', 'JavaScript MVC']
  end
end
