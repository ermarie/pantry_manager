class UserController < ApplicationController
  
  get '/signup' do
    if logged_in?
      #redirect '/pantry'
    else
      erb :'users/signup'
    end
  end
  
  post "/signup" do
    if params["username"] == "" || params["password"] == "" || params["email"] == ""
      redirect '/signup'
    else
      user = User.create(username: params["username"], email: parmas["email"], password: params["password"])
      session[:user_id] = user.id
      #redirect '/pantry'
    end
  end
  
  get '/login' do
    if logged_in?
      #redirect '/pantry'
    else
      erb :'users/login'
    end
  end

  post "/login" do
    user = User.find_by(:username => params["username"])
    if user && user.authenticate(params["password"])
      session[:user_id] = user.id
      #redirect to '/pantry'
    else
      redirect '/login'
    end
  end
  
end