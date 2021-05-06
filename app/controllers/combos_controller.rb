class CombosController < ApplicationController
    before '/combos/*' do
    authentication_required
    end
 

    get '/combos' do
        @combo = current_user.combos
        erb :"combos/index"
     end

    get '/combos/new' do
      erb :"combos/new"
    end

    get '/combos/:id' do
      @combo = current_user.combos.find(params[:id])
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

    delete '/combos/:id' do
      @combo = current_user.combos.find(params[:id])
      @moves = @combo.moves
      @moves.each do |moves|
        moves.destroy
      end
       @combo.destroy
       redirect to "/combos"
      end

    get'/combos/:id/edit' do
      @combo = current_user.combos.find(params[:id])
      erb :"/combos/edit"
    end

    patch '/combos/:id' do
      @combo = current_user.combos.find(params[:id])
      @combo.name = params[:name]
      @combo.save
      redirect to "/combos/#{@combo.id}"
    end

    # post '/combos/:id/moves' do
    #     @combo = current_user.combos.find(params[:id])
    #     @move = Move.new(:move_name => params[:move_name])
        
    #     if @move.save
    #       @combo.moves << @move
    #       redirect "/combos/#{@combo.id}"
    #     else
    #       erb :"/combos/show"
    #     end
    
    #   end

    post '/combos/:id/moves' do
      @combo = current_user.combos.find(params[:id])
      @move = @combo.moves.create(:move_name => params[:move_name])
        if @move.save
          redirect "/combos/#{@combo.id}"
        else
          erb :"/combos/show"
        end
    end
  
  end