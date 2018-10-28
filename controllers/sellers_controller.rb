require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/category')
require_relative('../models/seller')
require_relative('../models/transaction')

get "/sellers" do
  @sellers = Seller.all_except_none()
  erb(:"sellers/index")
end

get "/sellers/new" do
  erb(:"sellers/new")
end

get "/sellers/edit/:id" do
  erb(:"sellers/edit")
end

post "/sellers/create" do
  @seller = Seller.new(params)
  @seller.save()
  redirect to "/sellers"
end
