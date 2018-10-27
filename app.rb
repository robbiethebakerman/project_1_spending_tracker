require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/categories_controller')
require_relative('controllers/sellers_controller')
require_relative('controllers/transactions_controller')

get '/' do
  erb(:index)
end
