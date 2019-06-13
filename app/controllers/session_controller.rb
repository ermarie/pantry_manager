class SessionController < ApplicationController
  
  get '/login' do
    if logged_in?
      redirect '/pantry'
    else
      erb :'users/login'
    end
  end

  post "/login" do
    user = User.find_by(:username => params["username"])
    if user && user.authenticate(params["password"])
      session[:user_id] = user.id
      redirect '/pantry'
    else
      redirect '/login'
    end
  end
  
  get "/logout" do
    if logged_in?
      session.clear
      redirect '/login'
    else
      redirect '/login'
    end
  end
  
end