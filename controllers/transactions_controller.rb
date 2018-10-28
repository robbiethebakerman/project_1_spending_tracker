require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/category')
require_relative('../models/seller')
require_relative('../models/transaction')

get "/transactions" do
  @transactions = Transaction.all_formatted()
  erb(:"transactions/index")
end

get "/transactions/detail/:id" do
  id = params[:id]
  @transaction = Transaction.find(id)
  erb(:"transactions/show")
end

get "/transactions/new" do
  @categories = Category.all()
  @sellers = Seller.all()
  erb(:"transactions/new")
end

get "/transactions/edit/:id" do
  erb(:"transactions/edit")
end

post "/transactions/create" do
  @transaction = Transaction.new(params)
  @transaction.save()
  redirect to "/transactions"
end
