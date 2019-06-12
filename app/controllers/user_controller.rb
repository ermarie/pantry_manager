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
  
  get '/users/:slug' do
    @user = User.find_by(slug: params[:slug])
    #erb :'users/show'
  end
  
end