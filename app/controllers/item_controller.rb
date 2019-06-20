class ItemController < ApplicationController
  
  get '/items/new' do
    if logged_in?
      @categories = current_user.pantry.categories
      erb :'items/new'
    else
      redirect '/login'
    end
  end 
  
  post '/items' do
    if logged_in?
      pantry = current_user.pantry
      if params["name"] == ""
        redirect '/items/new'
      else
        if params["category_name"] != "" && params["category_id"] != nil 
          redirect '/items/new'
        elsif params["category_name"] != "" 
          category = pantry.categories.create(name: params["category_name"])
          category.items.create(name: params["name"], brand: params["brand"], variety: params["variety"], flavor: params["flavor"], quantity: params["quantity"], quantity_type: params["quantity_type"])
          redirect '/pantry'
        elsif params["category_id"] != nil
          category = pantry.categories.find(params["category_id"])
          if !pantry.categories.include?(category)
            pantry.categories << category
            pantry.save
          end
          item = category.items.create(name: params["name"], brand: params["brand"], variety: params["variety"], flavor: params["flavor"], quantity: params["quantity"], quantity_type: params["quantity_type"])
          item.save
          redirect '/pantry'
        else
          redirect '/items/new'
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
      @categories = current_user.pantry.categories
      erb :'items/edit'
    else
      redirect '/login'
    end
  end
  
  patch '/items/:id' do
    if logged_in?
      pantry = Pantry.find_by(user_id: current_user.id)
      @item = Item.find(params[:id])
      if pantry.items.include?(@item)
        if params["name"] == "" && params["brand"] == "" && params["variety"] == "" && params["flavor"] == "" && params["quantity"] == "" && params["quantity_type"] == "" && params["category_name"] == nil && params["category_id"] == nil
          redirect "/items/#{params[:id]}/edit"
        elsif params["category_name"] != "" && params["category_id"] != ""
          redirect "/items/#{params[:id]}/edit"
        elsif params["category_id"] != ""
          id = params["category_id"].to_i
          @item.update(name: params["name"], brand: params["brand"], variety: params["variety"], flavor: params["flavor"], quantity: params["quantity"], quantity_type: params["quantity_type"], category_id: id)
          @category = @item.category
          erb :'items/show'
        elsif params["category_name"] != ""
          @category = pantry.categories.create(name: params["category_name"])
          @category.save
          @item.update(name: params["name"], brand: params["brand"], variety: params["variety"], flavor: params["flavor"], quantity: params["quantity"], quantity_type: params["quantity_type"], category_id: @category.id)
          erb :'items/show'
        end
      else
        redirect '/pantry'
      end
    else
      redirect '/login'
    end
  end
  
  delete '/items/:id' do
    if logged_in?
      item = Item.find_by(id: params[:id])
      category = Category.find(item.category_id)
      pantry = Pantry.find_by(user_id: current_user)
      if pantry.items.include?(item)
        item.destroy
        redirect '/pantry'
      else
        redirect '/pantry'
      end
    else
      redirect '/login'
    end
  end
  
  
end