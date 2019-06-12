class CategoryController < ApplicationController
  
  get '/categories/:id' do
    if logged_in?
      @category = Category.find_by(id: params[:id])
      erb :'categories/show'
    else
      redirect '/login'
    end
  end
  
end