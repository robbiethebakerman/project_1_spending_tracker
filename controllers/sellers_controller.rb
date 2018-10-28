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
  @seller = Seller.find(params[:id])
  erb(:"sellers/edit")
end

get "/sellers/delete/:id" do
  @seller = Seller.find(params[:id])
  erb(:"sellers/destroy")
end

get "/sellers/delete/cannot/used" do
  erb(:"sellers/destroy_failed")
end

post "/sellers/create" do
  @seller = Seller.new(params)
  @seller.save()
  redirect to "/sellers"
end

post "/sellers/update/:id" do
  seller = Seller.new(params)
  seller.update()
  redirect to "/sellers"
end

post "sellers/delete/:id" do
  seller = Seller.find(params[:id])
  transactions = seller.find_transactions()
  if transactions.empty?()
    seller.delete()
    redirect to "/sellers"
  else
    redirect to "/sellers/delete/cannot/used"
  end
end
