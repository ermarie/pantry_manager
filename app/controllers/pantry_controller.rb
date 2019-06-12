class PantryController < ApplicationController
  
  get '/pantry' do
    if logged_in?
      if current_user.pantry != nil
        @user = current_user
        @pantry = @user.pantry
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
      if current_user.pantry == nil
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
      binding.pry
    end
  end
  
end