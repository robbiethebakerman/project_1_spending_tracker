require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/category')
require_relative('../models/seller')
require_relative('../models/transaction')

get "/categories" do
  @categories = Category.all_except_none()
  erb(:"categories/index")
end

get "/categories/new" do
  erb(:"categories/new")
end

get "/categories/edit/:id" do
  @category = Category.find(params[:id])
  erb(:"categories/edit")
end

get "/categories/delete/:id" do
  @category = Category.find(params[:id])
  erb(:"categories/destroy")
end

get "/categories/delete/cannot/:id" do
  @category = Category.find(params['id'])
  erb(:"categories/destroy_failed")
end

post "/categories/create" do
  @category = Category.new(params)
  @category.save()
  redirect to "/categories"
end

post "/categories/update/:id" do
  category = Category.new(params)
  category.update()
  redirect to "/categories"
end

post "/categories/delete/:id" do
  category = Category.find(params[:id])
  transactions = category.find_transactions()
  if transactions.empty?()
    category.delete()
    redirect to "/categories"
  else
    redirect to "/categories/delete/cannot/#{category.id}"
  end
end
