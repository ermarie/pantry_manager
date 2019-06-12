class ItemController < ApplicationController
  
  get '/items/new' do
    if logged_in?
      erb :'items/new'
    else
      redirect '/login'
    end
  end 
  
end