class ItemController < ApplicationController
  
  get '/items/new' do
    if logged_in?
      @caetgories = Category.all
      erb :'items/new'
    else
      redirect '/login'
    end
  end 
  
  post '/items' do
    if logged_in?
      if params["name"] == ""
        redirect '/items/new'
      else
        item = Item.create(name: params["name"], brand: params["brand"], variety: params["variety"], flavor: params["flavor"])
        # @user = User.find_by(id: tweet.user_id)
        # @tweets = @user.tweets
        redirect '/pantry'
      end
    else
      redirect '/login'
    end
  end
end