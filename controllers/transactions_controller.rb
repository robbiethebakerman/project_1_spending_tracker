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
  @transaction = Transaction.find_formatted(id)
  @category = @transaction.find_category
  @seller = @transaction.find_seller
  erb(:"transactions/show")
end

get "/transactions/new" do
  @categories = Category.all()
  @sellers = Seller.all()
  erb(:"transactions/new")
end

get "/transactions/edit/:id" do
  @transaction = Transaction.find_formatted_for_html_edit_form(params[:id])
  # @category = @transaction.find_category
  # @seller = @transaction.find_seller
  @categories = Category.all()
  @sellers = Seller.all()
  erb(:"transactions/edit")
end

post "/transactions/create" do
  @transaction = Transaction.new(params)
  @transaction.save()
  redirect to "/transactions"
end

post "/transactions/update/:id" do
  transaction = Transaction.new(params)
  transaction.update
  redirect to "/transactions"
end
