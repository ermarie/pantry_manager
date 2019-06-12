class PantryController < ApplicationController
  
  get '/pantry' do
    @user = current_user
    @pantry = @user.pantry
    erb :'pantry/show'
  end
  
end