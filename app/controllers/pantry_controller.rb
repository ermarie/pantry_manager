class PantryController < ApplicationController
  
  get '/pantry' do
    if logged_in?
      @user = User.find_by(id: current_user.id)
      @pantry = Pantry.find_by(user_id: @user.id)
      binding.pry
      if @pantry != nil
        binding.pry
        erb :'pantry/show'
      else
        redirect '/pantry/new'
      end
    else
      redirect '/login'
    end
  end
  
  get '/pantry/new' do
    if logged_in? 
      @user = User.find_by(id: current_user.id)
      @pantry = Pantry.find_by(user_id: @user.id)
      if @pantry == nil
        erb :'pantry/new'
      else
        redirect '/pantry'
      end
    else
      redirect '/login'
    end
  end
  
  post '/pantry' do
    if params["name"] == ""
      redirect '/pantry/new'
    else
      user = User.find_by(id: current_user.id)
      pantry = Pantry.create(name: params["name"], user_id: user.id)
      redirect '/pantry'
    end
  end
  
end