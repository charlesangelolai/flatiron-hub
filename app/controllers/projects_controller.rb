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
    if params[:project].values.any?{|i|i.empty?} || !project.save
      redirect '/projects/new'
    else
      redirect '/projects'
    end
  end

  get '/projects/:id' do
    find_project
    redirect_if_project_not_found
    erb :'/projects/show'
  end

  get '/projects/:id/edit' do
    redirect_if_not_logged_in
    find_project
    redirect_if_project_not_found
    redirect_if_not_owner
    erb :'/projects/edit'
  end

  patch "/projects/:id" do
    find_project
    redirect_if_project_not_found
    redirect_if_not_owner
    if @project.update(params[:project])
      redirect "/projects/#{@project.id}"
    else
      redirect "/proejects/#{@project.id}/edit"
    end
  end

  delete "/projects/:id" do
    find_user
    find_project
    redirect_if_project_not_found
    redirect_if_not_owner
    @project.destroy
    redirect "/projects"
  end

  private
  def find_project
    @project = Project.find_by_id(params[:id])
  end

  def redirect_if_project_not_found
    redirect "/projects" unless @project
  end

  def redirect_if_not_owner
    redirect "/projects" unless @project.user == current_user
  end
end