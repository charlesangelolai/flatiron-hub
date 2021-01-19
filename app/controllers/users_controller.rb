class UsersController < ApplicationController
  get '/signup' do
    redirect_if_logged_in
    @cohorts = Cohort.all
    erb :'/users/signup'
  end

  post '/signup' do
    user = User.new(params[:user])
    user.cohort_name = Cohort.find(user.cohort_id).name
    if !user.save
      user.errors.messages[:password_digest] = nil
      flash[:errors] = user.errors.full_messages
      redirect '/signup'
    else
      session[:user_id] = user.id
      erb :index
    end
  end

  get '/login' do
    redirect_if_logged_in
    erb :'/users/login'
  end

  post '/login' do
    user = User.find_by_username(params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect "/"
    else
      flash[:errors] = ["Invalid Entry! Please try again."]
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
    redirect_if_user_not_found
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
  
  def redirect_if_user_not_found
    unless @user
      flash[:errors] = ["User does not exist."]
      redirect "/profile"
    end
  end

  def redirect_if_not_user
    unless @user == current_user
      flash[:errors] = ["Unauthorized request."]
      redirect "/profile"
    end
  end
end