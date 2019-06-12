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
  
end