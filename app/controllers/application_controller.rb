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
      !!current_user
    end

    def current_user
      User.find_by_id(session[:user_id])
    end
    
    def redirect_if_logged_in
      redirect "/" if is_logged_in?
    end
    
    def redirect_if_not_logged_in
      redirect "/login" unless is_logged_in?
    end
  end
end
