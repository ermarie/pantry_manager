class ItemController < ApplicationController
  
  get '/items/new' do
    if logged_in?
      @categories = Category.all
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
        if params["category_name"] != nil && params["category_id"] != nil 
          redirect '/items/new'
        elsif params["category_name"] != nil 
          category = Category.create(name: params["category_name"])
          category.items.create(name: params["name"], brand: params["brand"], variety: params["variety"], flavor: params["flavor"], quantity: params["quantity"], quantity_type: params["quantity_type"])
          redirect '/pantry'
        elsif params["category_id"] != nil
          category = Category.find_by(category_id: params["category_id"])
          category.items.create(name: params["name"], brand: params["brand"], variety: params["variety"], flavor: params["flavor"], quantity: params["quantity"], quantity_type: params["quantity_type"])
          redirect '/pantry'
        end
      end
    else
      redirect '/login'
    end
  end
  
  
end