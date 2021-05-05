class UsersController < ApplicationController
    
    get '/register' do
        if logged_in?
        redirect '/'
        else
        erb :'users/new'
        end
      end

      # get '/users' do
      #   @user = current_user
      #   erb :'/users/show'

      # end

    
      post '/users' do
        @user = User.new
        @user.email = params[:email]
        @user.password = params[:password]
    
        if @user.save
          redirect "/login"
        else
          erb :'users/new'
        end
      end

      get '/login' do
        erb :'users/login'
        
      end

      post '/login' do
        
        @user = User.find_by(:email => params[:email])
        if @user && @user.authenticate(params[:password])
          session["user_id"] = @user.id
          redirect "/"
          
        else
          erb :'users/login'
        end
      end

     



      get '/logout' do
        session.clear
        redirect'/'
      end


      delete '/users/:id' do
        @user = User.find_by_id(params[:id])
        if logged_in? && @user == current_user

          @user.combos.each do |combos|
            @moves = combos.moves
          @moves.each do |moves|
              moves.destroy
          end
        end
        
            @user.combos.each do |combos|
              combos.destroy
            end
          
          
          @user.delete
          session.clear
          redirect to '/'
        else
          redirect to '/login'
        end
     end


end