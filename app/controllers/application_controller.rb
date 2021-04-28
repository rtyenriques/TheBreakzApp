require './config/environment'

class ApplicationController < Sinatra::Base
  # use Rack::Flash

  configure do
    enable :sessions
    set :session_secret, "secret"
  
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end


  helpers do
    def logged_in?
      !!current_user
      #if current user returns nil !nil = true !true => false 
      #!!to honest to god true of false 
      #<user> => true => false =>true using return value from current_user
    end

    def current_user
      #if there is a value in session user try to find a user whose session is equal
      #if @user if not populated then will find and if its nil
      @user ||= User.find(session[:user_id]) if session[:user_id]
    end

  end
      
    

    # def authentication_required
    #   if !logged_in?
    #     flash[:notice] = "You must be logged in."
    #     redirect '/'
    #   end
    # end

  
end
