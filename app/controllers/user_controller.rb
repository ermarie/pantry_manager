class UserController < ApplicationController
  
  get '/signup' do
    if logged_in?
      redirect '/pantry'
    else
      erb :'users/signup'
    end
  end
  
  post "/signup" do
    if params["username"] == "" || params["password"] == "" || params["email"] == ""
      redirect '/signup'
    else
      user = User.create(username: params["username"], email: params["email"], password: params["password"])
      redirect '/login'
    end
  end
  
end