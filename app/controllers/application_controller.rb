require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find_by_id(session[:user_id])
    end

    def find_user
      @user = User.find_by_username(params[:username])
    end
    
    def redirect_if_logged_in
      redirect "/" if logged_in?
    end
    
    def redirect_if_not_logged_in
      redirect "/login" unless logged_in?
    end
  end
end
