require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/category')
require_relative('../models/seller')
require_relative('../models/transaction')

get "/sellers" do
  erb(:"sellers/index")
end
