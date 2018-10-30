require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/budget')
require_relative('../models/transaction')

get "/budget/set/:type" do
  @budget = Budget.find_by_type(params[:type])
  erb(:"budgets/edit")
end
