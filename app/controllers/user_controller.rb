class UserController < ApplicationController
  
  get '/signup' do
    if logged_in?
      #redirect '/pantry'
    else
      erb :'users/signup'
    end
  end

  
end