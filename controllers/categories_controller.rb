require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/category')
require_relative('../models/seller')
require_relative('../models/transaction')

get "/categories" do
  erb(:"categories/index")
end

get "/categories/new" do
  erb(:"categories/new")
end

get "/categories/edit/:id" do
  erb(:"categories/edit")
end
