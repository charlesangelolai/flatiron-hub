class UsersController < ApplicationController
  get '/signup' do
    erb :'/users/signup'
  end

  post '/signup' do
    user = User.new(params[:user])
    if params[:user].values.any?{|i|i.empty?} || !user.save
      redirect '/signup'
    else
      session[:user_id] = user.id
      erb :index
    end
  end

  get '/login' do
    erb :'/users/login'
  end

  post '/login' do
    user = User.find_by_username(params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      erb :index
    else
      redirect "/login"
    end
  end

  get '/logout' do
    session.clear
    redirect '/login'
  end

  get '/profile' do
    @user = current_user
    erb :'/users/profile'
  end

  get '/profile/edit' do
    @user = current_user
    erb :'/users/edit'
  end

  get '/profile/:username' do
    find_user
    erb :'/users/profile'
  end

  get '/profile/:username/edit' do
    find_user
    redirect_if_user_not_found
    redirect_if_not_user
    erb :'/users/edit'
  end

  patch '/profile/:username' do
    find_user
    redirect_if_user_not_found
    redirect_if_not_user
    if @user.update(params[:user])
      redirect "/profile/#{@user.username}"
    else
      redirect "/profile/#{@user.username}/edit"
    end
  end

  private
  def find_user
    @user = User.find_by_username(params[:username])
  end

  def redirect_if_user_not_found
    redirect "/profile" unless @user
  end

  def redirect_if_not_user
    redirect "/profile" unless @user == current_user
  end
end