class PantryController < ApplicationController
  
  get '/pantry' do
    erb :'pantry/show'
  end
  
end