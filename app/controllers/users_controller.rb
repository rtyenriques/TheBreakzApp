class UsersController < ApplicationController
    
  get '/register' do
        if logged_in?
        redirect '/'
        else
        erb :'users/new'
        end
      end

      # get '/users/:id' do
      #   @user = current_user
      #   erb :'/users/show'

      # end


  get '/users/:id' do
    @user = User.find_by_id(params[:id])
    if logged_in? && @user == current_user
      erb :'/users/show'
    else
      redirect to '/login'
    end
  end

    get '/users/:id/edit' do
      @user = User.find_by_id(params[:id])
      if logged_in? && @user == current_user
        erb :'/users/edit'
      else
        redirect to '/login'
        end
      end
    
    patch '/users/:id' do
      @user = User.find_by_id(params[:id])
      @user.email = params[:email]
      @user.password = params[:password]
      if logged_in? && @user == current_user && @user.valid?
        @user.save
        redirect to "/users/#{@user.id}"
      else
        redirect to '/login'
      end
    end

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
      if logged_in? && @user == current_user
        redirect "/"
      else   
        erb :'users/login'
      end
    end

    post '/login' do
      @user = User.find_by(:email => params[:email])
      if @user && @user.authenticate(params[:password])
        session["user_id"] = @user.id
        redirect "/users/#{@user.id}"
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