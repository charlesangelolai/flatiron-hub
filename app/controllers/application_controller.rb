require './config/environment'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
    register Sinatra::Flash
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
      if logged_in?
        flash[:errors] = ["You are already logged in."]
        redirect "/"
      end
    end
    
    def redirect_if_not_logged_in
      unless logged_in?
        flash[:errors] = ["You must log in to access this page."]
        redirect "/login"
      end
    end
  end
end
