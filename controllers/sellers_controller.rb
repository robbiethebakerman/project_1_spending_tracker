require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/category')
require_relative('../models/seller')
require_relative('../models/transaction')

get "/sellers" do
  @sellers = Seller.all()
  erb(:"sellers/index")
end

get "/sellers/new" do
  erb(:"sellers/new")
end

get "/sellers/edit/:id" do
  erb(:"sellers/edit")
end
