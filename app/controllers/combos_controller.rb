class CombosController < ApplicationController
    before '/combos/*' do
    authentication_required
    end

    get '/combos' do
        if logged_in?
        @combo = current_user.combos
        erb :"combos/index"
        else
        authentication_required
        end
     end

  
    

    get '/combos/new' do
      erb :"combos/new"
      
    end

    get '/combos/:id' do
        @combo = current_user.combos.find_by(params[:id])
        erb :"/combos/show"

    end

    post '/combos' do
        
       
       
        @combo = Combo.new
        @combo.name = params[:name]
        @combo.user_id = current_user.id
        
        #creating a belongs to equal to current user

        if @combo.save
            redirect '/combos'
        else
            erb :"combos/new"
        end
    

    end

   

    

end