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
      user = User.find_by(id: current_user.id)
      pantry = Pantry.find_by(user_id: user.id)
      if params["name"] == ""
        redirect '/items/new'
      else
        if params["category_name"] != nil && params["category_id"] != nil 
          redirect '/items/new'
        elsif params["category_name"] != nil 
          category = pantry.categories.create(name: params["category_name"])
          category.items.create(name: params["name"], brand: params["brand"], variety: params["variety"], flavor: params["flavor"], quantity: params["quantity"], quantity_type: params["quantity_type"])
          redirect '/pantry'
        elsif params["category_id"] != nil
          id = params["category_id"].to_i
          category = Category.find(id)
          category.items.create(name: params["name"], brand: params["brand"], variety: params["variety"], flavor: params["flavor"], quantity: params["quantity"], quantity_type: params["quantity_type"])
          redirect '/pantry'
        end
      end
    else
      redirect '/login'
    end
  end
  
  get '/items/:id' do
    if logged_in?
      @item = Item.find_by(id: params[:id])
      @category = Category.find_by(id: @item.category_id)
      erb :'items/show'
    else
      redirect '/login'
    end
  end
  
  get '/items/:id/edit' do
    if logged_in?
      @item = Item.find_by(id: params[:id])
      @category = Category.find_by(id: @item.category_id)
      @categories = Category.all
      erb :'items/edit'
    else
      redirect '/login'
    end
  end
  
  patch '/items/:id' do
    if logged_in?
      if params["name"] == "" && params["brand"] == "" && params["variety"] == "" && params["flavor"] == "" && params["quantity"] == "" && params["quantity_type"] == "" && params["category_name"] == nil && params["category_id"] == nil
        redirect "/items/#{params[:id]}/edit"
      elsif params["category_name"] != "" && params["category_id"] != ""
        redirect "/items/#{params[:id]}/edit"
      elsif params["category_id"] != ""
        id = params["category_id"].to_i
        @item = Item.find(params[:id])
        @item.update(name: params["name"], brand: params["brand"], variety: params["variety"], flavor: params["flavor"], quantity: params["quantity"], quantity_type: params["quantity_type"], category_id: id)
        erb :'items/show'
      elsif params["category_name"] != ""
        pantry = Pantry.find_by(user_id: current_user.id)
        category = pantry.categories.create(name: params["category_name"])
        @item = Item.find(params[:id])
        @item.update(name: params["name"], brand: params["brand"], variety: params["variety"], flavor: params["flavor"], quantity: params["quantity"], quantity_type: params["quantity_type"], category_id: category.id)
        erb :'items/show'
      end
    else
      redirect '/login'
    end
  end
  
  
end