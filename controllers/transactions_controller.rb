require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/category')
require_relative('../models/seller')
require_relative('../models/transaction')

get "/transactions" do
  erb(:"transactions/index")
end

get "/transactions/detail/:id" do
  erb(:"transactions/show")
end

get "/transactions/new" do
  erb(:"transactions/new")
end

get "/transactions/edit/:id" do
  erb(:"transactions/edit")
end
