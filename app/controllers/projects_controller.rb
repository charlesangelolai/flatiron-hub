class ProjectsController < ApplicationController
  get '/projects' do
    @projects = current_user.projects
    erb :'/projects/list'
  end
  get '/projects/new' do
    erb :'/projects/new'
  end

  post '/projects' do
    project = Project.new(params[:project])
    if project.save
      redirect '/projects'
    else
      redirect '/projects/new'
    end
  end

  get '/projects/:id' do
    find_project
    redirect_if_project_not_found
    erb :'/projects/show'
  end

  private
  def find_project
    @project = Project.find_by_id(params[:id])
  end

  def redirect_if_project_not_found
    redirect "/projects" unless @project
  end
end