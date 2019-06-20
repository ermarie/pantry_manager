class PantryController < ApplicationController
  
  get '/pantry' do
    if logged_in?
      @user = current_user
      @pantry = current_pantry
      if @pantry != nil
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
      @user = current_user
      @pantry = current_pantry
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
    elsif logged_in?
      user = current_user
      pantry = Pantry.create(name: params["name"], user_id: current_user.id)
      redirect '/pantry'
    else
      redirect '/pantry/new'
    end
  end
  
end